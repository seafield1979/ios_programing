//
//  ViewController.h
//  
//
//  Created by 海野 秀祐 on 2014/08/04.
//
//

#import <UIKit/UIKit.h>

@interface MyTouchView : UIView
@end

@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIButton *button1;
@property (strong, nonatomic) IBOutlet UIView *baseView1;
@property (strong, nonatomic) IBOutlet UIView *baseView2;

@property (strong, nonatomic) UIView *view1;
@property (strong, nonatomic) UIView *view2;
@property (strong, nonatomic) UIView *imgView1;
@property (strong, nonatomic) UIView *imgView2;
@property (strong, nonatomic) UIView *priView1;
@property (strong, nonatomic) UIView *priView2;
@property (weak, nonatomic) IBOutlet UILabel *label1;

@property (strong, nonatomic) UIView *tapView;
@property (strong, nonatomic) MyTouchView *myTouchView;


- (IBAction)pushButton1:(id)sender;
- (IBAction)pushButton2:(id)sender;
- (IBAction)pushButton3:(id)sender;
- (IBAction)pushChangeViewButton:(id)sender;
- (IBAction)pushShowView2Button:(id)sender;

@end
