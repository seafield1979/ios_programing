//
//  ViewController3.m
//  ScrollViewTest
//
//  Created by B02681 on 2014/08/07.
//  Copyright (c) 2014年 海野 秀祐. All rights reserved.
//

#import "ViewController3.h"

@interface ViewController3 ()
{
	int pageMax;
	int pageNum;
	UIScrollView *_scrollView;
}

@end

@implementation ViewController3

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
		pageNum = 1;
		pageMax = 4;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // ページコントロールをタップされたときに呼ばれるメソッドを設定
    _pageControl.userInteractionEnabled = YES;
    [_pageControl addTarget:self
                    action:@selector(pageControl_Tapped:)
          forControlEvents:UIControlEventValueChanged];
    // 色を変更
    _pageControl.currentPageIndicatorTintColor = [UIColor greenColor];
    _pageControl.pageIndicatorTintColor = [UIColor grayColor];
    // 現在のページ
    _pageControl.currentPage = pageNum;

    // Do any additional setup after loading the view from its nib.
	[self initScrollView];
	
	_label1.text = @"scroll ON";
	
	
	

}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
	
}

/**
 * スクロールビューを初期化
 * 4ページ分のコンテンツをスクロールする
 */
-(void)initScrollView
{
	// Custom initialization
	CGRect scrollViewRect = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 200);
	_scrollView = [[UIScrollView alloc]initWithFrame:scrollViewRect];
	_scrollView.pagingEnabled = YES;
	[self.view addSubview:_scrollView];
	
	// UIScrollViewに表示するコンテンツViewを作成する。
	CGSize s = _scrollView.frame.size;
	CGRect contentRect = CGRectMake(0, 0, s.width * pageMax, s.height);
	UIView *contentView = [[UIView alloc] initWithFrame:contentRect];
	// コンテンツViewに表示する緑色Viewを追加する。
	UIView *subContent1View = [[UIView alloc] initWithFrame:CGRectMake(320 * 0, 0, s.width, s.height)];
	subContent1View.backgroundColor = [UIColor greenColor];
	[contentView addSubview:subContent1View];
	// コンテンツViewに表示する青色Viewを追加する。
	UIView *subContent2View = [[UIView alloc] initWithFrame:CGRectMake(320 * 1, 0, s.width, s.height)];
	subContent2View.backgroundColor = [UIColor blueColor];
	[contentView addSubview:subContent2View];
	// コンテンツViewに表示する赤色Viewを追加する。
	UIView *subContent3View = [[UIView alloc] initWithFrame:CGRectMake(320 * 3, 0, s.width, s.height)];
	subContent3View.backgroundColor = [UIColor redColor];
	[contentView addSubview:subContent3View];
	// コンテンツViewに表示する黄色Viewを追加する。
	UIView *subContent4View = [[UIView alloc] initWithFrame:CGRectMake(320 * 4, 0, s.width, s.height)];
	subContent4View.backgroundColor = [UIColor yellowColor];
	[contentView addSubview:subContent4View];
	// スクロールViewにコンテンツViewを追加する。
	[_scrollView addSubview:contentView];
	
	// スクロールView上のコンテンツViewのサイズを指定します。
#if 1
	_scrollView.contentSize = contentView.frame.size;
#else
	_scrollView.contentSize = CGSizeMake(4000, 1000);
#endif
	
	_scrollView.delegate = self;
	
	// 初期表示するコンテンツViewの場所を指定します。
	// 今回は２ページ目から表示します。
	_scrollView.contentOffset = CGPointMake(320, 0);
	
	
}


#pragma mark _UIScrollViewDelegate

// スクロール時の処理
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
	int offset_x = (int)scrollView.contentOffset.x;
	pageNum = (int)(offset_x / 320);
    
    // ページコントロールの現在のページの切り替え
    float scroll_x =  scrollView.contentOffset.x;
    int page = _scrollView.contentOffset.x / _scrollView.frame.size.width;
    NSLog(@"scrollViewDidEndDecelerating %f %d",scroll_x, page );
    _pageControl.currentPage = page;
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    NSLog(@"scrollViewWillBeginDragging");
}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset NS_AVAILABLE_IOS(5_0)
{
    NSLog(@"scrollViewWillEndDragging");
}
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    NSLog(@"scrollViewDidEndDragging");
}
- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView
{
    NSLog(@"scrollViewWillBeginDecelerating");
}

// ページの切り替え完了時のイベント
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
   
}

#pragma mark _PageControlEvent

// ページコントロールのページをタップ
-(void)pageControl_Tapped:(id)sender
{
    UIPageControl *pc = (UIPageControl*)sender;
    NSLog(@"page control tapped: %d", pc.currentPage);
    
    CGRect frame = _scrollView.frame;
    frame.origin.x = frame.size.width * _pageControl.currentPage;
    [_scrollView scrollRectToVisible:frame animated:YES];
}

#pragma mark _UISwitch
- (IBAction)switch1Changed:(id)sender {
	UISwitch *sw = (UISwitch*)sender;
	if(sw.on){
		NSLog(@"switch ON");
		_label1.text = @"scroll ON";
		[_scrollView setScrollEnabled:YES];
	}
	else{
		NSLog(@"switch OFF");
		_label1.text = @"scroll OFF";
		[_scrollView setScrollEnabled:NO];
	}
}
@end
