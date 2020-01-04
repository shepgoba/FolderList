#import "FLTableViewCell.h"
#import <objc/runtime.h>
#import <AudioToolbox/AudioToolbox.h>

@interface SBUIController
/* iOS 12, 13 */
-(void)activateApplication:(id)arg1 fromIcon:(id)arg2 location:(id)arg3 activationSettings:(id)arg4 actions:(id)arg5 ;

/* iOS 10 */
-(void)activateApplication:(id)arg1 fromIcon:(id)arg2 location:(int)arg3 ;

+(id)sharedInstanceIfExists;
@end

@implementation FLTableViewCell
-(id)initWithStyle:(unsigned long long)style reuseIdentifier:(NSString *)reuse application:(SBApplication *)application; {
    self = [super initWithStyle:style reuseIdentifier:reuse];
    if (self)  {
        //self.application = selfapplication;

    }
    return self;
}
- (void)setFrame:(CGRect)frame {
    frame.origin.x += 25;
    frame.size.width -= 2 * 25;
    [super setFrame:frame];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.imageView.bounds = CGRectMake(0,0,32,32);
}
-(void) launchApp {
    AudioServicesPlaySystemSound(1519);
    if (@available(iOS 12, *)) {
        [[objc_getClass("SBUIController") sharedInstanceIfExists] activateApplication:self.entry.application fromIcon:nil location:nil activationSettings:nil actions:nil];
    } else {
        [[objc_getClass("SBUIController") sharedInstanceIfExists] activateApplication:self.entry.application fromIcon:nil location:1];
    }
}
@end