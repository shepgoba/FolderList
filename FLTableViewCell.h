#import "FLIconEntry.h"
@class SBApplication;


@interface FLTableViewCell : UITableViewCell
@property (nonatomic, weak) FLIconEntry *entry;
//@property (nonatomic, weak) UITableView *parent;
@property (nonatomic, strong) UITapGestureRecognizer *appLaunchRecognizer;
-(id)initWithStyle:(unsigned long long)style reuseIdentifier:(NSString *)reuse application:(SBApplication *)application;
@end