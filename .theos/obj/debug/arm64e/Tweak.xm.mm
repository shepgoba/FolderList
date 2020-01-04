#line 1 "Tweak.xm"
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


@interface UIImage (UIApplicationIconPrivate)
















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

@class SBFloatyFolderController; @class SBFloatyFolderView; @class SBFolderController; @class SBIconListModel; @class SBRootFolderController; @class SBFolderIconListView; @class SBFolderView; @class SBApplicationController; 
static SBFolderIconListView* (*_logos_orig$_ungrouped$SBFolderIconListView$initWithModel$orientation$viewMap$)(_LOGOS_SELF_TYPE_INIT SBFolderIconListView*, SEL, id, long long, id) _LOGOS_RETURN_RETAINED; static SBFolderIconListView* _logos_method$_ungrouped$SBFolderIconListView$initWithModel$orientation$viewMap$(_LOGOS_SELF_TYPE_INIT SBFolderIconListView*, SEL, id, long long, id) _LOGOS_RETURN_RETAINED; static void _logos_method$_ungrouped$SBFolderIconListView$hideIcons(_LOGOS_SELF_TYPE_NORMAL SBFolderIconListView* _LOGOS_SELF_CONST, SEL); static CGFloat _logos_method$_ungrouped$SBFolderController$tableView$heightForRowAtIndexPath$(_LOGOS_SELF_TYPE_NORMAL SBFolderController* _LOGOS_SELF_CONST, SEL, UITableView *, NSIndexPath *); static void (*_logos_orig$_ungrouped$SBFolderController$setFolder$)(_LOGOS_SELF_TYPE_NORMAL SBFolderController* _LOGOS_SELF_CONST, SEL, SBFolder *); static void _logos_method$_ungrouped$SBFolderController$setFolder$(_LOGOS_SELF_TYPE_NORMAL SBFolderController* _LOGOS_SELF_CONST, SEL, SBFolder *); static void _logos_method$_ungrouped$SBFolderController$setupIconEntries(_LOGOS_SELF_TYPE_NORMAL SBFolderController* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$SBFolderController$viewDidLoad)(_LOGOS_SELF_TYPE_NORMAL SBFolderController* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$SBFolderController$viewDidLoad(_LOGOS_SELF_TYPE_NORMAL SBFolderController* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$SBFolderController$setupAppViews(_LOGOS_SELF_TYPE_NORMAL SBFolderController* _LOGOS_SELF_CONST, SEL); static CAAnimation* _logos_method$_ungrouped$SBFolderController$getShakeAnimation(_LOGOS_SELF_TYPE_NORMAL SBFolderController* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$SBFolderController$tableView$didSelectRowAtIndexPath$(_LOGOS_SELF_TYPE_NORMAL SBFolderController* _LOGOS_SELF_CONST, SEL, UITableView *, NSIndexPath *); static void _logos_method$_ungrouped$SBFolderController$tableView$commitEditingStyle$forRowAtIndexPath$(_LOGOS_SELF_TYPE_NORMAL SBFolderController* _LOGOS_SELF_CONST, SEL, UITableView *, UITableViewCellEditingStyle, NSIndexPath *); static NSInteger _logos_method$_ungrouped$SBFolderController$numberOfSectionsInTableView$(_LOGOS_SELF_TYPE_NORMAL SBFolderController* _LOGOS_SELF_CONST, SEL, UITableView *); static void _logos_method$_ungrouped$SBFolderController$deselectAllRows(_LOGOS_SELF_TYPE_NORMAL SBFolderController* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$SBFolderController$setEditing$animated$)(_LOGOS_SELF_TYPE_NORMAL SBFolderController* _LOGOS_SELF_CONST, SEL, BOOL, BOOL); static void _logos_method$_ungrouped$SBFolderController$setEditing$animated$(_LOGOS_SELF_TYPE_NORMAL SBFolderController* _LOGOS_SELF_CONST, SEL, BOOL, BOOL); static NSInteger _logos_method$_ungrouped$SBFolderController$tableView$numberOfRowsInSection$(_LOGOS_SELF_TYPE_NORMAL SBFolderController* _LOGOS_SELF_CONST, SEL, UITableView *, NSInteger); static void (*_logos_orig$_ungrouped$SBFolderController$traitCollectionDidChange$)(_LOGOS_SELF_TYPE_NORMAL SBFolderController* _LOGOS_SELF_CONST, SEL, UITraitCollection *); static void _logos_method$_ungrouped$SBFolderController$traitCollectionDidChange$(_LOGOS_SELF_TYPE_NORMAL SBFolderController* _LOGOS_SELF_CONST, SEL, UITraitCollection *); static void _logos_method$_ungrouped$SBFolderController$handleLongPress$(_LOGOS_SELF_TYPE_NORMAL SBFolderController* _LOGOS_SELF_CONST, SEL, UILongPressGestureRecognizer *); static UITableViewCell * _logos_method$_ungrouped$SBFolderController$tableView$cellForRowAtIndexPath$(_LOGOS_SELF_TYPE_NORMAL SBFolderController* _LOGOS_SELF_CONST, SEL, UITableView *, NSIndexPath *); static void _logos_method$_ungrouped$SBFolderController$setupAppList(_LOGOS_SELF_TYPE_NORMAL SBFolderController* _LOGOS_SELF_CONST, SEL); static CGFloat _logos_method$_ungrouped$SBFolderController$tableView$heightForHeaderInSection$(_LOGOS_SELF_TYPE_NORMAL SBFolderController* _LOGOS_SELF_CONST, SEL, UITableView *, NSInteger); static UIView * _logos_method$_ungrouped$SBFolderController$tableView$viewForHeaderInSection$(_LOGOS_SELF_TYPE_NORMAL SBFolderController* _LOGOS_SELF_CONST, SEL, UITableView *, NSInteger); 
static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$SBApplicationController(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("SBApplicationController"); } return _klass; }static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$SBIconListModel(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("SBIconListModel"); } return _klass; }static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$SBRootFolderController(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("SBRootFolderController"); } return _klass; }static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$SBFolderController(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("SBFolderController"); } return _klass; }static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$SBFloatyFolderController(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("SBFloatyFolderController"); } return _klass; }
#line 182 "Tweak.xm"

