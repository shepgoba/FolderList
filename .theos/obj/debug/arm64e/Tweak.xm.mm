#line 1 "Tweak.xm"
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
static BOOL notificationBadgesEnabled;
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
	notificationBadgesEnabled = [([settings objectForKey:@"notificationBadgesEnabled"] ? [settings objectForKey:@"notificationBadgesEnabled"] : NO) boolValue];
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


#include <substrate.h>
#if defined(__clang__)
#if __has_feature(objc_arc)
#define _LOGOS_SELF_TYPE_NORMAL __unsafe_unretained
#define _LOGOS_SELF_TYPE_INIT __attribute__((ns_consumed))
#define _LOGOS_SELF_CONST const
#define _LOGOS_RETURN_RETAINED __attribute__((ns_returns_retained))
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif

@class SBApplicationController; @class SBFloatyFolderController; @class SBFolderIconListView; @class SBFolderController; @class SBFolderView; @class SBRootFolderController; @class SBFloatyFolderView; @class SBIconListModel; 

static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$SBRootFolderController(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("SBRootFolderController"); } return _klass; }static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$SBFloatyFolderController(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("SBFloatyFolderController"); } return _klass; }static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$SBIconListModel(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("SBIconListModel"); } return _klass; }static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$SBFolderController(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("SBFolderController"); } return _klass; }static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$SBApplicationController(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("SBApplicationController"); } return _klass; }
#line 124 "Tweak.xm"
static SBFolderIconListView* (*_logos_orig$Tweak12$SBFolderIconListView$initWithModel$orientation$viewMap$)(_LOGOS_SELF_TYPE_INIT SBFolderIconListView*, SEL, id, long long, id) _LOGOS_RETURN_RETAINED; static SBFolderIconListView* _logos_method$Tweak12$SBFolderIconListView$initWithModel$orientation$viewMap$(_LOGOS_SELF_TYPE_INIT SBFolderIconListView*, SEL, id, long long, id) _LOGOS_RETURN_RETAINED; static unsigned long long (*_logos_orig$Tweak12$SBFolderView$iconListViewCount)(_LOGOS_SELF_TYPE_NORMAL SBFolderView* _LOGOS_SELF_CONST, SEL); static unsigned long long _logos_method$Tweak12$SBFolderView$iconListViewCount(_LOGOS_SELF_TYPE_NORMAL SBFolderView* _LOGOS_SELF_CONST, SEL); 

static SBFolderIconListView* _logos_method$Tweak12$SBFolderIconListView$initWithModel$orientation$viewMap$(_LOGOS_SELF_TYPE_INIT SBFolderIconListView* __unused self, SEL __unused _cmd, id arg1, long long arg2, id arg3) _LOGOS_RETURN_RETAINED {
	if (replaceOriginalView) {
		SBIconListModel *customModel = [[_logos_static_class_lookup$SBIconListModel() alloc] initWithFolder:((SBIconListModel *)arg1).folder maxIconCount:0];
		return _logos_orig$Tweak12$SBFolderIconListView$initWithModel$orientation$viewMap$(self, _cmd, customModel, arg2, arg3);
	}
	return _logos_orig$Tweak12$SBFolderIconListView$initWithModel$orientation$viewMap$(self, _cmd, arg1, arg2, arg3);
}



static unsigned long long _logos_method$Tweak12$SBFolderView$iconListViewCount(_LOGOS_SELF_TYPE_NORMAL SBFolderView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	if (replaceOriginalView)
		return 1;
	else
		return _logos_orig$Tweak12$SBFolderView$iconListViewCount(self, _cmd);
}



static unsigned long long (*_logos_orig$Tweak13$SBFloatyFolderView$iconListViewCount)(_LOGOS_SELF_TYPE_NORMAL SBFloatyFolderView* _LOGOS_SELF_CONST, SEL); static unsigned long long _logos_method$Tweak13$SBFloatyFolderView$iconListViewCount(_LOGOS_SELF_TYPE_NORMAL SBFloatyFolderView* _LOGOS_SELF_CONST, SEL); 

