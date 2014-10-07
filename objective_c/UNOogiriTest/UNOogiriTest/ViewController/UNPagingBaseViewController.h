//
//  UNPagingBaseViewController.h
//

typedef NS_ENUM (NSUInteger, UNPagingPage) {
    UNPagingPageFirst      = 0,
    UNPagingPageMiddle,
    UNPagingPageLast,
    UNPagingMaxCount
};

@interface UNPagingBaseViewController : UIViewController <UIScrollViewDelegate>

@property (nonatomic, weak) IBOutlet UIScrollView *scrollView;

- (void)initScrollView;
- (void)scrollWithPage:(NSUInteger)page animated:(BOOL)animated;
- (NSUInteger)displayingPage;

@end
