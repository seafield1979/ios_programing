//
//  RefreshWebHeaderView.h
//  Intely
//
//  Created by B02332 on 2012/10/03.
//  Copyright (c) 2012年 ネットビジネス総合事業本部. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

typedef enum{
	PullRefreshPulling = 0,		//引っぱりきった
	PullRefreshNormal,			//引っぱりきっていない
	PullRefreshLoading,			//ロード中
} PullRefreshState;

@protocol RefreshWebHeaderDelegate;

/**
 RefreshWebHeaderView ではプルトゥーリフレッシュの実装を助けます
 次期バージョンで利用されますが現在は休眠中 
 */
@interface RefreshWebHeaderView : UIView
{
	PullRefreshState state;
	
	UILabel * lastUpdatedLabel;
	CALayer * arrowImage;
	UIActivityIndicatorView * activityView;
	
	UIImage *textImage1;	// 下にドラッグして更新
	UIImage *textImage2;	// リリースして更新
}

/// @name プロパティー
@property (retain, nonatomic) IBOutlet UIView *baseView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *loadingIcon;
/// @name プロパティー
@property (retain, nonatomic) IBOutlet UILabel *statusLabel;
@property (retain, nonatomic) IBOutlet UIImageView *arrowImageView;
@property (retain, nonatomic) IBOutlet UIImageView *textImageView;
//@property (retain, nonatomic) IBOutlet UIImageView *loadingImageView;
@property (retain, nonatomic) IBOutlet UIActivityIndicatorView *indicatorView;


/// RefreshWebHeaderDelegate デリゲート
@property(nonatomic,unsafe_unretained) id <RefreshWebHeaderDelegate> delegate;

/// @name メソッド

/**
 プルトゥーリフレッシュを実行した際に、最終更新日時を設定するメソッド
 */
- (void)refreshLastUpdatedDate;

/**
 UIScrollViewのデリゲートを利用してスクロールビューのモードを制御する
 @param scrollView スクロールビュー
 */
- (void)pullRefreshScrollViewDidScroll:(UIScrollView *)scrollView;

/**
 スクロールが離されたときの位置を確認してリフレッシュを実行するかどうかの制御を行う
 @param scrollView スクロールビュー
 */
- (void)pullRefreshScrollViewDidEndDragging:(UIScrollView *)scrollView;

/**
 リフレッシュの実行後の制御を行う
 @param scrollView スクロールビュー
 */
- (void)pullRefreshScrollViewDataSourceDidFinishedLoading:(UIScrollView *)scrollView;

@end

@protocol RefreshWebHeaderDelegate <NSObject>
- (void)pullRefreshHeaderDidTriggerRefresh:(RefreshWebHeaderView*)view;
- (BOOL)pullRefreshHeaderDataSourceIsLoading:(RefreshWebHeaderView*)view;
@optional
- (NSDate*)pullRefreshHeaderDataSourceLastUpdated:(RefreshWebHeaderView*)view;
@end