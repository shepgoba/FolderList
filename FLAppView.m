#import "FLAppView.h"

@interface SBApplication
-(NSString *)bundleIdentifier;
-(NSString *)displayName;
-(id)initWithApplicationInfo:(id)arg1 ;

@end

@interface SBApplicationIcon
-(id)initWithApplication:(SBApplication *)application;
-(SBApplication *)application;
@end

@interface UIImage (UIApplicationIconPrivate)
/*
 @param format
    0 - 29x29
    1 - 40x40
    2 - 62x62
    3 - 42x42
    4 - 37x48
    5 - 37x48
    6 - 82x82
    7 - 62x62
    8 - 20x20
    9 - 37x48
    10 - 37x48
    11 - 122x122
    12 - 58x58
 */
+ (UIImage *)_applicationIconImageForBundleIdentifier:(NSString *)bundleIdentifier format:(int)format;
@end

@implementation FLAppView
-(id)initWithApplication:(SBApplication *)app {

}
-(CGSize)intrinsicContentSize {
    return CGSizeMake(0, 52);
}
-(void)layoutSubviews {
    [super layoutSubviews];
    self.appImageView.bounds = CGRectMake(0, 0, 32, 32);
}
-(void)setupWithSuperview:(UIView *)sprview viewYOffset:(float)offset applicationIcon:(SBApplicationIcon *)icon {
    [sprview addSubview: self];
    self.icon = icon;

    static int inset = 25;
    self.frame = CGRectMake(inset, offset, sprview.frame.size.width - inset * 2, 52);

    if (@available(iOS 13, *)) {
		if (self.traitCollection.userInterfaceStyle == UIUserInterfaceStyleDark) {
			self.backgroundColor = [UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha: 0.4];
		} else {
			self.backgroundColor = [UIColor colorWithRed:0.65 green:0.65 blue:0.65 alpha: 0.4];
		}
	} else {
		self.backgroundColor = [UIColor colorWithRed:0.65 green:0.65 blue:0.65 alpha: 0.4];
	}
    self.layer.cornerRadius = 14;

    SBApplication *application = self.icon.application;

    self.appNameLabel = [[UILabel alloc] init];
    self.appNameLabel.text = application.displayName;
    self.appNameLabel.textAlignment = NSTextAlignmentLeft;
    [self.appNameLabel sizeToFit];
    [self addSubview:self.appNameLabel];
    self.appNameLabel.translatesAutoresizingMaskIntoConstraints = NO;

    [self.appNameLabel.centerXAnchor constraintEqualToAnchor:self.centerXAnchor].active = YES;
    [self.appNameLabel.centerYAnchor constraintEqualToAnchor:self.centerYAnchor].active = YES;

    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH,  0ul), ^{
		SBApplication *application = self.icon.application;
		UIImage *appImage = [UIImage _applicationIconImageForBundleIdentifier:application.bundleIdentifier format:10];
        dispatch_sync(dispatch_get_main_queue(), ^{
                //UIImage *appImage = [UIImage _applicationIconImageForBundleIdentifier:application.bundleIdentifier format:10];
                self.appImageView = [[UIImageView alloc] initWithImage:appImage];
                self.appImageView.translatesAutoresizingMaskIntoConstraints = NO;

                [self addSubview:self.appImageView];
                [self.appImageView.leadingAnchor constraintEqualToAnchor:self.leadingAnchor constant:10].active = YES;
                [self.appImageView.centerYAnchor constraintEqualToAnchor:self.centerYAnchor].active = YES;
        });
    });

    UIImage *appImage = [UIImage _applicationIconImageForBundleIdentifier:application.bundleIdentifier format:10];
    self.appImageView = [[UIImageView alloc] initWithImage:appImage];
    self.appImageView.translatesAutoresizingMaskIntoConstraints = NO;

    [self addSubview:self.appImageView];
    [self.appImageView.leadingAnchor constraintEqualToAnchor:self.leadingAnchor constant:10].active = YES;
    [self.appImageView.centerYAnchor constraintEqualToAnchor:self.centerYAnchor].active = YES;


    /*self.translatesAutoresizingMaskIntoConstraints = false;
    [self.centerXAnchor constraintEqualToAnchor:sprview.centerXAnchor].active = YES;
    [self.leadingAnchor constraintEqualToAnchor:sprview.leadingAnchor constant:25].active = YES;
    [self.trailingAnchor constraintEqualToAnchor:sprview.trailingAnchor constant:-25].active = YES;
    [self.topAnchor constraintEqualToAnchor:sprview.topAnchor constant:offset].active = YES;*/
    //[self.heightAnchor constraintEqualToAnchor:]
}

@end