//
//  UNPagingBaseViewController.m
//

#import "UNPagingBaseViewController.h"

@interface UNPagingBaseViewController ()

@end

@implementation UNPagingBaseViewController

#pragma mark - Override methods

- (void)dealloc {
    // Remove scroll view size change observer
    [self.scrollView removeObserver:self forKeyPath:@"frame"];
}

#pragma mark - Public method

/*
 * スクロールViewを初期化する
 */
- (void)initScrollView
{
    // Scroll view configuration
    self.scrollView.scrollsToTop = NO;
    CGRect scrollViewRect = self.scrollView.frame;
    [self setupContentSize:scrollViewRect];
    self.scrollView.pagingEnabled = YES;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.scrollsToTop = NO;
    self.scrollView.delegate = self;

    // Scroll view size change observation for paging content size
    [self.scrollView addObserver:self forKeyPath:@"frame" options:NSKeyValueObservingOptionNew context:NULL];
}

/*
 * ページを切り替える
 * @param page  切り替え先のページ
 * @param animated NO:アニメーションしない / YES:アニメーションする
 */
- (void)scrollWithPage:(NSUInteger)page animated:(BOOL)animated
{
    CGFloat scrollOffSet = page * self.scrollView.frame.size.width;
    [self.scrollView setContentOffset:CGPointMake(scrollOffSet, 0) animated:animated];
}

/*
 * 表示中のページ番号を取得する
 * @return 表示中のページ番号
 */
- (NSUInteger)displayingPage
{
    CGFloat pageWidth = self.scrollView.frame.size.width;
    NSUInteger displayingPage = floor((self.scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;

    return displayingPage;
}

/*
 * スクロールViewのコンテンツ領域(スクロールできる範囲の領域のこと）を設定する
 */
- (void)setupContentSize:(CGRect)scrollViewRect
{
    self.scrollView.contentSize = CGSizeMake(scrollViewRect.size.width * UNPagingMaxCount, scrollViewRect.size.height);
}

#pragma mark - KVO

- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context {
    if ([keyPath isEqualToString:@"frame"]) {
        if ([object valueForKeyPath:keyPath] != [NSNull null]) {
            // Get new rect
            CGRect newFrame = [[object valueForKeyPath:keyPath] CGRectValue];

            // change contnt size
            [self setupContentSize:newFrame];
        }
    }
}

@end
