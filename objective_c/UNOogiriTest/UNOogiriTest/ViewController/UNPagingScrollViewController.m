//
//  UNPagingScrollViewController.m
//

#import "UNPagingScrollViewController.h"

//#import "ATCategoryInfo.h"
//#import "ATDeviceInfo.h"

@interface UNPagingScrollViewController ()

@property (nonatomic, strong) NSArray *pageViewArray;
@property (nonatomic, assign) BOOL isGesturePageSwipeScrolling;

@end

@implementation UNPagingScrollViewController

NSUInteger const UNpageViewMaxCount = 3;

#pragma mark - Initialize

#if 0
- (void)initPagingScrollView {
    // Init scroll view
    [self initScrollView];

    // Add list view to scroll view
    [self addListViewController];

    // Get current page view
//    UNPageWebView *pageWebView = [self currentListViewController];
//    listViewController.collectionView.scrollsToTop = YES;
}

- (void)initScrollView {
    // Scroll view configuration
    [super initScrollView];

    // Add pan gesture
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePanGesture:)];
    panGesture.delegate = self;
    [self.scrollView addGestureRecognizer:panGesture];
    [self.scrollView.panGestureRecognizer requireGestureRecognizerToFail:panGesture];
}

/*
 * スクロールViewにページのviewを追加する
 */
- (void)addListViewController {
    NSMutableArray *tempListViewArray = [NSMutableArray arrayWithCapacity:0];
    CGRect scrollViewRect = self.scrollView.frame;
    CGRect pageViewRect = CGRectMake(0.0f, 0.0f, CGRectGetWidth(scrollViewRect), CGRectGetHeight(scrollViewRect));

    for (NSUInteger count = 0; count < UNpageViewMaxCount; count++) {
        UNPageWebView *pageView = [[UNPageWebView alloc] initWithFrame:CGRectMake(count * CGRectGetWidth(scrollViewRect), 0, CGRectGetWidth(scrollViewRect), CGRectGetHeight(scrollViewRect))];
//        listViewController.delegate = self;
        pageView.frame = pageViewRect;
        pageView.categoryID = count;
        pageView.pageNum = count;
        [self.scrollView addSubview:pageView];

        pageViewRect.origin.x += CGRectGetWidth(scrollViewRect);
        [tempListViewArray addObject:pageView];
    }
    // Keep listview controller to array
    self.pageViewArray = [NSArray arrayWithArray:tempListViewArray];
    // Change current page (set scrollsToTop property to any tableview)
    [self currentPageChanged];
}

#pragma mark - Gesture event

- (void)handlePanGesture:(UIPanGestureRecognizer *)panGesture {
    if ([self.delegate respondsToSelector:@selector(handlePanGesture:gesture:)]) {
        [self.delegate handlePanGesture:self gesture:panGesture];
    }
}

#pragma mark - Public methods


/*
 * スクロール値によってページを切り替える
 * @param value   xスクロール値
 * @param animated  アニメーションするかどうか
 */
- (void)movePageWithValue:(CGFloat)value animated:(BOOL)animated {
    if ([self currentPage] != UNPagingPageFirst) {
        return;
    }
    if (self.isGesturePageSwipeScrolling == YES) {
        return;
    }

    if (value >= 30.0f) {
        // Swipe
        self.isGesturePageSwipeScrolling = YES;
        self.scrollView.pagingEnabled = NO; // Once paging off for force back
        [self scrollWithPage:UNPagingPageMiddle animated:YES];
    } else {
        // Move
        CGPoint offset = self.scrollView.contentOffset;
        offset.x += value;
        [self.scrollView setContentOffset:offset animated:animated];
    }
}

/*
 * 現在のページ番号を取得する
 */
