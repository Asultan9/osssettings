#import <Foundation/NSUserDefaults.h>

// Preferences interfaces

@interface NSUserDefaults (UFS_Category)
- (id)objectForKey:(NSString *)key inDomain:(NSString *)domain;
- (void)setObject:(id)value forKey:(NSString *)key inDomain:(NSString *)domain;
@end


%group main


%end



%ctor {
	// Check if the tweak is enabled, if it is run group 'main'
	static NSString *domainString = @"com.castyte.osssettings";
	if ([(NSNumber *)[[NSUserDefaults standardUserDefaults] objectForKey:@"tweakEnabled" inDomain:domainString] boolValue]) {
		%init(main);
	}
}