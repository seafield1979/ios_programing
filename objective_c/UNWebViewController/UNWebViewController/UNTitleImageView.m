//
//  UNTitleImageView.m
//  UNWebViewController
//
//  Created by B02681 on 2015/02/13.
//  Copyright (c) 2015年 B02681. All rights reserved.
//
/*
 チュートリアルのタイトル用ImageView
 ページを切り替える毎に新しいページがアニメーション表示される
 */

#import "UNTitleImageView.h"

@interface UNTitleImageView()

@property (nonatomic) NSInteger page;
@property (nonatomic) CGRect baseFrame;     // スケール前のフレーム

@end

@implementation UNTitleImageView

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        _baseFrame = self.frame;
    }
    return self;
}

- (void)setPage:(NSInteger)page
{
    if (_page != page) {
        _page = page;
        self.image = [UIImage imageNamed:[NSString stringWithFormat:@"text%ld", (page+1)]];
    }
}


/*
 * 拡大率を設定する
 */
- (void)setScale:(CGFloat)scale
{
    CGPoint center = CGPointMake(self.baseFrame.origin.x + self.baseFrame.size.width / 2,
                                 self.baseFrame.origin.y + self.baseFrame.size.height /2);
    
    self.frame = CGRectMake(center.x - scale * self.baseFrame.size.width / 2,
                            center.y - scale * self.baseFrame.size.height / 2,
                            scale * self.baseFrame.size.width,
                            scale * self.baseFrame.size.height);
}

@end
