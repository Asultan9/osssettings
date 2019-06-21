#include "COSSSRootListController.h"
#include "spawn.h"
#include "signal.h"

@implementation COSSSRootListController

- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"Root" target:self] retain];
	}
    UIBarButtonItem *respringButton = [[UIBarButtonItem alloc]  initWithTitle:@"Apply" style:UIBarButtonItemStylePlain target:self action:@selector(respring)];
    respringButton.tintColor=[UIColor colorWithRed:1 green:0.17 blue:0.33 alpha:1];
    [UIView animateWithDuration:.5
                          delay:0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{[self.navigationItem setRightBarButtonItem:respringButton];}
                     completion:nil];
    [(UINavigationItem *)self.navigationItem setRightBarButtonItem:respringButton];
	return _specifiers;
}

-(void) respring{
    
    pid_t respringID;
    char *argv[] = {"/usr/bin/killall", "backboardd", NULL};
    posix_spawn(&respringID, argv[0], NULL, NULL, argv, NULL);
	waitpid(respringID, NULL, WEXITED);
}

@end




@implementation PrefsPageCredits
- (id)specifiers {
    if (_specifiers == nil) {
        _specifiers = [[self loadSpecifiersFromPlistName:@"page-credits" target:self] retain];
    }
    [(UINavigationItem *)self.navigationItem setTitle:@"Credits"];
    return _specifiers;
}
@end



@implementation PrefsCatSpringboard
- (id)specifiers {
    if (_specifiers == nil) {
        _specifiers = [[self loadSpecifiersFromPlistName:@"cat-springboard" target:self] retain];
    }
    [(UINavigationItem *)self.navigationItem setTitle:@"Springboard"];
    return _specifiers;
}
@end

@implementation PrefsCatLockscreen
- (id)specifiers {
    if (_specifiers == nil) {
        _specifiers = [[self loadSpecifiersFromPlistName:@"cat-lockscreen" target:self] retain];
    }
    [(UINavigationItem *)self.navigationItem setTitle:@"Lockscreen"];
    return _specifiers;
}
@end

@implementation PrefsCatStatusBar
- (id)specifiers {
    if (_specifiers == nil) {
        _specifiers = [[self loadSpecifiersFromPlistName:@"cat-statusbar" target:self] retain];
    }
    [(UINavigationItem *)self.navigationItem setTitle:@"Status Bar"];
    return _specifiers;
}
@end

@implementation PrefsCatControlCentre
- (id)specifiers {
    if (_specifiers == nil) {
        _specifiers = [[self loadSpecifiersFromPlistName:@"cat-controlcentre" target:self] retain];
    }
    [(UINavigationItem *)self.navigationItem setTitle:@"Control Centre"];
    return _specifiers;
}
@end

@implementation PrefsCatNotifications
- (id)specifiers {
    if (_specifiers == nil) {
        _specifiers = [[self loadSpecifiersFromPlistName:@"cat-notifications" target:self] retain];
    }
    [(UINavigationItem *)self.navigationItem setTitle:@"Notifications"];
    return _specifiers;
}
@end

@implementation PrefsCatAppSwitcher
- (id)specifiers {
    if (_specifiers == nil) {
        _specifiers = [[self loadSpecifiersFromPlistName:@"cat-appswitcher" target:self] retain];
    }
    [(UINavigationItem *)self.navigationItem setTitle:@"App Switcher"];
    return _specifiers;
}
@end

@implementation PrefsCatSystemWide
- (id)specifiers {
    if (_specifiers == nil) {
        _specifiers = [[self loadSpecifiersFromPlistName:@"cat-systemwide" target:self] retain];
    }
    [(UINavigationItem *)self.navigationItem setTitle:@"System Wide"];
    return _specifiers;
}
@end

@implementation PrefsCatSystemApps
- (id)specifiers {
    if (_specifiers == nil) {
        _specifiers = [[self loadSpecifiersFromPlistName:@"cat-systemapps" target:self] retain];
    }
    [(UINavigationItem *)self.navigationItem setTitle:@"System Apps"];
    return _specifiers;
}
@end
