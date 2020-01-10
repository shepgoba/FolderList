#import "FLTableViewCell.h"
#import "FLIconEntry.h"
#import <CoreGraphics/CoreGraphics.h>
#import <MobileCoreServices/MobileCoreServices.h>

typedef NS_ENUM(NSUInteger, FLSortType) {
	FLSortTypeNone,
	FLSortTypeAlphabetically,
	FLSortTypeAlphabeticallyReverse,
	FLSortTypeDiskSize
};

static UITableView *sharedTableView;
static FLSortType sortType = FLSortTypeNone;
static BOOL enabled;
static BOOL replaceOriginalView;

static void loadPrefs() {
	static NSMutableDictionary *settings;

	CFArrayRef keyList = CFPreferencesCopyKeyList(CFSTR("com.shepgoba.folderlistprefs"), kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
	if (keyList) {
		settings = (NSMutableDictionary *)CFBridgingRelease(CFPreferencesCopyMultiple(keyList, CFSTR("com.shepgoba.folderlistprefs"), kCFPreferencesCurrentUser, kCFPreferencesAnyHost));
		CFRelease(keyList);
	} else {
		settings = [NSMutableDictionary dictionaryWithContentsOfFile:@"/var/mobile/Library/Preferences/com.shepgoba.folderlistprefs.plist"];
	}

  	enabled = [([settings objectForKey:@"enabled"] ? [settings objectForKey:@"enabled"] : @(YES)) boolValue];
	replaceOriginalView = [([settings objectForKey:@"replaceoriginalview"] ? [settings objectForKey:@"replaceoriginalview"] : @(YES)) boolValue];
	sortType = [([settings objectForKey:@"sortingType"] ? [settings objectForKey:@"sortingType"] : @"0") integerValue];

}

@interface LSApplicationProxy : NSObject
@property (nonatomic, readonly) NSNumber *staticDiskUsage;
+ (LSApplicationProxy *)applicationProxyForIdentifier:(id)arg1;
@end

@interface UISwipeGestureRecognizer (Private)
@property(assign, nonatomic) CGFloat minimumPrimaryMovement;
@property(assign, nonatomic) CGFloat maximumPrimaryMovement;
@end

@interface SBIconListView : UIView
-(void)hideAllIcons;
@end

@interface SBFolderBackgroundView : UIView
@end

@interface SBFloatyFolderBackgroundClipView : UIView
@property (nonatomic,readonly) SBFolderBackgroundView * backgroundView; 
@end

@interface SBApplicationInfo
-(id)initWithApplicationProxy:(id)arg1;
@end

@interface SBApplication : NSObject
@property (nonatomic,copy) id badgeValue; 

-(NSString *)bundleIdentifier;
-(NSString *)displayName;
-(id)initWithApplicationInfo:(id)arg1 ;
-(id)badgeNumberOrStringForIcon:(id)arg1 ;
@end

@interface SBApplicationIcon
-(id)initWithApplication:(SBApplication *)application;
-(SBApplication *)application;
@end

@interface SBFolder : NSObject
-(NSArray *)icons;
-(id)allIcons;
@end

@interface SBFolderView : UIView
@property (nonatomic,readonly) UIScrollView * scrollView;  
@end

@interface UIImage (UIApplicationIconPrivate)
+ (UIImage *)_applicationIconImageForBundleIdentifier:(NSString *)bundleIdentifier format:(int)format scale:(CGFloat)scale;
+ (UIImage *)_applicationIconImageForBundleIdentifier:(NSString *)bundleIdentifier format:(int)format;
@end
@interface SBUIController
-(void)activateApplication:(id)arg1 fromIcon:(id)arg2 location:(id)arg3 activationSettings:(id)arg4 actions:(id)arg5 ;
+(id)sharedInstanceIfExists;
@end

@interface SBFolderController : UIViewController <UITableViewDataSource, UITableViewDelegate, UIGestureRecognizerDelegate>
@property (nonatomic, readonly) SBFolderView *folderView; 
@property (nonatomic, strong) UITableView *appListTableView;
@property (nonatomic, strong) NSString *cellReuseIdentifier;
@property (nonatomic, strong) SBFolder *folder;
@property (nonatomic, strong) NSArray *icons;
@property (nonatomic, strong) SBIconListView *customListView;
@property (nonatomic,copy,readonly) NSArray *iconListViews;
@property (nonatomic, strong) UIScrollView *appListScrollView;
@property (nonatomic, strong) NSMutableArray *iconEntries;
@property (nonatomic, assign) BOOL hasAddedCustomView;
-(void)setupAppList;
-(id)addEmptyListView;
-(void)deselectAllRows;
-(void)setupIconEntries;
-(void)uninstallApplication:(SBApplication *)application;
@end

@interface SBIconListModel : NSObject
@property (nonatomic,weak,readonly) SBFolder * folder; 
-(id)initWithFolder:(id)arg1 maxIconCount:(unsigned long long)arg2;
@end



@interface SBApplicationController : NSObject
+(id)sharedInstanceIfExists;
-(void)requestUninstallApplicationWithBundleIdentifier:(id)arg1 withCompletion:(id)arg2;
-(void)uninstallApplication:(id)arg1 ;

@end

%group Tweak12
%hook SBFolderIconListView
-(id)initWithModel:(id)arg1 orientation:(long long)arg2 viewMap:(id)arg3 {
	SBIconListModel *customModel = [[%c(SBIconListModel) alloc] initWithFolder:((SBIconListModel *)arg1).folder maxIconCount:0];
	return %orig(customModel, arg2, arg3);
}
%end

%hook SBFolderView
-(unsigned long long)iconListViewCount {
	if (replaceOriginalView)
		return 1;
	else
		return %orig;
}
%end
%end

%group Tweak13
%hook SBFloatyFolderView
-(unsigned long long)iconListViewCount {
	if (replaceOriginalView)
		return 1;
	else
		return %orig;
}
%end
%end

static BOOL ios13;
%group Universal

%hook SBFolderController
%property (nonatomic, strong) NSArray *icons; 
%property (nonatomic, strong) UITableView *appListTableView;
%property (nonatomic, strong) SBIconListView *customListView;
%property (nonatomic, strong) NSString *cellReuseIdentifier;
%property (nonatomic, strong) NSMutableArray *iconEntries;
%property (nonatomic, assign) BOOL hasAddedCustomView;

-(id)initWithConfiguration:(id)arg1 {
	self = %orig;
	if (self) {
		self.hasAddedCustomView = NO;
		//[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateIcons) name:@"FLBadgesUpdate" object:nil];
	}
	return self;
}

-(void)viewDidLoad {
	%orig;

	if ((![self isMemberOfClass:%c(SBFolderController)] && ![self isMemberOfClass:%c(SBFloatyFolderController)]) || [self isKindOfClass:%c(SBRootFolderController)]) {
		return;
	}

	self.cellReuseIdentifier = @"FLCells";
	if (replaceOriginalView) {
		self.customListView = self.iconListViews.firstObject;
		[self.customListView hideAllIcons];
		((UIScrollView *)self.customListView.superview).scrollEnabled = NO;
	} else {
		if (!self.hasAddedCustomView) {
			self.customListView = [self addEmptyListView];
			self.hasAddedCustomView = YES;
		}
	}
	
	[self setupAppList];
	[self setupIconEntries];


	[self.appListTableView registerClass:[FLTableViewCell class] forCellReuseIdentifier: self.cellReuseIdentifier];
	[self.customListView addSubview: self.appListTableView];

	UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
	swipe.direction = UISwipeGestureRecognizerDirectionLeft; //seconds
	swipe.delegate = self;
	swipe.minimumPrimaryMovement = 100;
	[self.appListTableView addGestureRecognizer:swipe];
	if (!replaceOriginalView)
		[((UIScrollView *)self.customListView.superview).panGestureRecognizer requireGestureRecognizerToFail:swipe];
}

-(void)setEditing:(BOOL)arg1 animated:(BOOL)arg2 {
	%orig;
	if (ios13) {
		[self.customListView hideAllIcons];
	} else {
		//TODO: maybe hide icons on edit
	}
}

-(void)setFolder:(SBFolder *)arg1 {
	%orig;

	if (![self isMemberOfClass:%c(SBFolderController)] && ![self isMemberOfClass:%c(SBFloatyFolderController)]) {
		return;
	}
	
	if (sortType == FLSortTypeAlphabetically || sortType == FLSortTypeAlphabeticallyReverse) {
		BOOL shouldAscend = sortType == FLSortTypeAlphabetically ? YES : NO;
		NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"displayName" ascending:shouldAscend selector:@selector(localizedCaseInsensitiveCompare:)];
		NSArray *icons = ios13 ? arg1.icons : arg1.allIcons;
		self.icons = [icons sortedArrayUsingDescriptors:@[sortDescriptor]];
	} else if (sortType == FLSortTypeDiskSize) {
		//NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"displayName" ascending:shouldAscend selector:@selector(localizedCaseInsensitiveCompare:)];
		NSArray *icons = ios13 ? arg1.icons : arg1.allIcons;
		self.icons = [icons sortedArrayUsingComparator: ^(id a, id b) {
			SBApplicationIcon *iconA = (SBApplicationIcon *)a;
			SBApplicationIcon *iconB = (SBApplicationIcon *)b;
			NSNumber *sizeA = [LSApplicationProxy applicationProxyForIdentifier:iconA.application.bundleIdentifier].staticDiskUsage;
			NSNumber *sizeB = [LSApplicationProxy applicationProxyForIdentifier:iconB.application.bundleIdentifier].staticDiskUsage;
			//NSLog(@"stuff: %@, name: %@", [iconA.application badgeValue], iconA.application.displayName);
			return [sizeA compare:sizeB];
		}];
	} else {
		if (ios13) {
			self.icons = [arg1.icons copy];
		} else {
			self.icons = [arg1.allIcons copy];
		}
	}
}