static unsigned long long _logos_method$Tweak13$SBFloatyFolderView$iconListViewCount(_LOGOS_SELF_TYPE_NORMAL SBFloatyFolderView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	if (replaceOriginalView)
		return 1;
	else
		return _logos_orig$Tweak13$SBFloatyFolderView$iconListViewCount(self, _cmd);
}



static BOOL ios13;
static void (*_logos_orig$Universal$SBFolderController$viewDidLoad)(_LOGOS_SELF_TYPE_NORMAL SBFolderController* _LOGOS_SELF_CONST, SEL); static void _logos_method$Universal$SBFolderController$viewDidLoad(_LOGOS_SELF_TYPE_NORMAL SBFolderController* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$Universal$SBFolderController$setEditing$animated$)(_LOGOS_SELF_TYPE_NORMAL SBFolderController* _LOGOS_SELF_CONST, SEL, BOOL, BOOL); static void _logos_method$Universal$SBFolderController$setEditing$animated$(_LOGOS_SELF_TYPE_NORMAL SBFolderController* _LOGOS_SELF_CONST, SEL, BOOL, BOOL); static void (*_logos_orig$Universal$SBFolderController$setFolder$)(_LOGOS_SELF_TYPE_NORMAL SBFolderController* _LOGOS_SELF_CONST, SEL, SBFolder *); static void _logos_method$Universal$SBFolderController$setFolder$(_LOGOS_SELF_TYPE_NORMAL SBFolderController* _LOGOS_SELF_CONST, SEL, SBFolder *); static void (*_logos_orig$Universal$SBFolderController$traitCollectionDidChange$)(_LOGOS_SELF_TYPE_NORMAL SBFolderController* _LOGOS_SELF_CONST, SEL, UITraitCollection *); static void _logos_method$Universal$SBFolderController$traitCollectionDidChange$(_LOGOS_SELF_TYPE_NORMAL SBFolderController* _LOGOS_SELF_CONST, SEL, UITraitCollection *); static void _logos_method$Universal$SBFolderController$setupIconEntries(_LOGOS_SELF_TYPE_NORMAL SBFolderController* _LOGOS_SELF_CONST, SEL); static void _logos_method$Universal$SBFolderController$tableView$didSelectRowAtIndexPath$(_LOGOS_SELF_TYPE_NORMAL SBFolderController* _LOGOS_SELF_CONST, SEL, UITableView *, NSIndexPath *); static NSInteger _logos_method$Universal$SBFolderController$numberOfSectionsInTableView$(_LOGOS_SELF_TYPE_NORMAL SBFolderController* _LOGOS_SELF_CONST, SEL, UITableView *); static void _logos_method$Universal$SBFolderController$deselectAllRows(_LOGOS_SELF_TYPE_NORMAL SBFolderController* _LOGOS_SELF_CONST, SEL); static NSInteger _logos_method$Universal$SBFolderController$tableView$numberOfRowsInSection$(_LOGOS_SELF_TYPE_NORMAL SBFolderController* _LOGOS_SELF_CONST, SEL, UITableView *, NSInteger); static void _logos_method$Universal$SBFolderController$uninstallApplication$(_LOGOS_SELF_TYPE_NORMAL SBFolderController* _LOGOS_SELF_CONST, SEL, SBApplication *); static void _logos_method$Universal$SBFolderController$handleSwipe$(_LOGOS_SELF_TYPE_NORMAL SBFolderController* _LOGOS_SELF_CONST, SEL, UISwipeGestureRecognizer *); static UITableViewCell * _logos_method$Universal$SBFolderController$tableView$cellForRowAtIndexPath$(_LOGOS_SELF_TYPE_NORMAL SBFolderController* _LOGOS_SELF_CONST, SEL, UITableView *, NSIndexPath *); static void _logos_method$Universal$SBFolderController$setupAppList(_LOGOS_SELF_TYPE_NORMAL SBFolderController* _LOGOS_SELF_CONST, SEL); static UIView * _logos_method$Universal$SBFolderController$tableView$viewForHeaderInSection$(_LOGOS_SELF_TYPE_NORMAL SBFolderController* _LOGOS_SELF_CONST, SEL, UITableView *, NSInteger); 


