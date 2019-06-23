@interface NSUserDefaults (UFS_Category)
- (id)objectForKey:(NSString *)key inDomain:(NSString *)domain;
- (void)setObject:(id)value forKey:(NSString *)key inDomain:(NSString *)domain;
@end

@interface SBRootFolderView : UIView // Disable today view interface (Thanks @NepetaDev)

-(UIViewController *)todayViewController;

@end

@interface SBUIController : NSObject

+(instancetype)sharedInstanceIfExists;
-(BOOL)isOnAC;

@end

@interface SBMediaController : NSObject

+(id)sharedInstance;
-(BOOL)isPlaying;
-(BOOL)isPaused;

@end