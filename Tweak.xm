#import "FLTableViewCell.h"
#import "FLIconEntry.h"
#import <CoreGraphics/CoreGraphics.h>
#import <MobileCoreServices/MobileCoreServices.h>

static UITableView *sharedTableView;

#define ALERT(str) [[[UIAlertView alloc] initWithTitle:@"alert" message:str delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil] show]
@interface UIApplication (poop)
- (void) launchApplicationWithIdentifier: (NSString*)identifier suspended: (BOOL)suspended;
@end
@interface SBWorkspaceEntity
+(id)entity;
-(void)setFlag:(long long)arg1 forActivationSetting:(unsigned)arg2 ;

@end
@interface SBIconListView : UIView
-(id)initWithModel:(id)arg1 layoutProvider:(id)arg2 iconLocation:(id)arg3 orientation:(long long)arg4 iconViewProvider:(id)arg5 ;
-(void)removeIconAtIndex:(unsigned long long)arg1 ;
-(void)removeIconView:(id)arg1 ;
-(void)removeAllIconViews;
@property (nonatomic,weak) id iconViewProvider;       
-(id)visibleIcons;
-(NSArray *)icons;
-(void)hideIcons;
-(void)hideAllIcons;
-(void)removeIcon:(id)arg1;
@property (nonatomic, assign) BOOL isInFolder;
@end
@interface SBFolderBackgroundView : UIView
@end

@interface SBFloatyFolderBackgroundClipView : UIView
@property (nonatomic,readonly) SBFolderBackgroundView * backgroundView; 
@end

@interface SBActivationSettings : NSObject 
-(void)setFlag:(long long)arg1 forActivationSetting:(unsigned)arg2 ;

@end

@interface SBApplicationInfo
-(id)initWithApplicationProxy:(id)arg1;
@end

@interface SBApplication
-(NSString *)bundleIdentifier;
-(NSString *)displayName;
-(id)initWithApplicationInfo:(id)arg1 ;
@end

@interface SBApplicationIcon
-(id)initWithApplication:(SBApplication *)application;
-(id)application;
@end

@interface SBFolder : NSObject
-(NSArray *)icons;
-(BOOL)isRootFolder;
+(BOOL)isRootFolderClass;
-(id)allIcons;
-(id)folderIcons;
-(id)insertIcon:(id)arg1 atIndexPath:(id*)arg2 options:(unsigned long long)arg3 ;

@property (nonatomic,assign) BOOL hasAddedFakeIcons;
@end

@interface SBFolderView : UIView
@property (nonatomic,readonly) UIScrollView * scrollView;  
@end

@interface SBIconListPageControl : UIPageControl
@end

//extern int SBSLaunchApplicationWithIdentifier(CFStringRef identifier, Boolean suspended);
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
+ (UIImage *)_applicationIconImageForBundleIdentifier:(NSString *)bundleIdentifier format:(int)format scale:(CGFloat)scale;
+ (UIImage *)_applicationIconImageForBundleIdentifier:(NSString *)bundleIdentifier format:(int)format;
@end
@interface SBUIController
-(void)activateApplication:(id)arg1 fromIcon:(id)arg2 location:(id)arg3 activationSettings:(id)arg4 actions:(id)arg5 ;
+(id)sharedInstanceIfExists;
@end

@interface SBFloatyFolderView : UIView {
	NSMutableArray* _iconListViews;
	unsigned long long _iconListViewCount;
}
@property (nonatomic,readonly) UIScrollView * scrollView;  
@property (nonatomic,copy,readonly) NSArray * iconListViews;
@property (nonatomic,readonly) unsigned long long pageCount;
@property (nonatomic,readonly) unsigned long long iconListViewCount;
@property (nonatomic,assign) BOOL hasAddedFolderView;
@property (nonatomic,readonly) long long currentPageIndex;
//@property (nonatomic,weak) SBFloatyFolderController *controller;

-(BOOL)setCurrentPageIndex:(long long)arg1 animated:(BOOL)arg2 ;
-(void)_setCurrentPageIndex:(long long)arg1 ;
@end