static SBFolderIconListView* _logos_method$_ungrouped$SBFolderIconListView$initWithModel$orientation$viewMap$(_LOGOS_SELF_TYPE_INIT SBFolderIconListView* __unused self, SEL __unused _cmd, id arg1, long long arg2, id arg3) _LOGOS_RETURN_RETAINED {
	SBIconListModel *customModel = [[_logos_static_class_lookup$SBIconListModel() alloc] initWithFolder:((SBIconListModel *)arg1).folder maxIconCount:0];
	return _logos_orig$_ungrouped$SBFolderIconListView$initWithModel$orientation$viewMap$(self, _cmd, customModel, arg2, arg3);
}


static void _logos_method$_ungrouped$SBFolderIconListView$hideIcons(_LOGOS_SELF_TYPE_NORMAL SBFolderIconListView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {

}


static unsigned long long (*_logos_orig$Tweak12$SBFolderView$iconListViewCount)(_LOGOS_SELF_TYPE_NORMAL SBFolderView* _LOGOS_SELF_CONST, SEL); static unsigned long long _logos_method$Tweak12$SBFolderView$iconListViewCount(_LOGOS_SELF_TYPE_NORMAL SBFolderView* _LOGOS_SELF_CONST, SEL); 

static unsigned long long _logos_method$Tweak12$SBFolderView$iconListViewCount(_LOGOS_SELF_TYPE_NORMAL SBFolderView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	return 1;
}



static unsigned long long (*_logos_orig$Tweak13$SBFloatyFolderView$iconListViewCount)(_LOGOS_SELF_TYPE_NORMAL SBFloatyFolderView* _LOGOS_SELF_CONST, SEL); static unsigned long long _logos_method$Tweak13$SBFloatyFolderView$iconListViewCount(_LOGOS_SELF_TYPE_NORMAL SBFloatyFolderView* _LOGOS_SELF_CONST, SEL); 

static unsigned long long _logos_method$Tweak13$SBFloatyFolderView$iconListViewCount(_LOGOS_SELF_TYPE_NORMAL SBFloatyFolderView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	return 1;
}



static BOOL ios13;

__attribute__((used)) static NSArray * _logos_method$_ungrouped$SBFolderController$icons(SBFolderController * __unused self, SEL __unused _cmd) { return (NSArray *)objc_getAssociatedObject(self, (void *)_logos_method$_ungrouped$SBFolderController$icons); }; __attribute__((used)) static void _logos_method$_ungrouped$SBFolderController$setIcons(SBFolderController * __unused self, SEL __unused _cmd, NSArray * rawValue) { objc_setAssociatedObject(self, (void *)_logos_method$_ungrouped$SBFolderController$icons, rawValue, OBJC_ASSOCIATION_RETAIN_NONATOMIC); } 
__attribute__((used)) static UITableView * _logos_method$_ungrouped$SBFolderController$appListTableView(SBFolderController * __unused self, SEL __unused _cmd) { return (UITableView *)objc_getAssociatedObject(self, (void *)_logos_method$_ungrouped$SBFolderController$appListTableView); }; __attribute__((used)) static void _logos_method$_ungrouped$SBFolderController$setAppListTableView(SBFolderController * __unused self, SEL __unused _cmd, UITableView * rawValue) { objc_setAssociatedObject(self, (void *)_logos_method$_ungrouped$SBFolderController$appListTableView, rawValue, OBJC_ASSOCIATION_RETAIN_NONATOMIC); }
__attribute__((used)) static SBIconListView * _logos_method$_ungrouped$SBFolderController$customListView(SBFolderController * __unused self, SEL __unused _cmd) { return (SBIconListView *)objc_getAssociatedObject(self, (void *)_logos_method$_ungrouped$SBFolderController$customListView); }; __attribute__((used)) static void _logos_method$_ungrouped$SBFolderController$setCustomListView(SBFolderController * __unused self, SEL __unused _cmd, SBIconListView * rawValue) { objc_setAssociatedObject(self, (void *)_logos_method$_ungrouped$SBFolderController$customListView, rawValue, OBJC_ASSOCIATION_RETAIN_NONATOMIC); }
__attribute__((used)) static NSString * _logos_method$_ungrouped$SBFolderController$cellReuseIdentifier(SBFolderController * __unused self, SEL __unused _cmd) { return (NSString *)objc_getAssociatedObject(self, (void *)_logos_method$_ungrouped$SBFolderController$cellReuseIdentifier); }; __attribute__((used)) static void _logos_method$_ungrouped$SBFolderController$setCellReuseIdentifier(SBFolderController * __unused self, SEL __unused _cmd, NSString * rawValue) { objc_setAssociatedObject(self, (void *)_logos_method$_ungrouped$SBFolderController$cellReuseIdentifier, rawValue, OBJC_ASSOCIATION_RETAIN_NONATOMIC); }
__attribute__((used)) static NSMutableArray * _logos_method$_ungrouped$SBFolderController$iconEntries(SBFolderController * __unused self, SEL __unused _cmd) { return (NSMutableArray *)objc_getAssociatedObject(self, (void *)_logos_method$_ungrouped$SBFolderController$iconEntries); }; __attribute__((used)) static void _logos_method$_ungrouped$SBFolderController$setIconEntries(SBFolderController * __unused self, SEL __unused _cmd, NSMutableArray * rawValue) { objc_setAssociatedObject(self, (void *)_logos_method$_ungrouped$SBFolderController$iconEntries, rawValue, OBJC_ASSOCIATION_RETAIN_NONATOMIC); }








static CGFloat _logos_method$_ungrouped$SBFolderController$tableView$heightForRowAtIndexPath$(_LOGOS_SELF_TYPE_NORMAL SBFolderController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UITableView * tableView, NSIndexPath * indexPath) {
    return 52;
}

static void _logos_method$_ungrouped$SBFolderController$setFolder$(_LOGOS_SELF_TYPE_NORMAL SBFolderController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, SBFolder * arg1) {
	_logos_orig$_ungrouped$SBFolderController$setFolder$(self, _cmd, arg1);
	

	if (![self isMemberOfClass:_logos_static_class_lookup$SBFolderController()] && ![self isMemberOfClass:_logos_static_class_lookup$SBFloatyFolderController()]) {
		return;
	}
	NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"displayName" ascending:YES selector:@selector(localizedCaseInsensitiveCompare:)];
	if (ios13) {
		self.icons = [arg1.icons sortedArrayUsingDescriptors:@[sortDescriptor]];
	} else {
		self.icons = [arg1.allIcons sortedArrayUsingDescriptors:@[sortDescriptor]];
	}
}