__attribute__((used)) static NSArray * _logos_method$Universal$SBFolderController$icons(SBFolderController * __unused self, SEL __unused _cmd) { return (NSArray *)objc_getAssociatedObject(self, (void *)_logos_method$Universal$SBFolderController$icons); }; __attribute__((used)) static void _logos_method$Universal$SBFolderController$setIcons(SBFolderController * __unused self, SEL __unused _cmd, NSArray * rawValue) { objc_setAssociatedObject(self, (void *)_logos_method$Universal$SBFolderController$icons, rawValue, OBJC_ASSOCIATION_RETAIN_NONATOMIC); } 
__attribute__((used)) static UITableView * _logos_method$Universal$SBFolderController$appListTableView(SBFolderController * __unused self, SEL __unused _cmd) { return (UITableView *)objc_getAssociatedObject(self, (void *)_logos_method$Universal$SBFolderController$appListTableView); }; __attribute__((used)) static void _logos_method$Universal$SBFolderController$setAppListTableView(SBFolderController * __unused self, SEL __unused _cmd, UITableView * rawValue) { objc_setAssociatedObject(self, (void *)_logos_method$Universal$SBFolderController$appListTableView, rawValue, OBJC_ASSOCIATION_RETAIN_NONATOMIC); }
__attribute__((used)) static SBIconListView * _logos_method$Universal$SBFolderController$customListView(SBFolderController * __unused self, SEL __unused _cmd) { return (SBIconListView *)objc_getAssociatedObject(self, (void *)_logos_method$Universal$SBFolderController$customListView); }; __attribute__((used)) static void _logos_method$Universal$SBFolderController$setCustomListView(SBFolderController * __unused self, SEL __unused _cmd, SBIconListView * rawValue) { objc_setAssociatedObject(self, (void *)_logos_method$Universal$SBFolderController$customListView, rawValue, OBJC_ASSOCIATION_RETAIN_NONATOMIC); }
__attribute__((used)) static NSString * _logos_method$Universal$SBFolderController$cellReuseIdentifier(SBFolderController * __unused self, SEL __unused _cmd) { return (NSString *)objc_getAssociatedObject(self, (void *)_logos_method$Universal$SBFolderController$cellReuseIdentifier); }; __attribute__((used)) static void _logos_method$Universal$SBFolderController$setCellReuseIdentifier(SBFolderController * __unused self, SEL __unused _cmd, NSString * rawValue) { objc_setAssociatedObject(self, (void *)_logos_method$Universal$SBFolderController$cellReuseIdentifier, rawValue, OBJC_ASSOCIATION_RETAIN_NONATOMIC); }
__attribute__((used)) static NSMutableArray * _logos_method$Universal$SBFolderController$iconEntries(SBFolderController * __unused self, SEL __unused _cmd) { return (NSMutableArray *)objc_getAssociatedObject(self, (void *)_logos_method$Universal$SBFolderController$iconEntries); }; __attribute__((used)) static void _logos_method$Universal$SBFolderController$setIconEntries(SBFolderController * __unused self, SEL __unused _cmd, NSMutableArray * rawValue) { objc_setAssociatedObject(self, (void *)_logos_method$Universal$SBFolderController$iconEntries, rawValue, OBJC_ASSOCIATION_RETAIN_NONATOMIC); }
__attribute__((used)) static BOOL _logos_method$Universal$SBFolderController$hasAddedCustomView(SBFolderController * __unused self, SEL __unused _cmd) { NSValue * value = objc_getAssociatedObject(self, (void *)_logos_method$Universal$SBFolderController$hasAddedCustomView); BOOL rawValue; [value getValue:&rawValue]; return rawValue; }; __attribute__((used)) static void _logos_method$Universal$SBFolderController$setHasAddedCustomView(SBFolderController * __unused self, SEL __unused _cmd, BOOL rawValue) { NSValue * value = [NSValue valueWithBytes:&rawValue objCType:@encode(BOOL)]; objc_setAssociatedObject(self, (void *)_logos_method$Universal$SBFolderController$hasAddedCustomView, value, OBJC_ASSOCIATION_RETAIN_NONATOMIC); }