@interface SBFolderController : UIViewController <UITableViewDataSource, UITableViewDelegate, UIGestureRecognizerDelegate>
@property (nonatomic, readonly) SBFloatyFolderView * folderView; 
@property (nonatomic, strong) UITableView *appListTableView;
@property (nonatomic, strong) NSString *cellReuseIdentifier;
@property (nonatomic, strong) SBFolder *folder;
@property (nonatomic, strong) NSArray *icons;
@property (nonatomic, strong) SBIconListView *customListView;
@property (nonatomic, strong) SBIconListPageControl *pageControl;
@property (nonatomic,readonly) long long maximumPageIndex;
@property (nonatomic,copy,readonly) NSArray * iconListViews;
@property (nonatomic, strong) NSMutableArray *appViews;
@property (nonatomic, strong) UIScrollView *appListScrollView;
@property (nonatomic, strong) NSMutableArray *iconEntries;
- (CAAnimation*)getShakeAnimation;
-(void)setupAppViews;
-(void)setupAppList;
-(BOOL)setCurrentPageIndex:(long long)arg1 animated:(BOOL)arg2 ;
-(id)addEmptyListView;
-(void)deselectAllRows;
-(void)setupIconEntries;
@end

@interface SBIconListModel : NSObject
@property (nonatomic,copy) NSArray * icons; 
-(id)initWithFolder:(id)arg1 maxIconCount:(unsigned long long)arg2 ;
-(BOOL)addIcon:(id)arg1 ;
-(void)addIcons:(id)arg1;
-(id)insertIcon:(id)arg1 atIndex:(unsigned long long)arg2 options:(unsigned long long)arg3 ;
@property (nonatomic,weak,readonly) SBFolder * folder; 
@end
@interface SBIconIndexMutableList
@end

@interface LSApplicationProxy
+ (instancetype)applicationProxyForIdentifier:(NSString *)identifier;
@end
@interface SBIconView : UIView

@end

@interface SBFolderIcon
@property (nonatomic,readonly) SBFolder * folder; 
@end
@interface SBApplicationController : NSObject
+(id)sharedInstanceIfExists;
-(void)requestUninstallApplicationWithBundleIdentifier:(id)arg1 withCompletion:(id)arg2;
-(void)uninstallApplication:(id)arg1 ;

@end
@interface SBIconGridImage : UIImage
@end

@interface _SBFolderPageElement : NSObject
@property (nonatomic,weak) SBFolderIcon * folderIcon; 
@end
@interface _SBIconGridWrapperView : UIImageView
@property (nonatomic, strong) UIImage *newImage;
@property (nonatomic,retain) _SBFolderPageElement * element;
@property (nonatomic, strong) NSArray *icons;
@property (nonatomic, assign) BOOL hasLoadedNewImage;
-(UIImage *) drawNewIconInRect:(CGRect)rect;
@end
@interface SBFolderIconListView : SBIconListView
@end
//%group Tweak12
%hook SBFolderIconListView
-(id)initWithModel:(id)arg1 orientation:(long long)arg2 viewMap:(id)arg3 {
	SBIconListModel *customModel = [[%c(SBIconListModel) alloc] initWithFolder:((SBIconListModel *)arg1).folder maxIconCount:0];
	return %orig(customModel, arg2, arg3);
}

%new
-(void) hideIcons {

}
%end
//%end
%group Tweak12
%hook SBFolderView
-(unsigned long long)iconListViewCount {
	return 1;
}
%end
%end

%group Tweak13
%hook SBFloatyFolderView
-(unsigned long long)iconListViewCount {
	return 1;
}
%end
%end

static BOOL ios13;
%hook SBFolderController
%property (nonatomic, strong) NSArray *icons; 
%property (nonatomic, strong) UITableView *appListTableView;
%property (nonatomic, strong) SBIconListView *customListView;
%property (nonatomic, strong) NSString *cellReuseIdentifier;
%property (nonatomic, strong) NSMutableArray *iconEntries;
/*
%property (nonatomic, strong) NSMutableArray *appViews;
%property (nonatomic, strong) UIScrollView *appListScrollView;*/

//-(void)folderView:(id)arg1 willAnimateScrollToPageIndex:(long long)arg2