- (void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection {
	%orig;
	[self.appListTableView reloadData];
}

%new
-(void)setupIconEntries {
	self.iconEntries = [[NSMutableArray alloc] init];
	for (SBApplicationIcon *icon in self.icons) {
		FLIconEntry *newEntry = [[FLIconEntry alloc] initWithApplication:icon.application];
		[self.iconEntries addObject: newEntry];
	}
}

%new
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	[self.appListTableView deselectRowAtIndexPath:indexPath animated:YES];
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

%new
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return 1;
}

%new
-(void)uninstallApplication:(SBApplication *)application {
	if (application == nil)
		return;
	
	[[%c(SBApplicationController) sharedInstanceIfExists] requestUninstallApplicationWithBundleIdentifier:application.bundleIdentifier withCompletion:^{
		if (sortType == FLSortTypeAlphabetically || sortType == FLSortTypeAlphabeticallyReverse) {
			BOOL shouldAscend = sortType == FLSortTypeAlphabetically ? YES : NO;
			NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"displayName" ascending:shouldAscend selector:@selector(localizedCaseInsensitiveCompare:)];
			NSArray *icons = ios13 ? self.folder.icons : self.folder.allIcons;
			self.icons = [icons sortedArrayUsingDescriptors:@[sortDescriptor]];
		} else if (sortType == FLSortTypeDiskSize) {
			NSArray *icons = ios13 ? self.folder.icons : self.folder.allIcons;
			self.icons = [icons sortedArrayUsingComparator: ^(id a, id b) {
				SBApplicationIcon *iconA = (SBApplicationIcon *)a;
				SBApplicationIcon *iconB = (SBApplicationIcon *)b;
				NSNumber *sizeA = [LSApplicationProxy applicationProxyForIdentifier:iconA.application.bundleIdentifier].staticDiskUsage;
				NSNumber *sizeB = [LSApplicationProxy applicationProxyForIdentifier:iconB.application.bundleIdentifier].staticDiskUsage;
				//NSLog(@"stuff: %@, name: %@", [iconA.application badgeValue], iconA.application.displayName);
				return [sizeA compare:sizeB];
			}];
		} else {
			if (ios13) {
				self.icons = [self.folder.icons copy];
			} else {
				self.icons = [self.folder.allIcons copy];
			}
		}

		[self.appListTableView reloadData];
	}];
}

