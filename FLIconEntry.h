@class SBApplication;


@interface FLIconEntry : NSObject
@property (nonatomic, weak) SBApplication *application;
@property (nonatomic, strong) UIImage *image;
-(id)initWithApplication:(SBApplication *)application;
@end