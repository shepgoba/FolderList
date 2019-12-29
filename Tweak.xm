#import "FLTableViewCell.h"
#import <CoreGraphics/CoreGraphics.h>
#import <MobileCoreServices/MobileCoreServices.h>


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

@interface SBFloatyFolderController : UIViewController <UITableViewDataSource, UITableViewDelegate, UIGestureRecognizerDelegate>
@property (nonatomic, readonly) SBFloatyFolderView * folderView; 
@property (nonatomic, strong) UITableView *appListTableView;
@property (nonatomic, strong) NSString *cellReuseIdentifier;
@property (nonatomic, strong) SBFolder *folder;
@property (nonatomic, strong) NSArray *icons;
@property (nonatomic, assign) BOOL hasSetupAppList;
@property (nonatomic, strong) SBIconListView *customListView;
@property (nonatomic, strong) SBIconListPageControl *pageControl;
@property (nonatomic,readonly) long long maximumPageIndex;
@property (nonatomic, assign) BOOL loadImages;
@property (nonatomic,copy,readonly) NSArray * iconListViews; 
-(void)setupAppList;
-(BOOL)setCurrentPageIndex:(long long)arg1 animated:(BOOL)arg2 ;
-(id)addEmptyListView;
@end

@interface SBIconListModel : NSObject
@property (nonatomic,copy) NSArray * icons; 
-(id)initWithFolder:(id)arg1 maxIconCount:(unsigned long long)arg2 ;
-(BOOL)addIcon:(id)arg1 ;
-(void)addIcons:(id)arg1;
-(id)insertIcon:(id)arg1 atIndex:(unsigned long long)arg2 options:(unsigned long long)arg3 ;

@end
@interface SBIconIndexMutableList
@end

@interface LSApplicationProxy
+ (instancetype)applicationProxyForIdentifier:(NSString *)identifier;
@end
@interface SBIconView : UIView

@end
/*%hook SBFolder
%property (nonatomic, assign) BOOL hasAddedFakeIcons;
-(id)initWithUniqueIdentifier:(id)arg1 displayName:(id)arg2 maxListCount:(unsigned long long)arg3 maxIconCountInLists:(unsigned long long)arg4 {
	self = %orig;
	if (self) {
		self.hasAddedFakeIcons = NO;
	}
	return self;
}
-(void)_addList:(id)arg1 {
	if (!self.hasAddedFakeIcons && ![self isRootFolder]) {
		SBIconListModel *fakeList = [[%c(SBIconListModel) alloc] initWithFolder:self maxIconCount:9];
		//NSMutableArray *fakeIcons = [[NSMutableArray alloc] init];
		for (int i = 0; i < 9; i++) {
			/*LSApplicationProxy *proxy = [%c(LSApplicationProxy) applicationProxyForIdentifier:@"com.dildo.cum"];
			SBApplicationInfo *info = [[%c(SBApplicationInfo) alloc] initWithApplicationProxy:proxy];
			SBApplication *application = [[%c(SBApplication) alloc] initWithApplicationInfo:info];
			SBApplicationIcon *fakeIcon = [[%c(SBApplicationIcon) a
			lloc] initWithApplication:application];
			[fakeList insertIcon:fakeIcon atIndex:i options:nil];*/
		//NSLog(@"fakeicons: %@", fakeIcons);
		//[fakeList addIcons:fakeIcons];
