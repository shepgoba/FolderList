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
/*-(id)initWithStyle:(unsigned long long)style reuseIdentifier:(NSString *)reuse application:(SBApplication *)application; {
    self = [super initWithStyle:style reuseIdentifier:reuse];
    if (self)  {
        //self.application = selfapplication;

    }
    return self;
}*/
-(void)layoutIfNeeded {
    [super layoutIfNeeded];
    self.badgeView.center = CGPointMake(self.frame.size.width - 35, self.frame.size.height / 2);
    self.badgeTextLabel.center = CGPointMake(self.badgeView.frame.size.width / 2, self.badgeView.frame.size.height / 2);
}

-(void)setupBadgeView:(NSString *)badgeText {
    self.badgeView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    self.badgeView.layer.cornerRadius = self.badgeView.frame.size.width / 2;
    self.badgeView.backgroundColor = [UIColor redColor];

    self.badgeTextLabel = [[UILabel alloc] init];
    self.badgeTextLabel.text = badgeText;
    self.badgeTextLabel.textAlignment = NSTextAlignmentCenter;
    self.badgeTextLabel.font = [UIFont boldSystemFontOfSize:12];
    [self.badgeTextLabel sizeToFit];

    [self addSubview:self.badgeView];
    [self.badgeView addSubview: self.badgeTextLabel];
}
-(void)removeBadgeView {
    [self.badgeView removeFromSuperview];
    self.badgeView = nil;
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

/*-(void)setSelectedBackgroundView:(UIView *)view {
    UIView *newView = [[UIView alloc] initWithFrame:self.frame];
	newView.backgroundColor = [UIColor colorWithRed:0.3 green:0.3 blue:0.3 alpha:0.75];
    newView.layer.cornerRadius = 16;
    [super setSelectedBackgroundView:newView];
}*/

-(void) launchApp {
    AudioServicesPlaySystemSound(1519);
    if (@available(iOS 12, *)) {
        [[objc_getClass("SBUIController") sharedInstanceIfExists] activateApplication:self.entry.application fromIcon:nil location:nil activationSettings:nil actions:nil];
    } else {
        [[objc_getClass("SBUIController") sharedInstanceIfExists] activateApplication:self.entry.application fromIcon:nil location:1];
    }
}
@end