//- (NSUInteger)currentPage {
//    
////    UNPageWebView *pageView = self.pageViewArray[
//    
////    NSUInteger currentCategoryID = [ATCategoryInfo sharedObject].currentCategoryID;
////    for (ATTopicListViewController *controller in self.topicListViewArray) {
////        if (controller.categoryID == currentCategoryID) {
////            return controller.pageNum;
////        }
////    }
//    return 0;
//}

/*
 * リストで保持しているViewを返す(左、真ん中、右)
 * @param page  取得したいページbangou
 */
- (UNPageWebView *)pageViewWithPage:(NSUInteger)page {
    if (self.pageViewArray == nil) {
        return nil;
    }
    for (UNPageWebView *pageView in self.pageViewArray) {
        if (pageView.pageNum == page) {
            return pageView;
        }
    }
    return nil;
}

/*
 *
 */
- (UNPageWebView *)currentPageView {
    return [self pageViewWithPage:[self currentPage]];
}

- (void)categoryChangedByTabButton:(NSUInteger)categoryID {
    // Get manager
    //ATCategoryInfo *categoryManager = [ATCategoryInfo sharedObject];

    BOOL isScrollToLeft = YES;
    // Change caterogy
    if (categoryID == categoryManager.firstCategoryID) {
        isScrollToLeft = YES;
    } else if (categoryID == categoryManager.lastCategoryID) {
        isScrollToLeft = NO;
    } else {
        ATTopicListViewController *currentListViewController = self.currentListViewController;
        NSUInteger currentCategoryIndex = [categoryManager categoryOrderIndexWithCategoryID:currentListViewController.categoryID];
        NSUInteger selectedCategoryIndex = [categoryManager categoryOrderIndexWithCategoryID:categoryID];
        if (selectedCategoryIndex < currentCategoryIndex) {
            isScrollToLeft = YES;
        } else {
            isScrollToLeft = NO;
        }
    }

    NSUInteger newCurrentPage = ATPagingPageFirst;
    if (isScrollToLeft == YES) {
        // Scroll to left
        if (self.currentPage == ATPagingPageLast && categoryID != categoryManager.firstCategoryID) {
            newCurrentPage = ATPagingPageMiddle;
        } else {
            newCurrentPage = ATPagingPageFirst;
        }
    } else {
        // Scroll to right
        if (self.currentPage == ATPagingPageFirst && categoryID != categoryManager.lastCategoryID) {
            newCurrentPage = ATPagingPageMiddle;
        } else {
            newCurrentPage = ATPagingPageLast;
        }
    }
    // Set category ID
    [self listViewControllerWithPage:newCurrentPage].categoryID = categoryID;

    // Scroll to current page
    [self scrollWithPage:newCurrentPage animated:YES];
}

- (void)currentPageChanged {
    if (self.topicListViewArray == nil) {
        return;
    }
    for (ATTopicListViewController *controller in self.topicListViewArray) {
        if (controller.pageNum == [self currentPage]) {
            [controller changeCurrentPage:YES];
        } else {
            [controller changeCurrentPage:NO];
        }
    }
}

#pragma mark - Private methods

- (NSUInteger)pageCount {
    if (self.topicListViewArray == nil) {
        return 0;
    }
    return self.topicListViewArray.count;
}


/*
 * 右端のViewを左端に移動する
 */