%new
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 52;//self.customListView ? self.customListView.frame.size.height / 5 : 52;
}

-(void)setFolder:(SBFolder *)arg1 {
	%orig;
	/*if ([self isKindOfClass:%c(SBRootFolderWithDock)] || [self isKindOfClass:%c(SBRootFolderController)])
		return;*/
	if (![self isMemberOfClass:%c(SBFolderController)] && ![self isMemberOfClass:%c(SBFloatyFolderController)]) {
		return;
	}
	NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"displayName" ascending:YES selector:@selector(localizedCaseInsensitiveCompare:)];
	if (ios13) {
		self.icons = [arg1.icons sortedArrayUsingDescriptors:@[sortDescriptor]];
	} else {
		self.icons = [arg1.allIcons sortedArrayUsingDescriptors:@[sortDescriptor]];
	}
}

%new
-(void)setupIconEntries {
	self.iconEntries = [NSMutableArray new];
	//dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH,  0ul), ^{
		for (SBApplicationIcon *icon in self.icons) {
			FLIconEntry *newEntry = [[FLIconEntry alloc] initWithApplication:icon.application];
			[self.iconEntries addObject: newEntry];
		}
	//});
}

-(void)viewDidLoad {
	%orig;
	/*if ([self isKindOfClass:%c(SBRootFolderWithDock)] || [self isKindOfClass:%c(SBRootFolderController)])
		return;*/
	if ((![self isMemberOfClass:%c(SBFolderController)] && ![self isMemberOfClass:%c(SBFloatyFolderController)]) || [self isKindOfClass:%c(SBRootFolderController)]) {
		return;
	}
	self.cellReuseIdentifier = @"FLCells";
	self.customListView = self.iconListViews.firstObject;
	[self setupAppList];
	[self setupIconEntries];
	if (ios13) {
		[self.customListView hideAllIcons];
	} else {
		[self.customListView hideIcons];
	}


	[self.appListTableView registerClass:[FLTableViewCell class] forCellReuseIdentifier: self.cellReuseIdentifier];
	[self.customListView addSubview: self.appListTableView];

	self.appListTableView.allowsMultipleSelectionDuringEditing = NO;
	UILongPressGestureRecognizer *lpgr = [[UILongPressGestureRecognizer alloc] 
	initWithTarget:self action:@selector(handleLongPress:)];
	lpgr.minimumPressDuration = 2.0; //seconds
	lpgr.delegate = self;
	[self.appListTableView addGestureRecognizer:lpgr];
}/*
-(void)viewDidLayoutSubviews {
	%orig;
	NSLog(@"setting");
	self.appListScrollView.contentSize = CGSizeMake(self.appListScrollView.frame.size.width, self.icons.count * 62 + 10);
}*/
%new 
-(void)setupAppViews {
	/*NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"displayName" ascending:YES selector:@selector(localizedCaseInsensitiveCompare:)];
	self.icons = [self.folder.icons sortedArrayUsingDescriptors:@[sortDescriptor]];

	self.appViews = [NSMutableArray new];
	self.appListScrollView = [[UIScrollView alloc] initWithFrame:self.customListView.bounds];
	self.appListScrollView.layer.cornerRadius = 38;
	self.appListScrollView.contentSize = CGSizeMake(self.appListScrollView.frame.size.width, self.icons.count * 62 + 10);
	[self.customListView addSubview:self.appListScrollView];

	for (int i = 0; i < self.icons.count; i++) {
		FLAppView *newAppView = [[FLAppView alloc] init];
		[newAppView setupWithSuperview:self.appListScrollView viewYOffset:10 + i*62 applicationIcon:[self.icons objectAtIndex:i]];
		[self.appViews addObject: newAppView];
	}*/
}
%new
- (CAAnimation*)getShakeAnimation {
    CAKeyframeAnimation* animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];

    CGFloat wobbleAngle = 0.06f;

    NSValue* valLeft = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(wobbleAngle, 0.0f, 0.0f, 1.0f)];
    NSValue* valRight = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(-wobbleAngle, 0.0f, 0.0f, 1.0f)];
    animation.values = [NSArray arrayWithObjects:valLeft, valRight, nil];

    animation.autoreverses = YES;  
    animation.duration = 0.125;
    animation.repeatCount = HUGE_VALF;  

    return animation;    
}
%new
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	//[[%c(SBUIController) sharedInstanceIfExists] activateApplication:[(SBApplicationIcon *)self.icons[indexPath.section] application] fromIcon:nil location:nil activationSettings:nil actions:nil];
	[self.appListTableView deselectRowAtIndexPath:indexPath animated:YES];
	//[UIApplication sharedApplication] launchApplicationWithIdentifier:[[self.icons[indexPath.section] application] bundleIdentifier] suspended:NO];
}
%new
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
		SBApplication *application = [self.icons[indexPath.section] application];
        [[%c(SBApplicationController) sharedInstanceIfExists] requestUninstallApplicationWithBundleIdentifier:[application bundleIdentifier] withCompletion:^{
			[self.appListTableView reloadData];
		}];

    }    
}
%new
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.icons.count;
}

