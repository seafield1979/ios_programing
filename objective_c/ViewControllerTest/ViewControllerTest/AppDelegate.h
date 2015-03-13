//
//  AppDelegate.h
//  ViewControllerTest
//

#import <UIKit/UIKit.h>
#import "TableViewController.h"
#import "TableViewController2.h"
#import "TableViewController3.h"
#import "UNViewController1.h"
#import "UNViewController21.h"
#import "UNViewController22.h"


@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) UNViewController1 *viewController1;
@property (strong, nonatomic) UINavigationController *navigationController;
@property (strong, nonatomic) TableViewController *tableViewController;
@property (strong, nonatomic) TableViewController2 *tableViewController2;
@property (strong, nonatomic) TableViewController3 *tableViewController3;
@property (strong, nonatomic) UNViewController22 *viewController22;

@end