static void _logos_method$Universal$SBFolderController$viewDidLoad(_LOGOS_SELF_TYPE_NORMAL SBFolderController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	_logos_orig$Universal$SBFolderController$viewDidLoad(self, _cmd);

	if ((![self isMemberOfClass:_logos_static_class_lookup$SBFolderController()] && ![self isMemberOfClass:_logos_static_class_lookup$SBFloatyFolderController()]) || [self isKindOfClass:_logos_static_class_lookup$SBRootFolderController()]) {
		return;
	}

	self.cellReuseIdentifier = @"FLCells";
	if (replaceOriginalView) {
		self.customListView = self.iconListViews.firstObject;
		if (ios13)
			[self.customListView hideAllIcons];
		((UIScrollView *)self.customListView.superview).scrollEnabled = NO;
	} else {
		self.customListView = [self addEmptyListView];
	}
	
	[self setupAppList];
	[self setupIconEntries];


	[self.appListTableView registerClass:[FLTableViewCell class] forCellReuseIdentifier: self.cellReuseIdentifier];
	[self.customListView addSubview: self.appListTableView];

	UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
	swipe.direction = UISwipeGestureRecognizerDirectionLeft; 
	swipe.delegate = self;
	swipe.minimumPrimaryMovement = 125;
	[self.appListTableView addGestureRecognizer:swipe];
	if (!replaceOriginalView)
		[((UIScrollView *)self.customListView.superview).panGestureRecognizer requireGestureRecognizerToFail:swipe];
}

static void _logos_method$Universal$SBFolderController$setEditing$animated$(_LOGOS_SELF_TYPE_NORMAL SBFolderController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, BOOL arg1, BOOL arg2) {
	_logos_orig$Universal$SBFolderController$setEditing$animated$(self, _cmd, arg1, arg2);
	if (![self isMemberOfClass:_logos_static_class_lookup$SBFolderController()] && ![self isMemberOfClass:_logos_static_class_lookup$SBFloatyFolderController()]) {
		return;
	}
	if (ios13) {
		[self.customListView hideAllIcons];
	} else {
		
	}
}