/*-(void)_setLists:(id)arg1 {
	if ([self isRootFolder] || [%c(SBFolder) isRootFolderClass]) {
		%orig;
		return;
	}
	NSLog(@"self: %@", self);
	//SBIconIndexMutableList *lists = arg1;
	NSLog(@"arg1: %@", [arg1 class]);
	if (!self.hasAddedFakeIcons) {
		NSMutableArray *poop = arg1;
		SBIconListModel *fakeList = [[%c(SBIconListModel) alloc] initWithFolder:self maxIconCount:9];
		NSMutableArray *fakeIcons = [[NSMutableArray alloc] init];
		for (int i = 0; i < 9; i++) {
			SBApplicationIcon *fakeIcon = [[%c(SBApplicationIcon) alloc] initWithApplication:nil];
			[fakeIcons addObject:fakeIcon];
		}
		NSLog(@"fakeicons: %@", fakeIcons);
		[fakeList addIcons:fakeIcons];
		[poop insertObject:fakeList atIndex:0];

		%orig(poop);
		return;
	}
	%orig;
	//%orig([copy copy]);
	//%orig([copy copy]);
}*/
/*
@interface SBFolderIconImageCache
@property (nonatomic, strong) UITableView *tableViewPreviewGenerator;
@end

@interface SBFolderIcon : NSObject
-(id)folder;
@end
@interface SBIconView (b)
+(CGSize)defaultIconImageSize;
@end
@interface SBIconGridImage
@end
%hook SBFolderIconImageCache
%property (nonatomic, strong) UITableView *tableViewPreviewGenerator;
-(id)initWithFolder:(id)arg1 {
	self = %orig;
	if (self) {
		self.tableViewPreviewGenerator = [[UITableView alloc] init];
	}
	return self;
}
+(id)imageForPageAtIndex:(unsigned long long)arg1 inFolderIcon:(id)arg2 listLayout:(id)arg3 gridCellImageProvider:(id)arg4 pool:(id)arg5 {
	//id orig = %orig;
	//NSLog(@"orig: %@, %@", orig, [orig class]);
	CGSize size = [%c(SBIconView) defaultIconImageSize];
    UIGraphicsBeginImageContext(size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [[UIColor redColor] CGColor]);
    CGContextFillRect(context, CGRectMake(0, 0, size.width, size.height));
	NSData *imageData = UIImagePNGRepresentation(UIGraphicsGetImageFromCurrentImageContext());
    SBIconGridImage *image = [[%c(SBIconGridImage) alloc] initWithData:imageData];
    UIGraphicsEndImageContext();
	return image;
}
%end*/
/*%hook SBFolderIconImageView
-(void)didMoveToWindow {
	%orig;
	if (![(UIView *)self isKindOfClass:%c(SBFolderIconImageView)])
		return;
	UIView *pageGridContainer = MSHookIvar<UIView *>(self, "_pageGridContainer");
	pageGridContainer.hidden = YES;
	CGRect rect = pageGridContainer.frame;
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [[UIColor redColor] CGColor]);
    CGContextFillRect(context, CGRectMake(0, 0, rect.size.width, rect.size.height));
	UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
	UIImageView *imageViewContainer = [[UIImageView alloc] initWithImage:image];
	imageViewContainer.frame = pageGridContainer.frame;
	[(UIView *)self addSubview:imageViewContainer];

}
%end*/
@interface SBFolderIcon
@property (nonatomic,readonly) SBFolder * folder; 
@end
@interface SBApplicationController : NSObject
+(id)sharedInstanceIfExists;
-(void)requestUninstallApplicationWithBundleIdentifier:(id)arg1 withCompletion:(id)arg2;
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
-(UIImage *) drawNewIconInRect:(CGRect)rect;
@end
%hook _SBIconGridWrapperView
%property (nonatomic, strong) UIImage *newImage;
%property (nonatomic, strong) NSArray *icons;

-(void)setElement:(id)arg1 {
	%orig;
	self.icons = self.element.folderIcon.folder.icons;
}

