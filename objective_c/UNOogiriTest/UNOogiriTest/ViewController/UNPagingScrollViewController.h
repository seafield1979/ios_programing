//
//  UNPagingScrollViewController.h
//

#import "UNPagingBaseViewController.h"
#import "UNPageWebView.h"

@class UNPagingScrollViewController;

@protocol UNPagingScrollViewControllerDelegate <NSObject>

- (void)changeCurrentCategoryByPagingScrollView:(UNPagingScrollViewController *)pagingScrollViewController;
- (void)handlePanGesture:(UNPagingScrollViewController *)pagingScrollViewController gesture:(UIPanGestureRecognizer *)panGesture;

- (void)didScrollUp:(UNPagingScrollViewController *)viewController;
- (void)didScrollDown:(UNPagingScrollViewController *)viewController;

@end

@interface UNPagingScrollViewController : UNPagingBaseViewController <UIGestureRecognizerDelegate>

@property (nonatomic, weak) id <UNPagingScrollViewControllerDelegate> delegate;

- (void)initPagingScrollView;
- (void)movePageWithValue:(CGFloat)value animated:(BOOL)animated;

- (NSUInteger)currentPage;

- (void)categoryChangedByTabButton:(NSUInteger)categoryID;
- (void)currentPageChanged;

@end
