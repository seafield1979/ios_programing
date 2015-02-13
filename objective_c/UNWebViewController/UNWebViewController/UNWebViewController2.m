//
//  UNWebViewController2.m
//  UNWebViewController
//
//  Created by B02681 on 2015/02/12.
//  Copyright (c) 2015年 B02681. All rights reserved.
//

#import "UNWebViewController2.h"
#import "UNTutorialWebView.h"

static NSInteger kTutorialPageNum = 3;

@interface UNWebViewController2 ()

@property (nonatomic, strong) NSArray *webViews;
@property (nonatomic, strong) UNTitleImageView *imageView;

@property (nonatomic) NSInteger pageNum;
@property (nonatomic) NSInteger nextPageNum;
@property (nonatomic) CGFloat preScrollX;       // 1つ前のスクロール位置x

@end

@implementation UNWebViewController2

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _pageNum = 0;
        _preScrollX = 0.0;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.scrollView.delegate = self;
    
    // 背景のScrollView
    self.bgScrollView.contentSize = CGSizeMake(500, 308);
    
    
    // スクロールViewにWebviewを３つ配置する
    // スクロールViewの幅を３ページ分に拡張
    self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width * 3, self.scrollView.frame.size.height);
    
    // ページング
    self.scrollView.pagingEnabled = YES;

    NSMutableArray *tempWebViews = @[].mutableCopy;
    
    for (int i=0; i<3; i++) {
        UNTutorialWebView *webView = [[UNTutorialWebView alloc]initWithFrame:
        CGRectMake(i * self.view.frame.size.width, 0,
                   self.view.frame.size.width,
                   self.scrollView.frame.size.height)];
        [self.scrollView addSubview:webView];

        //Webページの大きさを自動的に画面にフィットさせる
        webView.scalesPageToFit = YES;
        // ページをロードする
        // ローカルのhtmlファイルをロード(最初のページだけ)
        if (i == 0) {
            [webView loadPage:0];
        }
        [tempWebViews addObject: webView];
    }
    self.webViews = tempWebViews;
    
}

/* ページのロードリクエスト
 * @ret YES:ページを読み込む / NO:ページを読み込まない
 */
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{

    return YES;
}


#pragma mark - UIScrollViewDelegate

/*
 * スクロール中の処理（スクロール中に呼ばれ続ける）
 */
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    // 背景をスクロールさせる
    if (self.scrollView == scrollView) {
        if (scrollView.contentOffset.x < self.scrollView.frame.size.width * 2) {
            self.bgScrollView.contentOffset =
             CGPointMake((scrollView.contentOffset.x / (self.scrollView.frame.size.width * 2)) * 180.0, 0.0);
        }
        
        CGFloat posX = self.scrollView.contentOffset.x;
        CGFloat width = self.scrollView.frame.size.width;
        
        // 表示されるページをロード、非表示になったページをクリア
        for (int i=0; i<kTutorialPageNum; i++) {
            UNTutorialWebView *webView = (UNTutorialWebView*)self.webViews[i];
            CGFloat webViewPosX = webView.frame.origin.x;
            CGFloat webViewPosW = webView.frame.size.width;
            
            // 表示領域にWebViewが入ったらロード
            if ((webViewPosX >= posX && webViewPosX <= (posX + width)) ||
                ((webViewPosX + webViewPosW) >= posX && (webViewPosX + webViewPosW) <= (posX + width)))
            {
                [webView loadPage:i];
            }
            
            // 表示領域から外れたら空にする
            if (!((webViewPosX >= (posX) && webViewPosX <= (posX + width)) ||
                ((webViewPosX + webViewPosW) >= (posX) && (webViewPosX + webViewPosW) <= (posX + width))))
            {
                [webView clearPage:i];
            }
        }
        
        // ローテクな感じでタイトルの拡大率を切り替える
        if (posX <= 0.0 || posX >= width * 2) {
            [self.titleImageView setScale: 1.0];
        } else if (posX < width / 2) {
            [self.titleImageView setScale: 1.0 - (posX / (width / 2))];
        } else if (posX < width) {
            [self.titleImageView setScale: (posX - (width / 2)) / (width / 2)];
        } else if (posX < width + width / 2) {
            [self.titleImageView setScale: 1.0 - ((posX - width) / (width / 2))];
        } else if (posX < width * 2) {
            [self.titleImageView setScale: (posX - (width + width / 2)) / (width / 2)];
        }
        
        // ページの切り替わりをチェック
#if 1
        NSInteger page = (posX + width / 2) / width;
        if (page < 0 || page > 2) {
            page = self.pageNum;
        }
        if (page != self.pageNum) {
            self.pageNum = page;
            // タイトルの差し替え
            [self.titleImageView setPage:page];
        }
        self.preScrollX = scrollView.contentOffset.x;
#endif
    }
}

/*
 * スクロールドラッグ開始
 */
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    //NSLog(@"scrollViewWillBeginDragging");
}

/*
 * ドラッグの減速開始
 */
- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView
{
    //NSLog(@"scrollViewWillBeginDecelerating");
}

/*
 * スクロールのドラッグ完了（のはじまり）
 */
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset NS_AVAILABLE_IOS(5_0)
{
    //NSLog(@"scrollViewWillEndDragging");
}

/*
 * スクロールのドラッグ完了（の終わり）
 */
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    //NSLog(@"scrollViewDidEndDragging");
}

/*
 * ページの切り替え完了時のイベント
 */
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    //NSLog(@"scrollViewDidEndDecelerating");
    
    self.pageControl.currentPage = scrollView.contentOffset.x / scrollView.frame.size.width;
}




#pragma mark - UIWebViewDelegate

#pragma mark - Private method
- (void)loadWebPage:(NSInteger)page
{
    }

#pragma mark - PageControl
/**
 * ページコントロールを初期化
 */
-(void)initPageControll
{
    // ページコントロールをタップされたときに呼ばれるメソッドを設定
    self.pageControl.userInteractionEnabled = YES;
    [self.pageControl addTarget:self
                     action:@selector(pageControlTapped:)
           forControlEvents:UIControlEventValueChanged];
    
    // 色を変更
    self.pageControl.currentPageIndicatorTintColor = [UIColor greenColor];
    self.pageControl.pageIndicatorTintColor = [UIColor grayColor];
    self.pageControl.backgroundColor = [UIColor blackColor];
    
    // 現在のページ
    self.pageControl.currentPage = 0;
}

-(void)pageControlTapped:(UIPageControl*)pageControl
{
    
}


#pragma mark - Action method

- (IBAction)button1DidTap:(id)sender {
}

@end
