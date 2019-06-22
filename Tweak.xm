
// Preferences setup
#import <Foundation/NSUserDefaults.h>

static NSString *domainString = @"com.castyte.osssettings";

@interface NSUserDefaults (UFS_Category)
- (id)objectForKey:(NSString *)key inDomain:(NSString *)domain;
- (void)setObject:(id)value forKey:(NSString *)key inDomain:(NSString *)domain;
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
		%init(main);
	}
}