- (void)scrolledToLeft {
    // Get first page view controller
    ATTopicListViewController *page0ListViewController = [self listViewControllerWithPage:ATPagingPageFirst];
    NSUInteger categoryOrderIndex = [[ATCategoryInfo sharedObject] categoryOrderIndexWithCategoryID:page0ListViewController.categoryID];

    if (page0ListViewController.categoryID == [ATCategoryInfo sharedObject].firstCategoryID) {
        // 一番左端にスクロールしたときは組み替えをしない
        // Set current categoryID
        [ATCategoryInfo sharedObject].currentCategoryID = page0ListViewController.categoryID;

        // Change categoryID other listView
        NSUInteger currentCategoryOrderIndex = [[ATCategoryInfo sharedObject] categoryOrderIndexWithCategoryID:page0ListViewController.categoryID];
        [self listViewControllerWithPage:ATPagingPageMiddle].categoryID = [[ATCategoryInfo sharedObject] categoryIDWithIndex:(currentCategoryOrderIndex + 1)];
        [self listViewControllerWithPage:ATPagingPageLast].categoryID = [[ATCategoryInfo sharedObject] categoryIDWithIndex:(currentCategoryOrderIndex + 2)];
    } else {
        // [表示] 1 2  -> 2 [表示] 1 に組み替える
        // Set current categoryID
        [ATCategoryInfo sharedObject].currentCategoryID = page0ListViewController.categoryID;

        ATTopicListViewController *page1ListViewController = [self listViewControllerWithPage:ATPagingPageMiddle];
        ATTopicListViewController *page2ListViewController = [self listViewControllerWithPage:ATPagingPageLast];

        // Change categoryID
        page2ListViewController.categoryID = [[ATCategoryInfo sharedObject] categoryIDWithIndex:(categoryOrderIndex - 1)];
        page1ListViewController.categoryID = [[ATCategoryInfo sharedObject] categoryIDWithIndex:(categoryOrderIndex + 1)];

        // Get rect
        CGRect listViewRect = page0ListViewController.view.frame;
        listViewRect.origin = CGPointZero;

        // Move
        page2ListViewController.view.frame = listViewRect;
        listViewRect.origin.x += listViewRect.size.width;
        page0ListViewController.view.frame = listViewRect;
        listViewRect.origin.x += listViewRect.size.width;
        page1ListViewController.view.frame = listViewRect;

        // Move page 1 to center
        [self scrollWithPage:ATPagingPageMiddle animated:NO];

        // Set page
        page2ListViewController.pageNum = ATPagingPageFirst;
        page0ListViewController.pageNum = ATPagingPageMiddle;
        page1ListViewController.pageNum = ATPagingPageLast;
    }
}

- (void)scrolledToRight {
    // Get last page view controller
    ATTopicListViewController *page2ListViewController = [self listViewControllerWithPage:ATPagingPageLast];
    NSUInteger categoryOrderIndex = [[ATCategoryInfo sharedObject] categoryOrderIndexWithCategoryID:page2ListViewController.categoryID];

    if (page2ListViewController.categoryID == [ATCategoryInfo sharedObject].lastCategoryID) {
        // Set current categoryID
        [ATCategoryInfo sharedObject].currentCategoryID = page2ListViewController.categoryID;

        // Change categoryID other listView
        NSUInteger currentCategoryOrderIndex = [[ATCategoryInfo sharedObject] categoryOrderIndexWithCategoryID:page2ListViewController.categoryID];
        [self listViewControllerWithPage:ATPagingPageMiddle].categoryID = [[ATCategoryInfo sharedObject] categoryIDWithIndex:(currentCategoryOrderIndex - 1)];
        [self listViewControllerWithPage:ATPagingPageFirst].categoryID = [[ATCategoryInfo sharedObject] categoryIDWithIndex:(currentCategoryOrderIndex - 2)];
    } else {
        // Set current categoryID
        [ATCategoryInfo sharedObject].currentCategoryID = page2ListViewController.categoryID;

        ATTopicListViewController *page0ListViewController = [self listViewControllerWithPage:ATPagingPageFirst];
        ATTopicListViewController *page1ListViewController = [self listViewControllerWithPage:ATPagingPageMiddle];

        // Change categoryID
        page1ListViewController.categoryID = [[ATCategoryInfo sharedObject] categoryIDWithIndex:(categoryOrderIndex - 1)];
        page0ListViewController.categoryID = [[ATCategoryInfo sharedObject] categoryIDWithIndex:(categoryOrderIndex + 1)];
        // Get rect

        CGRect listViewRect = page2ListViewController.view.frame;
        listViewRect.origin = CGPointZero;

        // Move
        page1ListViewController.view.frame = listViewRect;
        listViewRect.origin.x += listViewRect.size.width;
        page2ListViewController.view.frame = listViewRect;
        listViewRect.origin.x += listViewRect.size.width;
        page0ListViewController.view.frame = listViewRect;

        // Move page 1 to center
        [self scrollWithPage:ATPagingPageMiddle animated:NO];

        // Set page
        page1ListViewController.pageNum = ATPagingPageFirst;
        page2ListViewController.pageNum = ATPagingPageMiddle;
        page0ListViewController.pageNum = ATPagingPageLast;
    }
}

