//
//  UNViewController1.h
//  ViewControllerTest
//
//  Created by B02681 on 2015/02/16.
//  Copyright (c) 2015年 海野 秀祐. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UNViewController1 : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *label1;

// pushして表示するViewController
@property (nonatomic, strong) UNViewController1 *pushVC;

// １つ前（親）のViewController
@property (nonatomic, strong) UNViewController1 *prevVC;

@end