-(void)setImage:(UIImage*)arg1{
	NSLog(@"ok setting");
	%orig([self drawNewIconInRect:self.bounds]);
}
%new
-(UIImage *) drawNewIconInRect:(CGRect)rect {
	UIColor *cellColor;
	if (@available(iOS 13, *)) {
		if (self.traitCollection.userInterfaceStyle == UIUserInterfaceStyleDark) {
			cellColor = [UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha: 0.6];
		} else {
			cellColor = [UIColor colorWithRed:0.65 green:0.65 blue:0.65 alpha: 0.6];
		}
	} else {
		cellColor = [UIColor colorWithRed:0.65 green:0.65 blue:0.65 alpha: 0.6];
	}
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    CGColorRef yellow = [[UIColor yellowColor] CGColor];
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextClearRect(context, rect);
    
    CGContextSetFillColorWithColor(context, yellow);
	int index = 0;
	for (int i = 0; i < rect.size.height; i+=9) {
		UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, i, rect.size.width, 7) cornerRadius:2.5];
		CGContextSetFillColorWithColor(context, cellColor.CGColor);
		[bezierPath fill];
		index++;
	}

    UIImage *anImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return anImage;
}
%end

%hook SBIconGridImage
+(id)gridImageForLayout:(id)arg1 previousGridImage:(id)arg2 previousGridCellIndexToUpdate:(unsigned long long)arg3 pool:(id)arg4 cellImageDrawBlock:(/*^block*/id)arg5 {
	NSLog(@"%@, %@, %llu, %@, %@", arg1, arg2, arg3, arg4, arg5);
	return %orig;
}
%end
%hook SBFloatyFolderController
%property (nonatomic, strong) NSArray *icons; 
%property (nonatomic, strong) UITableView *appListTableView;
%property (nonatomic, strong) SBIconListView *customListView;
%property (nonatomic, strong) NSString *cellReuseIdentifier;
%property (nonatomic, assign) BOOL hasSetupAppList;
%property (nonatomic, assign) BOOL loadImages;
//-(void)folderView:(id)arg1 willAnimateScrollToPageIndex:(long long)arg2
-(id)initWithConfiguration:(id)arg1 {
	if ((self = %orig)) {
		self.hasSetupAppList = NO;
	}
	return self;
}

%new
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return self.customListView ? self.customListView.frame.size.height / 5 : 52;
}

-(void)viewDidLoad {
	%orig;
	if ([self isKindOfClass:%c(SBRootFolderController)]) {
		NSLog(@"oh poop: %@", self);
		return;
	}
	self.cellReuseIdentifier = @"FLCells";
	self.customListView = self.iconListViews.firstObject;
	//self.customListView = [self addEmptyListView];
	//self.scrollView.scrollEnabled = NO;
	[self.customListView performSelector:@selector(hideAllIcons)];
	[self setupAppList];
	[self.appListTableView registerClass:[FLTableViewCell class] forCellReuseIdentifier: self.cellReuseIdentifier];
	[self.customListView addSubview: self.appListTableView];
	self.appListTableView.allowsMultipleSelectionDuringEditing = NO;
	UILongPressGestureRecognizer *lpgr = [[UILongPressGestureRecognizer alloc] 
	initWithTarget:self action:@selector(handleLongPress:)];
	lpgr.minimumPressDuration = 2.0; //seconds
	lpgr.delegate = self;
	[self.appListTableView addGestureRecognizer:lpgr];
	self.loadImages = YES;
	self.hasSetupAppList = YES;
	[self.appListTableView reloadData];
	NSLog(@"self.customListView: %@", self.customListView);
}
%new
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	[self.appListTableView deselectRowAtIndexPath:indexPath animated:YES];
	SBActivationSettings *customSettings = [[%c(SBActivationSettings) alloc] init];
	//[customSettings setFlag:1 forActivationSetting:2];
	[[%c(SBUIController) sharedInstanceIfExists] activateApplication:[(SBApplicationIcon *)self.icons[indexPath.section] application] fromIcon:nil location:nil activationSettings:customSettings actions:nil];

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
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.icons.count;
}