%new
-(void)handleSwipe:(UISwipeGestureRecognizer *)gestureRecognizer {
	CGPoint touchPoint = [gestureRecognizer locationInView:self.appListTableView];
	NSIndexPath *row = [self.appListTableView indexPathForRowAtPoint:touchPoint];
	if (row != nil) {
		SBApplication *application = [self.icons[row.section] application];

		UIAlertController* confirm = [UIAlertController alertControllerWithTitle:@"Confirm Deletion"
							message:[NSString stringWithFormat:@"Do you want to delete the application \"%@\"", application.displayName]
							preferredStyle:UIAlertControllerStyleAlert];

		UIAlertAction* deleteAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDestructive
		handler:^(UIAlertAction * action) {
				[self uninstallApplication:application];		
		}];
		UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDefault
											handler:nil];
		[confirm addAction:deleteAction];
		[confirm addAction:defaultAction];
		[self presentViewController:confirm animated:YES completion:nil];
	}
}

%new
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	FLTableViewCell *cell = [self.appListTableView dequeueReusableCellWithIdentifier:self.cellReuseIdentifier forIndexPath:indexPath];
	FLIconEntry *entry = self.iconEntries[indexPath.section];

	cell.entry = entry;
	cell.textLabel.text = entry.application.displayName;
	cell.textLabel.backgroundColor = [UIColor clearColor];

	cell.appLaunchRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:cell action:@selector(launchApp)];
	[cell addGestureRecognizer:cell.appLaunchRecognizer];

	UIView *newView = [[UIView alloc] initWithFrame:cell.frame];
	newView.backgroundColor = [UIColor colorWithRed:0.3 green:0.3 blue:0.3 alpha:0.75];
    newView.layer.cornerRadius = 16;
	cell.selectedBackgroundView = newView;

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
	if (entry.application.badgeValue != nil) {
		[cell setupBadgeView:[entry.application.badgeValue stringValue]];
		[cell setNeedsLayout];
		[cell layoutIfNeeded];
	}
	return cell;
}