static void _logos_method$Universal$SBFolderController$setFolder$(_LOGOS_SELF_TYPE_NORMAL SBFolderController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, SBFolder * arg1) {
	_logos_orig$Universal$SBFolderController$setFolder$(self, _cmd, arg1);

	if (![self isMemberOfClass:_logos_static_class_lookup$SBFolderController()] && ![self isMemberOfClass:_logos_static_class_lookup$SBFloatyFolderController()]) {
		return;
	}
	
	if (sortType == FLSortTypeAlphabetically || sortType == FLSortTypeAlphabeticallyReverse) {
		BOOL shouldAscend = sortType == FLSortTypeAlphabetically ? YES : NO;
		NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"displayName" ascending:shouldAscend selector:@selector(localizedCaseInsensitiveCompare:)];
		NSArray *icons = ios13 ? arg1.icons : arg1.allIcons;
		self.icons = [icons sortedArrayUsingDescriptors:@[sortDescriptor]];
	} else if (sortType == FLSortTypeDiskSize) {
		
		NSArray *icons = ios13 ? arg1.icons : arg1.allIcons;
		self.icons = [icons sortedArrayUsingComparator: ^(id a, id b) {
			SBApplicationIcon *iconA = (SBApplicationIcon *)a;
			SBApplicationIcon *iconB = (SBApplicationIcon *)b;
			NSNumber *sizeA = [LSApplicationProxy applicationProxyForIdentifier:iconA.application.bundleIdentifier].staticDiskUsage;
			NSNumber *sizeB = [LSApplicationProxy applicationProxyForIdentifier:iconB.application.bundleIdentifier].staticDiskUsage;
			
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

static void _logos_method$Universal$SBFolderController$traitCollectionDidChange$(_LOGOS_SELF_TYPE_NORMAL SBFolderController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UITraitCollection * previousTraitCollection) {
	_logos_orig$Universal$SBFolderController$traitCollectionDidChange$(self, _cmd, previousTraitCollection);
	if (![self isMemberOfClass:_logos_static_class_lookup$SBFolderController()] && ![self isMemberOfClass:_logos_static_class_lookup$SBFloatyFolderController()]) {
		return;
	}
	[self.appListTableView reloadData];
}


static void _logos_method$Universal$SBFolderController$setupIconEntries(_LOGOS_SELF_TYPE_NORMAL SBFolderController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	self.iconEntries = [[NSMutableArray alloc] init];
	for (SBApplicationIcon *icon in self.icons) {
		FLIconEntry *newEntry = [[FLIconEntry alloc] initWithApplication:icon.application];
		[self.iconEntries addObject: newEntry];
	}
}


static void _logos_method$Universal$SBFolderController$tableView$didSelectRowAtIndexPath$(_LOGOS_SELF_TYPE_NORMAL SBFolderController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UITableView * tableView, NSIndexPath * indexPath) {
	[self.appListTableView deselectRowAtIndexPath:indexPath animated:YES];
}


static NSInteger _logos_method$Universal$SBFolderController$numberOfSectionsInTableView$(_LOGOS_SELF_TYPE_NORMAL SBFolderController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UITableView * tableView) {
    return self.icons.count;
}


static void _logos_method$Universal$SBFolderController$deselectAllRows(_LOGOS_SELF_TYPE_NORMAL SBFolderController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	for (NSIndexPath *indexPath in self.appListTableView.indexPathsForSelectedRows) {
    	[self.appListTableView deselectRowAtIndexPath:indexPath animated:YES];
	}
}


static NSInteger _logos_method$Universal$SBFolderController$tableView$numberOfRowsInSection$(_LOGOS_SELF_TYPE_NORMAL SBFolderController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UITableView * tableView, NSInteger section) {
	return 1;
}


static void _logos_method$Universal$SBFolderController$uninstallApplication$(_LOGOS_SELF_TYPE_NORMAL SBFolderController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, SBApplication * application) {
	if (application == nil)
		return;
	
	[[_logos_static_class_lookup$SBApplicationController() sharedInstanceIfExists] requestUninstallApplicationWithBundleIdentifier:application.bundleIdentifier withCompletion:^{
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


static void _logos_method$Universal$SBFolderController$handleSwipe$(_LOGOS_SELF_TYPE_NORMAL SBFolderController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UISwipeGestureRecognizer * gestureRecognizer) {
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


static UITableViewCell * _logos_method$Universal$SBFolderController$tableView$cellForRowAtIndexPath$(_LOGOS_SELF_TYPE_NORMAL SBFolderController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UITableView * tableView, NSIndexPath * indexPath) {
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
	if (entry.application.badgeValue != nil && notificationBadgesEnabled) {
		[cell setupBadgeView:[entry.application.badgeValue stringValue]];
		[cell setNeedsLayout];
		[cell layoutIfNeeded];
	}
	return cell;
}


static void _logos_method$Universal$SBFolderController$setupAppList(_LOGOS_SELF_TYPE_NORMAL SBFolderController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	self.appListTableView = [[UITableView alloc] initWithFrame:self.customListView.bounds];
	self.appListTableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, self.appListTableView.bounds.size.width, 25)];
	self.appListTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, self.appListTableView.bounds.size.width, 25)];
	self.appListTableView.backgroundColor = [UIColor clearColor];
	self.appListTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
	self.appListTableView.delegate = self;
	self.appListTableView.dataSource = self;
	
	self.appListTableView.sectionHeaderHeight = 8;
	self.appListTableView.rowHeight = 52;

	SBFloatyFolderBackgroundClipView *folderBackgroundClipView = (SBFloatyFolderBackgroundClipView *) self.customListView.superview.superview;
	double cornerRadius = MSHookIvar<double>(folderBackgroundClipView.backgroundView, "_continuousCornerRadius");
	self.appListTableView.layer.cornerRadius = cornerRadius;
	self.appListTableView.scrollIndicatorInsets = UIEdgeInsetsMake(cornerRadius, 0, cornerRadius, 0);

}


static UIView * _logos_method$Universal$SBFolderController$tableView$viewForHeaderInSection$(_LOGOS_SELF_TYPE_NORMAL SBFolderController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UITableView * tableView, NSInteger section) {
    UIView *view = [[UIView alloc] init];
    [view setBackgroundColor:[UIColor clearColor]];
    return view;
}




static __attribute__((constructor)) void _logosLocalCtor_3db2b46a(int __unused argc, char __unused **argv, char __unused **envp) {
	loadPrefs();
	if (enabled) {
		if (@available(iOS 13, *)) {
			ios13 = YES;
			{Class _logos_class$Tweak13$SBFloatyFolderView = objc_getClass("SBFloatyFolderView"); MSHookMessageEx(_logos_class$Tweak13$SBFloatyFolderView, @selector(iconListViewCount), (IMP)&_logos_method$Tweak13$SBFloatyFolderView$iconListViewCount, (IMP*)&_logos_orig$Tweak13$SBFloatyFolderView$iconListViewCount);}
		} else {
			ios13 = NO;
			{Class _logos_class$Tweak12$SBFolderIconListView = objc_getClass("SBFolderIconListView"); MSHookMessageEx(_logos_class$Tweak12$SBFolderIconListView, @selector(initWithModel:orientation:viewMap:), (IMP)&_logos_method$Tweak12$SBFolderIconListView$initWithModel$orientation$viewMap$, (IMP*)&_logos_orig$Tweak12$SBFolderIconListView$initWithModel$orientation$viewMap$);Class _logos_class$Tweak12$SBFolderView = objc_getClass("SBFolderView"); MSHookMessageEx(_logos_class$Tweak12$SBFolderView, @selector(iconListViewCount), (IMP)&_logos_method$Tweak12$SBFolderView$iconListViewCount, (IMP*)&_logos_orig$Tweak12$SBFolderView$iconListViewCount);}
		}
		
		
		{Class _logos_class$Universal$SBFolderController = objc_getClass("SBFolderController"); MSHookMessageEx(_logos_class$Universal$SBFolderController, @selector(viewDidLoad), (IMP)&_logos_method$Universal$SBFolderController$viewDidLoad, (IMP*)&_logos_orig$Universal$SBFolderController$viewDidLoad);MSHookMessageEx(_logos_class$Universal$SBFolderController, @selector(setEditing:animated:), (IMP)&_logos_method$Universal$SBFolderController$setEditing$animated$, (IMP*)&_logos_orig$Universal$SBFolderController$setEditing$animated$);MSHookMessageEx(_logos_class$Universal$SBFolderController, @selector(setFolder:), (IMP)&_logos_method$Universal$SBFolderController$setFolder$, (IMP*)&_logos_orig$Universal$SBFolderController$setFolder$);MSHookMessageEx(_logos_class$Universal$SBFolderController, @selector(traitCollectionDidChange:), (IMP)&_logos_method$Universal$SBFolderController$traitCollectionDidChange$, (IMP*)&_logos_orig$Universal$SBFolderController$traitCollectionDidChange$);{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$Universal$SBFolderController, @selector(setupIconEntries), (IMP)&_logos_method$Universal$SBFolderController$setupIconEntries, _typeEncoding); }{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; memcpy(_typeEncoding + i, @encode(UITableView *), strlen(@encode(UITableView *))); i += strlen(@encode(UITableView *)); memcpy(_typeEncoding + i, @encode(NSIndexPath *), strlen(@encode(NSIndexPath *))); i += strlen(@encode(NSIndexPath *)); _typeEncoding[i] = '\0'; class_addMethod(_logos_class$Universal$SBFolderController, @selector(tableView:didSelectRowAtIndexPath:), (IMP)&_logos_method$Universal$SBFolderController$tableView$didSelectRowAtIndexPath$, _typeEncoding); }{ char _typeEncoding[1024]; unsigned int i = 0; memcpy(_typeEncoding + i, @encode(NSInteger), strlen(@encode(NSInteger))); i += strlen(@encode(NSInteger)); _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; memcpy(_typeEncoding + i, @encode(UITableView *), strlen(@encode(UITableView *))); i += strlen(@encode(UITableView *)); _typeEncoding[i] = '\0'; class_addMethod(_logos_class$Universal$SBFolderController, @selector(numberOfSectionsInTableView:), (IMP)&_logos_method$Universal$SBFolderController$numberOfSectionsInTableView$, _typeEncoding); }{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$Universal$SBFolderController, @selector(deselectAllRows), (IMP)&_logos_method$Universal$SBFolderController$deselectAllRows, _typeEncoding); }{ char _typeEncoding[1024]; unsigned int i = 0; memcpy(_typeEncoding + i, @encode(NSInteger), strlen(@encode(NSInteger))); i += strlen(@encode(NSInteger)); _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; memcpy(_typeEncoding + i, @encode(UITableView *), strlen(@encode(UITableView *))); i += strlen(@encode(UITableView *)); memcpy(_typeEncoding + i, @encode(NSInteger), strlen(@encode(NSInteger))); i += strlen(@encode(NSInteger)); _typeEncoding[i] = '\0'; class_addMethod(_logos_class$Universal$SBFolderController, @selector(tableView:numberOfRowsInSection:), (IMP)&_logos_method$Universal$SBFolderController$tableView$numberOfRowsInSection$, _typeEncoding); }{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; memcpy(_typeEncoding + i, @encode(SBApplication *), strlen(@encode(SBApplication *))); i += strlen(@encode(SBApplication *)); _typeEncoding[i] = '\0'; class_addMethod(_logos_class$Universal$SBFolderController, @selector(uninstallApplication:), (IMP)&_logos_method$Universal$SBFolderController$uninstallApplication$, _typeEncoding); }{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; memcpy(_typeEncoding + i, @encode(UISwipeGestureRecognizer *), strlen(@encode(UISwipeGestureRecognizer *))); i += strlen(@encode(UISwipeGestureRecognizer *)); _typeEncoding[i] = '\0'; class_addMethod(_logos_class$Universal$SBFolderController, @selector(handleSwipe:), (IMP)&_logos_method$Universal$SBFolderController$handleSwipe$, _typeEncoding); }{ char _typeEncoding[1024]; unsigned int i = 0; memcpy(_typeEncoding + i, @encode(UITableViewCell *), strlen(@encode(UITableViewCell *))); i += strlen(@encode(UITableViewCell *)); _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; memcpy(_typeEncoding + i, @encode(UITableView *), strlen(@encode(UITableView *))); i += strlen(@encode(UITableView *)); memcpy(_typeEncoding + i, @encode(NSIndexPath *), strlen(@encode(NSIndexPath *))); i += strlen(@encode(NSIndexPath *)); _typeEncoding[i] = '\0'; class_addMethod(_logos_class$Universal$SBFolderController, @selector(tableView:cellForRowAtIndexPath:), (IMP)&_logos_method$Universal$SBFolderController$tableView$cellForRowAtIndexPath$, _typeEncoding); }{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$Universal$SBFolderController, @selector(setupAppList), (IMP)&_logos_method$Universal$SBFolderController$setupAppList, _typeEncoding); }{ char _typeEncoding[1024]; unsigned int i = 0; memcpy(_typeEncoding + i, @encode(UIView *), strlen(@encode(UIView *))); i += strlen(@encode(UIView *)); _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; memcpy(_typeEncoding + i, @encode(UITableView *), strlen(@encode(UITableView *))); i += strlen(@encode(UITableView *)); memcpy(_typeEncoding + i, @encode(NSInteger), strlen(@encode(NSInteger))); i += strlen(@encode(NSInteger)); _typeEncoding[i] = '\0'; class_addMethod(_logos_class$Universal$SBFolderController, @selector(tableView:viewForHeaderInSection:), (IMP)&_logos_method$Universal$SBFolderController$tableView$viewForHeaderInSection$, _typeEncoding); }{ char _typeEncoding[1024]; sprintf(_typeEncoding, "%s@:", @encode(NSArray *)); class_addMethod(_logos_class$Universal$SBFolderController, @selector(icons), (IMP)&_logos_method$Universal$SBFolderController$icons, _typeEncoding); sprintf(_typeEncoding, "v@:%s", @encode(NSArray *)); class_addMethod(_logos_class$Universal$SBFolderController, @selector(setIcons:), (IMP)&_logos_method$Universal$SBFolderController$setIcons, _typeEncoding); } { char _typeEncoding[1024]; sprintf(_typeEncoding, "%s@:", @encode(UITableView *)); class_addMethod(_logos_class$Universal$SBFolderController, @selector(appListTableView), (IMP)&_logos_method$Universal$SBFolderController$appListTableView, _typeEncoding); sprintf(_typeEncoding, "v@:%s", @encode(UITableView *)); class_addMethod(_logos_class$Universal$SBFolderController, @selector(setAppListTableView:), (IMP)&_logos_method$Universal$SBFolderController$setAppListTableView, _typeEncoding); } { char _typeEncoding[1024]; sprintf(_typeEncoding, "%s@:", @encode(SBIconListView *)); class_addMethod(_logos_class$Universal$SBFolderController, @selector(customListView), (IMP)&_logos_method$Universal$SBFolderController$customListView, _typeEncoding); sprintf(_typeEncoding, "v@:%s", @encode(SBIconListView *)); class_addMethod(_logos_class$Universal$SBFolderController, @selector(setCustomListView:), (IMP)&_logos_method$Universal$SBFolderController$setCustomListView, _typeEncoding); } { char _typeEncoding[1024]; sprintf(_typeEncoding, "%s@:", @encode(NSString *)); class_addMethod(_logos_class$Universal$SBFolderController, @selector(cellReuseIdentifier), (IMP)&_logos_method$Universal$SBFolderController$cellReuseIdentifier, _typeEncoding); sprintf(_typeEncoding, "v@:%s", @encode(NSString *)); class_addMethod(_logos_class$Universal$SBFolderController, @selector(setCellReuseIdentifier:), (IMP)&_logos_method$Universal$SBFolderController$setCellReuseIdentifier, _typeEncoding); } { char _typeEncoding[1024]; sprintf(_typeEncoding, "%s@:", @encode(NSMutableArray *)); class_addMethod(_logos_class$Universal$SBFolderController, @selector(iconEntries), (IMP)&_logos_method$Universal$SBFolderController$iconEntries, _typeEncoding); sprintf(_typeEncoding, "v@:%s", @encode(NSMutableArray *)); class_addMethod(_logos_class$Universal$SBFolderController, @selector(setIconEntries:), (IMP)&_logos_method$Universal$SBFolderController$setIconEntries, _typeEncoding); } { char _typeEncoding[1024]; sprintf(_typeEncoding, "%s@:", @encode(BOOL)); class_addMethod(_logos_class$Universal$SBFolderController, @selector(hasAddedCustomView), (IMP)&_logos_method$Universal$SBFolderController$hasAddedCustomView, _typeEncoding); sprintf(_typeEncoding, "v@:%s", @encode(BOOL)); class_addMethod(_logos_class$Universal$SBFolderController, @selector(setHasAddedCustomView:), (IMP)&_logos_method$Universal$SBFolderController$setHasAddedCustomView, _typeEncoding); } }
	}
}
