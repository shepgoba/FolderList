#import "FLTableViewCell.h"

#define ALERT(str) [[[UIAlertView alloc] initWithTitle:@"alert" message:str delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil] show]
@interface UIApplication (poop)
- (void) launchApplicationWithIdentifier: (NSString*)identifier suspended: (BOOL)suspended;
@end
@interface SBIconListView : UIView
-(id)initWithModel:(id)arg1 layoutProvider:(id)arg2 iconLocation:(id)arg3 orientation:(long long)arg4 iconViewProvider:(id)arg5 ;
@end
@interface SBWorkspaceEntity
+(id)entity;
-(void)setFlag:(long long)arg1 forActivationSetting:(unsigned)arg2 ;

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

@interface SBFloatyFolderController : UIViewController <UITableViewDataSource, UITableViewDelegate>
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

-(void)folderControllerWillOpen:(id)arg1 {
	%orig;
	NSLog(@"loading");
	if (/*arg2 == self.maximumPageIndex &&*/ !self.hasSetupAppList) {
		self.customListView = [self addEmptyListView];
		[self setupAppList];
		[self.customListView addSubview: self.appListTableView];

		self.loadImages = YES;
		self.hasSetupAppList = YES;
		[self.appListTableView reloadData];
	}
}
%new
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

-(void)viewDidLoad {
	%orig;
	if ([self isKindOfClass:%c(SBRootFolderController)]) {
		NSLog(@"oh poop: %@", self);
		return;
	}
	NSLog(@"self.customListView: %@", self.customListView);
}

%new
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	[self.appListTableView deselectRowAtIndexPath:indexPath animated:YES];
	[[UIApplication sharedApplication] launchApplicationWithIdentifier:[[self.icons[indexPath.section] application] bundleIdentifier] suspended:NO];
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
		CGSize itemSize = CGSizeMake(30, 30);
		UIGraphicsBeginImageContextWithOptions(itemSize, NO, UIScreen.mainScreen.scale);
		CGRect imageRect = CGRectMake(0.0, 0.0, itemSize.width, itemSize.height);
		[cell.imageView.image drawInRect:imageRect];
		cell.imageView.image = UIGraphicsGetImageFromCurrentImageContext();
		UIGraphicsEndImageContext();
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

%new
-(void)moveToAppListView {
	if (!self.hasSetupAppList)
    	[self setupAppList];

	[UIView transitionWithView:self.folderView.scrollView
                  duration:0.3
                   options:UIViewAnimationOptionTransitionCrossDissolve 
                animations:^(void){
                            self.folderView.scrollView.hidden = !self.folderView.scrollView.hidden;
                           }
                completion:nil];
	[UIView transitionWithView:self.appListTableView
                  duration:0.3
                   options:UIViewAnimationOptionTransitionCrossDissolve 
                animations:^(void){
                            self.appListTableView.hidden = !self.appListTableView.hidden;
                           }
                completion:nil];
}
%end

%ctor {
	NSLog(@"ran");
	%init(_ungrouped);
}