%new
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
	SBApplication *application = [self.icons[indexPath.section] application];
	cell.textLabel.text = application.displayName;
	
	if (self.loadImages) {
		UIImage *newImage = [UIImage _applicationIconImageForBundleIdentifier:application.bundleIdentifier format:10];
		cell.imageView.image = newImage;
		/*CGSize itemSize = CGSizeMake(30, 30);
		UIGraphicsBeginImageContextWithOptions(itemSize, NO, UIScreen.mainScreen.scale);
		CGRect imageRect = CGRectMake(0.0, 0.0, itemSize.width, itemSize.height);
		[cell.imageView.image drawInRect:imageRect];
		cell.imageView.image = UIGraphicsGetImageFromCurrentImageContext();
		UIGraphicsEndImageContext();*/
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
-(void)handleLongPress:(UILongPressGestureRecognizer *)gestureRecognizer
{
	if (gestureRecognizer.state == UIGestureRecognizerStateRecognized)
	{
		NSLog(@"cum");
	}
	if (gestureRecognizer.state == UIGestureRecognizerStateEnded)
	{
		CGPoint touchPoint = [gestureRecognizer locationInView:self.view];
		NSIndexPath *row = [self.appListTableView indexPathForRowAtPoint:touchPoint];
		if (row != nil) {
			
		}
	}
}
%new
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	FLTableViewCell *cell = [self.appListTableView dequeueReusableCellWithIdentifier:self.cellReuseIdentifier];
	if (!cell) {
		cell = [[FLTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:self.cellReuseIdentifier];
		UIView *myBackView = [[UIView alloc] initWithFrame:cell.frame];
		myBackView.backgroundColor = [UIColor colorWithRed:0.3 green:0.3 blue:0.3 alpha:0.75];
		myBackView.layer.cornerRadius = 16;
		cell.selectedBackgroundView = myBackView;
	}
	if (@available(iOS 13, *)) {
		if (self.traitCollection.userInterfaceStyle == UIUserInterfaceStyleDark) {
			cell.backgroundColor = [UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha: 0.4];
		} else {
			cell.backgroundColor = [UIColor colorWithRed:0.65 green:0.65 blue:0.65 alpha: 0.4];
		}
	} else {
		cell.backgroundColor = [UIColor colorWithRed:0.65 green:0.65 blue:0.65 alpha: 0.4];
	}
	cell.layer.cornerRadius = 16;
	return cell;
}
%new
-(void)setupAppList {
	NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"displayName" ascending:YES selector:@selector(localizedCaseInsensitiveCompare:)];
	self.icons = [self.folder.icons sortedArrayUsingDescriptors:@[sortDescriptor]];

	
	self.cellReuseIdentifier = @"appListTableViewCell";

	self.appListTableView = [[UITableView alloc] initWithFrame:CGRectMake(self.customListView.bounds.origin.x, self.customListView.bounds.origin.y, self.customListView.bounds.size.width, self.customListView.bounds.size.height)];
	self.appListTableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, self.appListTableView.bounds.size.width, 10)];
	self.appListTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, self.appListTableView.bounds.size.width, 10)];
	self.appListTableView.backgroundColor = [UIColor clearColor];
	self.appListTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
	self.appListTableView.delegate = self;
	self.appListTableView.dataSource = self;
	self.appListTableView.layer.cornerRadius = 38;
	//SBFloatyFolderBackgroundClipView *folderBackgroundClipView = (SBFloatyFolderBackgroundClipView *) self.appListTableView.superview;
	//NSLog(@"%@ is, ", folderBackgroundClipView);
	//self.appListTableView.layer.cornerRadius = 38;//MSHookIvar<double>(folderBackgroundClipView.backgroundView, "_continuousCornerRadius");
	//NSLog(@"%f is", [[folderBackgroundClipView.backgroundView valueForKey:@"_continuousCornerRadius"] doubleValue]);
	//self.hasSetupAppList = YES;
}
%new
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 7;
}

%new
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *v = [UIView new];
    [v setBackgroundColor:[UIColor clearColor]];
    return v;
}

%end

%ctor {
	NSLog(@"ran");
	%init(_ungrouped);
}