@class SBApplicationIcon;

@interface FLAppView : UIView
@property (nonatomic, strong) UIImageView *appImageView;
@property (nonatomic, strong) UILabel *appNameLabel;
@property (nonatomic, weak) SBApplicationIcon *icon;
-(void) setupWithSuperview:(UIView *)sprview viewYOffset:(float)offset applicationIcon:(SBApplicationIcon *)icon;
@end