%new
-(void)deselectAllRows {
	for (NSIndexPath *indexPath in self.appListTableView.indexPathsForSelectedRows) {
    	[self.appListTableView deselectRowAtIndexPath:indexPath animated:YES];
	}
}
//%new
/*
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
	
	if (self.loadImages) {
		UIImage *newImage = [UIImage _applicationIconImageForBundleIdentifier:application.bundleIdentifier format:10];
		cell.imageView.image = newImage;
		CGSize itemSize = CGSizeMake(30, 30);
		UIGraphicsBeginImageContextWithOptions(itemSize, NO, UIScreen.mainScreen.scale);
		CGRect imageRect = CGRectMake(0.0, 0.0, itemSize.width, itemSize.height);
		[cell.imageView.image drawInRect:imageRect];
		cell.imageView.image = UIGraphicsGetImageFromCurrentImageContext();
		UIGraphicsEndImageContext();
	}
}*/
-(void)setEditing:(BOOL)arg1 animated:(BOOL)arg2 {
	%orig;
	if (ios13) {
		[self.customListView hideAllIcons];
	} else {
		[self.customListView hideIcons];
		if (arg1) {
			//[self addEmptyListView];
		}
	}
}
%new
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return 1;
}

- (void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection {
	%orig;
	[self.appListTableView reloadData];
}
%new
-(void)handleLongPress:(UILongPressGestureRecognizer *)gestureRecognizer {
	if (gestureRecognizer.state == UIGestureRecognizerStateRecognized) {
	}
	if (gestureRecognizer.state == UIGestureRecognizerStateEnded) {
		CGPoint touchPoint = [gestureRecognizer locationInView:self.appListTableView];
		NSIndexPath *row = [self.appListTableView indexPathForRowAtPoint:touchPoint];
		if (row != nil) {
			SBApplication *application = [self.icons[row.section] application];
			NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"displayName" ascending:YES selector:@selector(localizedCaseInsensitiveCompare:)];
			if (@available(iOS 11, *)) {
				[[%c(SBApplicationController) sharedInstanceIfExists] requestUninstallApplicationWithBundleIdentifier:application.bundleIdentifier withCompletion: ^{
					if (ios13) {
						self.icons = [self.folder.icons sortedArrayUsingDescriptors:@[sortDescriptor]];
					} else {
						self.icons = [self.folder.allIcons sortedArrayUsingDescriptors:@[sortDescriptor]];
					}
					[self.appListTableView reloadData];
				}];
			} else {
				UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Confirm Deletion"
							message:[NSString stringWithFormat:@"Are you sure you want to uninstall \"%@\"?", application.displayName]
							preferredStyle:UIAlertControllerStyleAlert];

				UIAlertAction* deleteAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDestructive
											handler:^(UIAlertAction * action) {
												[[%c(SBApplicationController) sharedInstanceIfExists] uninstallApplication:application];
											}];
				UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDefault
											handler:nil];
				[alert addAction:deleteAction];
				[alert addAction:defaultAction];
				[self presentViewController:alert animated:YES completion:nil];
			}
		}
	}
}
%new
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	FLTableViewCell *cell = [self.appListTableView dequeueReusableCellWithIdentifier:self.cellReuseIdentifier forIndexPath:indexPath];
	FLIconEntry *entry = self.iconEntries[indexPath.section];
	//cell.imageView.image = entry.image;
	cell.entry = entry;
	cell.textLabel.text = entry.application.displayName;
	cell.textLabel.backgroundColor = [UIColor clearColor];
	//cell.selectionStyle = UITableViewCellSelectionStyleNone;
	//cell.application = application;
	cell.appLaunchRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:cell action:@selector(launchApp)];
	[cell addGestureRecognizer:cell.appLaunchRecognizer];

	UIView *myBackView = [[UIView alloc] initWithFrame:cell.frame];
	myBackView.backgroundColor = [UIColor colorWithRed:0.3 green:0.3 blue:0.3 alpha:0.75];
	myBackView.layer.cornerRadius = 16;
	cell.selectedBackgroundView = myBackView;
	cell.layer.cornerRadius = 16;

    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH,  0ul), ^{
		SBApplication *application = ((FLIconEntry *)self.iconEntries[indexPath.section]).application;
		UIImage *cellImage;
		if (!ios13) {
			cellImage = [UIImage _applicationIconImageForBundleIdentifier:application.bundleIdentifier format:0 scale:[UIScreen mainScreen].scale];
		} else {
			cellImage = [UIImage _applicationIconImageForBundleIdentifier:application.bundleIdentifier format:10];
		}
        dispatch_sync(dispatch_get_main_queue(), ^{
            FLTableViewCell *cell = (FLTableViewCell *)[self.appListTableView cellForRowAtIndexPath:indexPath];
            cell.imageView.image = cellImage;
            [cell setNeedsLayout];
        });
    });
	
	if (@available(iOS 13, *)) {
		if (self.traitCollection.userInterfaceStyle == UIUserInterfaceStyleDark) {
			cell.backgroundColor = [UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha: 0.4];
		} else {
			cell.backgroundColor = [UIColor colorWithRed:0.85 green:0.85 blue:0.85 alpha: 0.65];
		}
	} else {
		cell.backgroundColor = [UIColor colorWithRed:0.85 green:0.85 blue:0.85 alpha: 0.65];
	}

	return cell;
}
%new
-(void)setupAppList {
	NSLog(@"got here");
	self.appListTableView = [[UITableView alloc] initWithFrame:self.customListView.bounds];
	//self.appListTableView.frame = self.customListView.bounds;
	self.appListTableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, self.appListTableView.bounds.size.width, 25)];
	self.appListTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, self.appListTableView.bounds.size.width, 25)];
	self.appListTableView.backgroundColor = [UIColor clearColor];
	self.appListTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
	self.appListTableView.delegate = self;
	self.appListTableView.dataSource = self;
	self.appListTableView.layer.cornerRadius = 38;
	self.appListTableView.scrollIndicatorInsets = UIEdgeInsetsMake(38, 0, 38, 0);
	//SBFloatyFolderBackgroundClipView *folderBackgroundClipView = (SBFloatyFolderBackgroundClipView *) self.appListTableView.superview;
	//NSLog(@"%@ is, ", folderBackgroundClipView);
	//self.appListTableView.layer.cornerRadius = 38;//MSHookIvar<double>(folderBackgroundClipView.backgroundView, "_continuousCornerRadius");
	//NSLog(@"%f is", [[folderBackgroundClipView.backgroundView valueForKey:@"_continuousCornerRadius"] doubleValue]);
	//self.hasSetupAppList = YES;
}
%new
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 8;
}

%new
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *v = [UIView new];
    [v setBackgroundColor:[UIColor clearColor]];
    return v;
}

%end

%ctor {
	NSLog(@"called");
	if (@available(iOS 13, *)) {
		ios13 = YES;
		%init(Tweak13);
	} else {
		ios13 = NO;
		%init(Tweak12);
	}
	//sharedTableView = [[UITableView alloc] init];
	//%init(FolderControllerClass = ios13 ? SBFloatyFolderController : yeet )
	%init(_ungrouped);
}