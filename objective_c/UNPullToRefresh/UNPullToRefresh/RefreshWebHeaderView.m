//
//  RefreshWebHeaderView.m
//  Intely
//
//  Created by B02332 on 2012/10/03.
//  Copyright (c) 2012年 ネットビジネス総合事業本部. All rights reserved.
//

#import "RefreshWebHeaderView.h"

#define HEXCOLOR(code,alphaVal) [UIColor colorWithRed:((code>>16)&0xFF)/255.0 green:((code>>8)&0xFF)/255.0 blue:(code&0xFF)/255.0 alpha:alphaVal]

// バーが停止してからリフレッシュを開始する
//#define kRefreshStartAfterBarStopped

@interface RefreshWebHeaderView (Private)
- (void)setState:(PullRefreshState)aState;
@end

@implementation RefreshWebHeaderView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [[NSBundle mainBundle] loadNibNamed:@"RefreshWebHeaderView" owner:self options:nil];
        CGRect rect = _baseView.frame;
        rect.origin.y = self.frame.size.height - rect.size.height;
        _baseView.frame = rect;
        [self addSubview:_baseView];
        self.backgroundColor = [UIColor whiteColor];	//HEXCOLOR(0xf9efe5, 1.0);
		[self setState:PullRefreshNormal];
    }
    return self;
}


- (void)refreshLastUpdatedDate {
	
	if ([_delegate respondsToSelector:@selector(pullRefreshHeaderDataSourceLastUpdated:)]) {
		
		NSDate *date = [_delegate pullRefreshHeaderDataSourceLastUpdated:self];
		
		NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
		[formatter setAMSymbol:@"AM"];
		[formatter setPMSymbol:@"PM"];
		[formatter setDateFormat:@"MM/dd/yyyy hh:mm a"];
		lastUpdatedLabel.text = [NSString stringWithFormat:@"最終更新: %@", [formatter stringFromDate:date]];
		[[NSUserDefaults standardUserDefaults] setObject:lastUpdatedLabel.text forKey:@"RefreshTableView_LastRefresh"];
		[[NSUserDefaults standardUserDefaults] synchronize];
		
	} else {

		lastUpdatedLabel.text = nil;
		
	}	
}


- (void)setState:(PullRefreshState)aState
{
    CGContextRef context = UIGraphicsGetCurrentContext();
	switch (aState) {
		case PullRefreshNormal:
#if 1
			if (state == PullRefreshPulling) {
                [UIView beginAnimations:nil context:context];
                [UIView setAnimationDuration:0.3f];
                self.arrowImageView.transform = CGAffineTransformIdentity;
                [UIView commitAnimations];
			}
			
			if(!textImage1){
				textImage1 = [UIImage imageNamed:@"pullto_txt01"];
			}
			[self.textImageView setImage:textImage1];
			//self.statusLabel.text = NSLocalizedString(@"引き下げて...", @"Pull down to refresh status");
			[activityView stopAnimating];
			self.textImageView.hidden = NO;
            self.indicatorView.hidden = YES;
			self.arrowImageView.hidden = NO;
			self.arrowImageView.transform = CGAffineTransformIdentity;
#endif
			break;
            
		case PullRefreshPulling:	// 更新開始位置までpull
			if(!textImage2){
				textImage2 = [UIImage imageNamed:@"pullto_txt02"];
			}
			[self.textImageView setImage:textImage2];
	        
            [UIView beginAnimations:nil context:context];
            [UIView setAnimationDuration:0.3f];
            self.arrowImageView.transform = CGAffineTransformMakeRotation((M_PI / 180.0) * 180.0f);
            [UIView commitAnimations];
			break;
            
		case PullRefreshLoading:	// 更新開始時
			self.textImageView.hidden = YES;
			self.arrowImageView.hidden = YES;
            self.indicatorView.hidden = NO;
            CABasicAnimation* rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
            rotationAnimation.toValue = [NSNumber numberWithFloat:(M_PI / 180) * 360];
            rotationAnimation.speed = 0.7f;
            rotationAnimation.duration = 0.8f;
            rotationAnimation.repeatCount = HUGE_VALF;
            [_indicatorView startAnimating];
			break;
	}
	state = aState;
}


- (void)pullRefreshScrollViewDidScroll:(UIScrollView *)scrollView
{
	if (self.hidden) {
		return;
	}
	if (state == PullRefreshLoading) {
		
//		CGFloat offset = MAX(scrollView.contentOffset.y * -1, 0);
//		offset = MIN(offset, _baseView.frame.size.height);
//		scrollView.contentInset = UIEdgeInsetsMake(offset, 0.0f, 0.0f, 0.0f);
		
	} else if (scrollView.isDragging) {
		BOOL _loading = NO;
		if ([_delegate respondsToSelector:@selector(pullRefreshHeaderDataSourceIsLoading:)]) {
			_loading = [_delegate pullRefreshHeaderDataSourceIsLoading:self];
		}
		//NSLog(@"pull:%f", scrollView.contentOffset.y);
		if (state == PullRefreshPulling && scrollView.contentOffset.y > -53.0f && scrollView.contentOffset.y < 0.0f && !_loading) {
			[self setState:PullRefreshNormal];
		} else if (state == PullRefreshNormal && scrollView.contentOffset.y < -53.0f && !_loading) {
            [self setState:PullRefreshPulling];
		}
	}
}

- (void)pullRefreshScrollViewDidEndDragging:(UIScrollView *)scrollView
{
	if (self.hidden) {
		return;
	}
	BOOL _loading = NO;
	if ([_delegate respondsToSelector:@selector(pullRefreshHeaderDataSourceIsLoading:)]) {
		_loading = [_delegate pullRefreshHeaderDataSourceIsLoading:self];
	}
	
	if (scrollView.contentOffset.y <= - 53.0f && !_loading) {
		[self setState:PullRefreshLoading];
        
#ifndef kRefreshStartAfterBarStopped
        // 引っ張ってはなしてすぐに読み込みなどの処理を行う
        if ([_delegate respondsToSelector:@selector(pullRefreshHeaderDidTriggerRefresh:)]) {
            [_delegate pullRefreshHeaderDidTriggerRefresh:self];
        }
#endif
        [UIView animateWithDuration:0.2
                         animations:^{
                             scrollView.contentInset = UIEdgeInsetsMake(_baseView.frame.size.height, 0.0f, 0.0f, 0.0f);
                         }
                         completion:^(BOOL finished){
#ifdef kRefreshStartAfterBarStopped
                             // カクつくのを防ぐためリフレッシュビューが止まってから読み込みなどの処理を行う
                             if ([_delegate respondsToSelector:@selector(pullRefreshHeaderDidTriggerRefresh:)]) {
                                 double delayInSeconds = 0.2;
                                 dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
                                 dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
                                     [_delegate pullRefreshHeaderDidTriggerRefresh:self];
                                 });
                             }
#endif
                         }];
	}
}

/**
 * プルリフレッシュのページロード完了後のイベント
 */
- (void)pullRefreshScrollViewDataSourceDidFinishedLoading:(UIScrollView *)scrollView
{
    [UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:.3];
	[scrollView setContentInset:UIEdgeInsetsMake(0.0f, 0.0f, 0.0f, 0.0f)];
	[UIView commitAnimations];
    
    scrollView.contentOffset = CGPointMake(0.0, 0.0);
//    scrollView.frame = CGRectMake(<#CGFloat x#>, <#CGFloat y#>, <#CGFloat width#>, <#CGFloat height#>)
	
	[self setState:PullRefreshNormal];
}



@end
