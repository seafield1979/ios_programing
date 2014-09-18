//
//  ViewControllerWeb.h
//  ScrollViewTest
//
//  Created by B02681 on 2014/08/20.
//  Copyright (c) 2014年 海野 秀祐. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewControllerWeb : UIViewController <UIScrollViewDelegate>
{
	int pageMax;
	int pageNum;
	UIScrollView *_scrollView;
}

@property (strong, nonatomic) IBOutlet UIView *view1;


@end
