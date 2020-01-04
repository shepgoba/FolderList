
@class SBApplication;

@interface FLTableViewCell : UITableViewCell
@property (nonatomic, weak) SBApplication *application;
@property (nonatomic, strong) UITapGestureRecognizer *appLaunchRecognizer;
-(id)initWithStyle:(unsigned long long)style reuseIdentifier:(NSString *)reuse application:(SBApplication *)application;
@end