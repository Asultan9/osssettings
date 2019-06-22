
// Preferences setup
#import <Foundation/NSUserDefaults.h>

static NSString *domainString = @"com.castyte.osssettings";
BOOL SBTodayHomeDisabled;
BOOL SBTodayLSDisabled;

@interface NSUserDefaults (UFS_Category)
- (id)objectForKey:(NSString *)key inDomain:(NSString *)domain;
- (void)setObject:(id)value forKey:(NSString *)key inDomain:(NSString *)domain;
@end

@interface SBRootFolderView : UIView // Disable today view interface (Thanks @NepetaDev)

-(UIViewController *)todayViewController;

@end


%group main


// ---------- CATEGORY: Springboard (SB)

// ---- SECTION: Dock

%hook SBDockView

-(void)setBackgroundAlpha:(CGFloat)arg1{ // Custom Dock Alpha
	if([(NSNumber *)[[NSUserDefaults standardUserDefaults] objectForKey:@"SBdockAlphaEnabled" inDomain:domainString] boolValue]){
		return %orig([[[NSUserDefaults standardUserDefaults] objectForKey:@"SBdockAlpha" inDomain:domainString] floatValue]);
	}

	%orig();
}

%end


// ---- SECTION: Other

%hook SpringBoard

-(long long)homeScreenRotationStyle { // Disble rotation on + devices
	if([(NSNumber *)[[NSUserDefaults standardUserDefaults] objectForKey:@"SBrotationDisabled" inDomain:domainString] boolValue]){
		return 0;
	}
	return %orig;
}

-(BOOL)homeScreenRotationStyleWantsUIKitRotation { // Disble rotation on + devices
	if([(NSNumber *)[[NSUserDefaults standardUserDefaults] objectForKey:@"SBrotationDisabled" inDomain:domainString] boolValue]){
		return NO;
	}
	return %orig;
}

-(BOOL)homeScreenSupportsRotation { // Disble rotation on + devices
	if([(NSNumber *)[[NSUserDefaults standardUserDefaults] objectForKey:@"SBrotationDisabled" inDomain:domainString] boolValue]){
		return NO;
	}
	return %orig;
}

%end


%hook SBMainDisplayPolicyAggregator

-(BOOL)_allowsCapabilityLockScreenTodayViewWithExplanation:(id*)arg1 { // Disable today view LS (Thanks @NepetaDev)
    return !(SBTodayLSDisabled);
}

-(BOOL)_allowsCapabilityTodayViewWithExplanation:(id*)arg1 { // Disable today view LS (Thanks @NepetaDev)
    return !(SBTodayLSDisabled);
}

%end

%hook SBRootFolderView

-(unsigned long long)_minusPageCount { // Disable today view HOME (Thanks @NepetaDev)
    return !(SBTodayHomeDisabled);
}

-(void)_layoutSubviewsForTodayView { // Disable today view HOME (Thanks @NepetaDev)
    %orig;
    [self todayViewController].view.hidden = SBTodayHomeDisabled;
}

-(void)beginPageStateTransitionToState:(long long)arg1 animated:(BOOL)arg2 interactive:(BOOL)arg3  { // Disable today view HOME (Thanks @NepetaDev)
    if (SBTodayHomeDisabled && arg1 == 2) return; // 0 - icons; 2 - today view; 3 - spotlight?
    %orig;
}

%end


// ---------- CATEGORY: System Apps (SA)

// ---- APP: Settings

%hook PSUIPrefsListController


-(BOOL)_showSOS{ //  Hide SOS Section
	if([(NSNumber *)[[NSUserDefaults standardUserDefaults] objectForKey:@"SAhideSOS" inDomain:domainString] boolValue]){
		return NO;
	}
	return %orig;
}

-(void)setWifiString:(id)arg1{ // Wifi Connected String
	NSString *SAwifiString = [[NSUserDefaults standardUserDefaults] objectForKey:@"SAwifiString" inDomain:domainString];
	if([SAwifiString isEqual:@""]){
		SAwifiString = arg1;
	}
	%orig(SAwifiString);
}

-(void)setBluetoothString:(id)arg1{ // Bluetooth Connected String
	NSString *SAbluetoothString = [[NSUserDefaults standardUserDefaults] objectForKey:@"SAbluetoothString" inDomain:domainString];
	if([SAbluetoothString isEqual:@""]){
		SAbluetoothString = arg1;
	}
	%orig(SAbluetoothString);
}

%end


%end


%ctor{
	// Check if main switch is enabled, if is run main group
	if([(NSNumber *)[[NSUserDefaults standardUserDefaults] objectForKey:@"tweakEnabled" inDomain:domainString] boolValue]){
		SBTodayHomeDisabled = [(NSNumber *)[[NSUserDefaults standardUserDefaults] objectForKey:@"SBTodayHomeDisabled" inDomain:domainString] boolValue];
		SBTodayLSDisabled = [(NSNumber *)[[NSUserDefaults standardUserDefaults] objectForKey:@"SBTodayLSDisabled" inDomain:domainString] boolValue];
		%init(main);
	}
}