%new
-(void)setupAppList {
	self.appListTableView = [[UITableView alloc] initWithFrame:self.customListView.bounds];
	self.appListTableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, self.appListTableView.bounds.size.width, 25)];
	self.appListTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, self.appListTableView.bounds.size.width, 25)];
	self.appListTableView.backgroundColor = [UIColor clearColor];
	self.appListTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
	self.appListTableView.delegate = self;
	self.appListTableView.dataSource = self;
	self.appListTableView.layer.cornerRadius = 38;
	self.appListTableView.scrollIndicatorInsets = UIEdgeInsetsMake(38, 0, 38, 0);
	self.appListTableView.sectionHeaderHeight = 8;
	self.appListTableView.rowHeight = 52;
	//SBFloatyFolderBackgroundClipView *folderBackgroundClipView = (SBFloatyFolderBackgroundClipView *) self.appListTableView.superview;
	//NSLog(@"%@ is, ", folderBackgroundClipView);
	//self.appListTableView.layer.cornerRadius = 38;//MSHookIvar<double>(folderBackgroundClipView.backgroundView, "_continuousCornerRadius");
	//NSLog(@"%f is", [[folderBackgroundClipView.backgroundView valueForKey:@"_continuousCornerRadius"] doubleValue]);
	//self.hasSetupAppList = YES;
}

%new
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *view = [[UIView alloc] init];
    [view setBackgroundColor:[UIColor clearColor]];
    return view;
}

%end
%end

%ctor {
	loadPrefs();
	if (enabled) {
		if (@available(iOS 13, *)) {
			ios13 = YES;
			%init(Tweak13);
		} else {
			ios13 = NO;
			%init(Tweak12);
		}
		//sharedTableView = [[UITableView alloc] init];
		//%init(FolderControllerClass = ios13 ? SBFloatyFolderController : yeet )
		%init(Universal);
	}
}