#pragma mark - UISCrollViewDelegate

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    self.isGesturePageSwipeScrolling = NO;
    self.scrollView.pagingEnabled = YES; // Paging on again for gesture swipe
    [self scrollViewDidEndDecelerating:scrollView];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    // Get manager
    ATCategoryInfo *categoryManager = [ATCategoryInfo sharedObject];

    // Get Current displaying page
    NSUInteger displayingPage = [self displayingPage];

    ATTopicListViewController *currentListViewController = [self listViewControllerWithPage:displayingPage];
    if (currentListViewController.categoryID == categoryManager.currentCategoryID) {
        return;
    }

    if (displayingPage == ATPagingPageFirst) {
        // < First page >
        [self scrolledToLeft];
    } else if (displayingPage == ATPagingPageLast) {
        // < Last page >
        [self scrolledToRight];
    } else {
        // < Middle page >
        // Set current categoryID
        categoryManager.currentCategoryID = currentListViewController.categoryID;

        // Get current category order index
        NSUInteger currentCategoryOrderIndex =
            [categoryManager categoryOrderIndexWithCategoryID:currentListViewController.categoryID];

        // Set new categoryID to other page
        [self listViewControllerWithPage:ATPagingPageFirst].categoryID =
            [categoryManager categoryIDWithIndex:(currentCategoryOrderIndex - 1)];

        [self listViewControllerWithPage:ATPagingPageLast].categoryID =
            [categoryManager categoryIDWithIndex:(currentCategoryOrderIndex + 1)];
    }

    // Change current page (set scrollsToTop property to any tableview)
    [self currentPageChanged];

    if ([self.delegate respondsToSelector:@selector(changeCurrentCategoryByPagingScrollView:)]) {
        // Change select category tab
        [self.delegate changeCurrentCategoryByPagingScrollView:self];
    }
    if ([self.delegate respondsToSelector:@selector(didScrollUp:)]) {
        // Change menu button alpha
        [self.delegate didScrollUp:self];
    }
    return;
}

#pragma mark - ATTopicListViewControllerDelegate

- (void)didScrollUp:(ATTopicListViewController *)viewController {
    // Is currenct list view controller
    if ([viewController isEqual:[self currentListViewController]] == NO) {
        return;
    }

    if ([self.delegate respondsToSelector:@selector(didScrollUp:)]) {
        [self.delegate didScrollUp:self];
    }
}

- (void)didScrollDown:(ATTopicListViewController *)viewController {
    // Is currenct list view controller
    if ([viewController isEqual:[self currentListViewController]] == NO) {
        return;
    }

    if ([self.delegate respondsToSelector:@selector(didScrollDown:)]) {
        [self.delegate didScrollDown:self];
    }
}

#pragma mark - UIGestureRecognizerDelegate

/*
 * ジェスチャーを自前で処理するかどうかの判定を行う
 * @return NO:自前で処理しない（元々のViewにイベントが送れられる、この場合UIScrollView)
           YES:自前で処理する  delegateで設定されたクラスで処理される
 */
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    // 一番左端のページが表示されている場合にのみ自前のGestureを処理する
    if ([self currentPage] == ATPagingPageFirst) {
        // Open menu drawer
        return YES;
    }
    
    // 自前のGestureを処理しない、つまりUIScrollViewにGestureを処理してもらう
    return NO;
}
#endif
@end