static void _logos_method$_ungrouped$SBFolderController$setupIconEntries(_LOGOS_SELF_TYPE_NORMAL SBFolderController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	self.iconEntries = [NSMutableArray new];
	
		for (SBApplicationIcon *icon in self.icons) {
			FLIconEntry *newEntry = [[FLIconEntry alloc] initWithApplication:icon.application];
			[self.iconEntries addObject: newEntry];
		}
	
}

static void _logos_method$_ungrouped$SBFolderController$viewDidLoad(_LOGOS_SELF_TYPE_NORMAL SBFolderController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	_logos_orig$_ungrouped$SBFolderController$viewDidLoad(self, _cmd);
	

	if ((![self isMemberOfClass:_logos_static_class_lookup$SBFolderController()] && ![self isMemberOfClass:_logos_static_class_lookup$SBFloatyFolderController()]) || [self isKindOfClass:_logos_static_class_lookup$SBRootFolderController()]) {
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
	lpgr.minimumPressDuration = 2.0; 
	lpgr.delegate = self;
	[self.appListTableView addGestureRecognizer:lpgr];
}





 
static void _logos_method$_ungrouped$SBFolderController$setupAppViews(_LOGOS_SELF_TYPE_NORMAL SBFolderController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	













}

static CAAnimation* _logos_method$_ungrouped$SBFolderController$getShakeAnimation(_LOGOS_SELF_TYPE_NORMAL SBFolderController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
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

static void _logos_method$_ungrouped$SBFolderController$tableView$didSelectRowAtIndexPath$(_LOGOS_SELF_TYPE_NORMAL SBFolderController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UITableView * tableView, NSIndexPath * indexPath) {
	
	[self.appListTableView deselectRowAtIndexPath:indexPath animated:YES];
	
}

static void _logos_method$_ungrouped$SBFolderController$tableView$commitEditingStyle$forRowAtIndexPath$(_LOGOS_SELF_TYPE_NORMAL SBFolderController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UITableView * tableView, UITableViewCellEditingStyle editingStyle, NSIndexPath * indexPath) {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
		SBApplication *application = [self.icons[indexPath.section] application];
        [[_logos_static_class_lookup$SBApplicationController() sharedInstanceIfExists] requestUninstallApplicationWithBundleIdentifier:[application bundleIdentifier] withCompletion:^{
			[self.appListTableView reloadData];
		}];

    }    
}

static NSInteger _logos_method$_ungrouped$SBFolderController$numberOfSectionsInTableView$(_LOGOS_SELF_TYPE_NORMAL SBFolderController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UITableView * tableView) {
    return self.icons.count;
}


static void _logos_method$_ungrouped$SBFolderController$deselectAllRows(_LOGOS_SELF_TYPE_NORMAL SBFolderController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	for (NSIndexPath *indexPath in self.appListTableView.indexPathsForSelectedRows) {
    	[self.appListTableView deselectRowAtIndexPath:indexPath animated:YES];
	}
}















static void _logos_method$_ungrouped$SBFolderController$setEditing$animated$(_LOGOS_SELF_TYPE_NORMAL SBFolderController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, BOOL arg1, BOOL arg2) {
	_logos_orig$_ungrouped$SBFolderController$setEditing$animated$(self, _cmd, arg1, arg2);
	if (ios13) {
		[self.customListView hideAllIcons];
	} else {
		[self.customListView hideIcons];
		if (arg1) {
			
		}
	}
}

static NSInteger _logos_method$_ungrouped$SBFolderController$tableView$numberOfRowsInSection$(_LOGOS_SELF_TYPE_NORMAL SBFolderController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UITableView * tableView, NSInteger section) {
	return 1;
}

static void _logos_method$_ungrouped$SBFolderController$traitCollectionDidChange$(_LOGOS_SELF_TYPE_NORMAL SBFolderController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UITraitCollection * previousTraitCollection) {
	_logos_orig$_ungrouped$SBFolderController$traitCollectionDidChange$(self, _cmd, previousTraitCollection);
	[self.appListTableView reloadData];
}

static void _logos_method$_ungrouped$SBFolderController$handleLongPress$(_LOGOS_SELF_TYPE_NORMAL SBFolderController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UILongPressGestureRecognizer * gestureRecognizer) {
	if (gestureRecognizer.state == UIGestureRecognizerStateRecognized) {
	}
	if (gestureRecognizer.state == UIGestureRecognizerStateEnded) {
		CGPoint touchPoint = [gestureRecognizer locationInView:self.appListTableView];
		NSIndexPath *row = [self.appListTableView indexPathForRowAtPoint:touchPoint];
		if (row != nil) {
			SBApplication *application = [self.icons[row.section] application];
			NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"displayName" ascending:YES selector:@selector(localizedCaseInsensitiveCompare:)];
			if (@available(iOS 11, *)) {
				[[_logos_static_class_lookup$SBApplicationController() sharedInstanceIfExists] requestUninstallApplicationWithBundleIdentifier:application.bundleIdentifier withCompletion: ^{
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
												[[_logos_static_class_lookup$SBApplicationController() sharedInstanceIfExists] uninstallApplication:application];
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

static UITableViewCell * _logos_method$_ungrouped$SBFolderController$tableView$cellForRowAtIndexPath$(_LOGOS_SELF_TYPE_NORMAL SBFolderController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UITableView * tableView, NSIndexPath * indexPath) {
	FLTableViewCell *cell = [self.appListTableView dequeueReusableCellWithIdentifier:self.cellReuseIdentifier forIndexPath:indexPath];
	FLIconEntry *entry = self.iconEntries[indexPath.section];
	
	cell.entry = entry;
	cell.textLabel.text = entry.application.displayName;
	cell.textLabel.backgroundColor = [UIColor clearColor];
	
	
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

static void _logos_method$_ungrouped$SBFolderController$setupAppList(_LOGOS_SELF_TYPE_NORMAL SBFolderController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	NSLog(@"got here");
	self.appListTableView = [[UITableView alloc] initWithFrame:self.customListView.bounds];
	
	self.appListTableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, self.appListTableView.bounds.size.width, 25)];
	self.appListTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, self.appListTableView.bounds.size.width, 25)];
	self.appListTableView.backgroundColor = [UIColor clearColor];
	self.appListTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
	self.appListTableView.delegate = self;
	self.appListTableView.dataSource = self;
	self.appListTableView.layer.cornerRadius = 38;
	self.appListTableView.scrollIndicatorInsets = UIEdgeInsetsMake(38, 0, 38, 0);
	
	
	
	
	
}

static CGFloat _logos_method$_ungrouped$SBFolderController$tableView$heightForHeaderInSection$(_LOGOS_SELF_TYPE_NORMAL SBFolderController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UITableView * tableView, NSInteger section) {
    return 8;
}


static UIView * _logos_method$_ungrouped$SBFolderController$tableView$viewForHeaderInSection$(_LOGOS_SELF_TYPE_NORMAL SBFolderController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UITableView * tableView, NSInteger section) {
    UIView *v = [UIView new];
    [v setBackgroundColor:[UIColor clearColor]];
    return v;
}



static __attribute__((constructor)) void _logosLocalCtor_952e7dc1(int __unused argc, char __unused **argv, char __unused **envp) {
	NSLog(@"called");
	if (@available(iOS 13, *)) {
		ios13 = YES;
		{Class _logos_class$Tweak13$SBFloatyFolderView = objc_getClass("SBFloatyFolderView"); MSHookMessageEx(_logos_class$Tweak13$SBFloatyFolderView, @selector(iconListViewCount), (IMP)&_logos_method$Tweak13$SBFloatyFolderView$iconListViewCount, (IMP*)&_logos_orig$Tweak13$SBFloatyFolderView$iconListViewCount);}
	} else {
		ios13 = NO;
		{Class _logos_class$Tweak12$SBFolderView = objc_getClass("SBFolderView"); MSHookMessageEx(_logos_class$Tweak12$SBFolderView, @selector(iconListViewCount), (IMP)&_logos_method$Tweak12$SBFolderView$iconListViewCount, (IMP*)&_logos_orig$Tweak12$SBFolderView$iconListViewCount);}
	}
	
	
	{Class _logos_class$_ungrouped$SBFolderIconListView = objc_getClass("SBFolderIconListView"); MSHookMessageEx(_logos_class$_ungrouped$SBFolderIconListView, @selector(initWithModel:orientation:viewMap:), (IMP)&_logos_method$_ungrouped$SBFolderIconListView$initWithModel$orientation$viewMap$, (IMP*)&_logos_orig$_ungrouped$SBFolderIconListView$initWithModel$orientation$viewMap$);{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$SBFolderIconListView, @selector(hideIcons), (IMP)&_logos_method$_ungrouped$SBFolderIconListView$hideIcons, _typeEncoding); }Class _logos_class$_ungrouped$SBFolderController = objc_getClass("SBFolderController"); { char _typeEncoding[1024]; unsigned int i = 0; memcpy(_typeEncoding + i, @encode(CGFloat), strlen(@encode(CGFloat))); i += strlen(@encode(CGFloat)); _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; memcpy(_typeEncoding + i, @encode(UITableView *), strlen(@encode(UITableView *))); i += strlen(@encode(UITableView *)); memcpy(_typeEncoding + i, @encode(NSIndexPath *), strlen(@encode(NSIndexPath *))); i += strlen(@encode(NSIndexPath *)); _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$SBFolderController, @selector(tableView:heightForRowAtIndexPath:), (IMP)&_logos_method$_ungrouped$SBFolderController$tableView$heightForRowAtIndexPath$, _typeEncoding); }MSHookMessageEx(_logos_class$_ungrouped$SBFolderController, @selector(setFolder:), (IMP)&_logos_method$_ungrouped$SBFolderController$setFolder$, (IMP*)&_logos_orig$_ungrouped$SBFolderController$setFolder$);{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$SBFolderController, @selector(setupIconEntries), (IMP)&_logos_method$_ungrouped$SBFolderController$setupIconEntries, _typeEncoding); }MSHookMessageEx(_logos_class$_ungrouped$SBFolderController, @selector(viewDidLoad), (IMP)&_logos_method$_ungrouped$SBFolderController$viewDidLoad, (IMP*)&_logos_orig$_ungrouped$SBFolderController$viewDidLoad);{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$SBFolderController, @selector(setupAppViews), (IMP)&_logos_method$_ungrouped$SBFolderController$setupAppViews, _typeEncoding); }{ char _typeEncoding[1024]; unsigned int i = 0; memcpy(_typeEncoding + i, @encode(CAAnimation*), strlen(@encode(CAAnimation*))); i += strlen(@encode(CAAnimation*)); _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$SBFolderController, @selector(getShakeAnimation), (IMP)&_logos_method$_ungrouped$SBFolderController$getShakeAnimation, _typeEncoding); }{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; memcpy(_typeEncoding + i, @encode(UITableView *), strlen(@encode(UITableView *))); i += strlen(@encode(UITableView *)); memcpy(_typeEncoding + i, @encode(NSIndexPath *), strlen(@encode(NSIndexPath *))); i += strlen(@encode(NSIndexPath *)); _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$SBFolderController, @selector(tableView:didSelectRowAtIndexPath:), (IMP)&_logos_method$_ungrouped$SBFolderController$tableView$didSelectRowAtIndexPath$, _typeEncoding); }{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; memcpy(_typeEncoding + i, @encode(UITableView *), strlen(@encode(UITableView *))); i += strlen(@encode(UITableView *)); memcpy(_typeEncoding + i, @encode(UITableViewCellEditingStyle), strlen(@encode(UITableViewCellEditingStyle))); i += strlen(@encode(UITableViewCellEditingStyle)); memcpy(_typeEncoding + i, @encode(NSIndexPath *), strlen(@encode(NSIndexPath *))); i += strlen(@encode(NSIndexPath *)); _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$SBFolderController, @selector(tableView:commitEditingStyle:forRowAtIndexPath:), (IMP)&_logos_method$_ungrouped$SBFolderController$tableView$commitEditingStyle$forRowAtIndexPath$, _typeEncoding); }{ char _typeEncoding[1024]; unsigned int i = 0; memcpy(_typeEncoding + i, @encode(NSInteger), strlen(@encode(NSInteger))); i += strlen(@encode(NSInteger)); _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; memcpy(_typeEncoding + i, @encode(UITableView *), strlen(@encode(UITableView *))); i += strlen(@encode(UITableView *)); _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$SBFolderController, @selector(numberOfSectionsInTableView:), (IMP)&_logos_method$_ungrouped$SBFolderController$numberOfSectionsInTableView$, _typeEncoding); }{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$SBFolderController, @selector(deselectAllRows), (IMP)&_logos_method$_ungrouped$SBFolderController$deselectAllRows, _typeEncoding); }MSHookMessageEx(_logos_class$_ungrouped$SBFolderController, @selector(setEditing:animated:), (IMP)&_logos_method$_ungrouped$SBFolderController$setEditing$animated$, (IMP*)&_logos_orig$_ungrouped$SBFolderController$setEditing$animated$);{ char _typeEncoding[1024]; unsigned int i = 0; memcpy(_typeEncoding + i, @encode(NSInteger), strlen(@encode(NSInteger))); i += strlen(@encode(NSInteger)); _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; memcpy(_typeEncoding + i, @encode(UITableView *), strlen(@encode(UITableView *))); i += strlen(@encode(UITableView *)); memcpy(_typeEncoding + i, @encode(NSInteger), strlen(@encode(NSInteger))); i += strlen(@encode(NSInteger)); _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$SBFolderController, @selector(tableView:numberOfRowsInSection:), (IMP)&_logos_method$_ungrouped$SBFolderController$tableView$numberOfRowsInSection$, _typeEncoding); }MSHookMessageEx(_logos_class$_ungrouped$SBFolderController, @selector(traitCollectionDidChange:), (IMP)&_logos_method$_ungrouped$SBFolderController$traitCollectionDidChange$, (IMP*)&_logos_orig$_ungrouped$SBFolderController$traitCollectionDidChange$);{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; memcpy(_typeEncoding + i, @encode(UILongPressGestureRecognizer *), strlen(@encode(UILongPressGestureRecognizer *))); i += strlen(@encode(UILongPressGestureRecognizer *)); _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$SBFolderController, @selector(handleLongPress:), (IMP)&_logos_method$_ungrouped$SBFolderController$handleLongPress$, _typeEncoding); }{ char _typeEncoding[1024]; unsigned int i = 0; memcpy(_typeEncoding + i, @encode(UITableViewCell *), strlen(@encode(UITableViewCell *))); i += strlen(@encode(UITableViewCell *)); _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; memcpy(_typeEncoding + i, @encode(UITableView *), strlen(@encode(UITableView *))); i += strlen(@encode(UITableView *)); memcpy(_typeEncoding + i, @encode(NSIndexPath *), strlen(@encode(NSIndexPath *))); i += strlen(@encode(NSIndexPath *)); _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$SBFolderController, @selector(tableView:cellForRowAtIndexPath:), (IMP)&_logos_method$_ungrouped$SBFolderController$tableView$cellForRowAtIndexPath$, _typeEncoding); }{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$SBFolderController, @selector(setupAppList), (IMP)&_logos_method$_ungrouped$SBFolderController$setupAppList, _typeEncoding); }{ char _typeEncoding[1024]; unsigned int i = 0; memcpy(_typeEncoding + i, @encode(CGFloat), strlen(@encode(CGFloat))); i += strlen(@encode(CGFloat)); _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; memcpy(_typeEncoding + i, @encode(UITableView *), strlen(@encode(UITableView *))); i += strlen(@encode(UITableView *)); memcpy(_typeEncoding + i, @encode(NSInteger), strlen(@encode(NSInteger))); i += strlen(@encode(NSInteger)); _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$SBFolderController, @selector(tableView:heightForHeaderInSection:), (IMP)&_logos_method$_ungrouped$SBFolderController$tableView$heightForHeaderInSection$, _typeEncoding); }{ char _typeEncoding[1024]; unsigned int i = 0; memcpy(_typeEncoding + i, @encode(UIView *), strlen(@encode(UIView *))); i += strlen(@encode(UIView *)); _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; memcpy(_typeEncoding + i, @encode(UITableView *), strlen(@encode(UITableView *))); i += strlen(@encode(UITableView *)); memcpy(_typeEncoding + i, @encode(NSInteger), strlen(@encode(NSInteger))); i += strlen(@encode(NSInteger)); _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$SBFolderController, @selector(tableView:viewForHeaderInSection:), (IMP)&_logos_method$_ungrouped$SBFolderController$tableView$viewForHeaderInSection$, _typeEncoding); }{ char _typeEncoding[1024]; sprintf(_typeEncoding, "%s@:", @encode(NSArray *)); class_addMethod(_logos_class$_ungrouped$SBFolderController, @selector(icons), (IMP)&_logos_method$_ungrouped$SBFolderController$icons, _typeEncoding); sprintf(_typeEncoding, "v@:%s", @encode(NSArray *)); class_addMethod(_logos_class$_ungrouped$SBFolderController, @selector(setIcons:), (IMP)&_logos_method$_ungrouped$SBFolderController$setIcons, _typeEncoding); } { char _typeEncoding[1024]; sprintf(_typeEncoding, "%s@:", @encode(UITableView *)); class_addMethod(_logos_class$_ungrouped$SBFolderController, @selector(appListTableView), (IMP)&_logos_method$_ungrouped$SBFolderController$appListTableView, _typeEncoding); sprintf(_typeEncoding, "v@:%s", @encode(UITableView *)); class_addMethod(_logos_class$_ungrouped$SBFolderController, @selector(setAppListTableView:), (IMP)&_logos_method$_ungrouped$SBFolderController$setAppListTableView, _typeEncoding); } { char _typeEncoding[1024]; sprintf(_typeEncoding, "%s@:", @encode(SBIconListView *)); class_addMethod(_logos_class$_ungrouped$SBFolderController, @selector(customListView), (IMP)&_logos_method$_ungrouped$SBFolderController$customListView, _typeEncoding); sprintf(_typeEncoding, "v@:%s", @encode(SBIconListView *)); class_addMethod(_logos_class$_ungrouped$SBFolderController, @selector(setCustomListView:), (IMP)&_logos_method$_ungrouped$SBFolderController$setCustomListView, _typeEncoding); } { char _typeEncoding[1024]; sprintf(_typeEncoding, "%s@:", @encode(NSString *)); class_addMethod(_logos_class$_ungrouped$SBFolderController, @selector(cellReuseIdentifier), (IMP)&_logos_method$_ungrouped$SBFolderController$cellReuseIdentifier, _typeEncoding); sprintf(_typeEncoding, "v@:%s", @encode(NSString *)); class_addMethod(_logos_class$_ungrouped$SBFolderController, @selector(setCellReuseIdentifier:), (IMP)&_logos_method$_ungrouped$SBFolderController$setCellReuseIdentifier, _typeEncoding); } { char _typeEncoding[1024]; sprintf(_typeEncoding, "%s@:", @encode(NSMutableArray *)); class_addMethod(_logos_class$_ungrouped$SBFolderController, @selector(iconEntries), (IMP)&_logos_method$_ungrouped$SBFolderController$iconEntries, _typeEncoding); sprintf(_typeEncoding, "v@:%s", @encode(NSMutableArray *)); class_addMethod(_logos_class$_ungrouped$SBFolderController, @selector(setIconEntries:), (IMP)&_logos_method$_ungrouped$SBFolderController$setIconEntries, _typeEncoding); } }
}
