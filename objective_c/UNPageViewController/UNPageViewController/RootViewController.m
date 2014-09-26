//
//  RootViewController.m
//  UNPageViewController
//
//  Created by 閑野 伊織 on 2014/09/18.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import "RootViewController.h"

#import "ModelController.h"

#import "DataViewController.h"

@interface RootViewController ()
@property (readonly, strong, nonatomic) ModelController *modelController;
@end

@implementation RootViewController

@synthesize modelController = _modelController;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    // Configure the page view controller and add it as a child view controller.
    //------------------------------
    // pgaeViewController生成
    //------------------------------
    self.pageViewController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll
        navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal
        options:nil];
    self.pageViewController.delegate = self;

    //------------------------------
    // 最初に表示するViewController
    //------------------------------
    DataViewController *startingViewController = [self.modelController viewControllerAtIndex:0 storyboard:self.storyboard];
    NSArray *viewControllers = @[startingViewController];
    [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];

    self.pageViewController.dataSource = self.modelController;

    [self addChildViewController:self.pageViewController];
    [self.view addSubview:self.pageViewController.view];

    // Set the page view controller's bounds using an inset rect so that self's view is visible around the edges of the pages.
    CGRect pageViewRect = self.view.bounds;
    self.pageViewController.view.frame = pageViewRect;

    [self.pageViewController didMoveToParentViewController:self];

    // Add the page view controller's gesture recognizers to the book view controller's view so that the gestures are started more easily.
    self.view.gestureRecognizers = self.pageViewController.gestureRecognizers;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (ModelController *)modelController
{
     // Return the model controller object, creating it if necessary.
     // In more complex implementations, the model controller may be passed to the view controller.
    if (!_modelController) {
        _modelController = [[ModelController alloc] init];
    }
    return _modelController;
}

#pragma mark - UIPageViewController delegate methods

/*
- (void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray *)previousViewControllers transitionCompleted:(BOOL)completed
{
    
}
 */

/*
 * 画面の向きに応じたページ開きの設定値を返す
 */
- (UIPageViewControllerSpineLocation)pageViewController:(UIPageViewController *)pageViewController
                   spineLocationForInterfaceOrientation:(UIInterfaceOrientation)orientation
{
    NSLog(@"pageViewController:spineLocationForInterfaceOrientation");
    // Set the spine position to "min" and the page view controller's view controllers array to contain just one view controller. Setting the spine position to 'UIPageViewControllerSpineLocationMid' in landscape orientation sets the doubleSided property to YES, so set it to NO here.
    UIViewController *currentViewController = self.pageViewController.viewControllers[0];
    NSArray *viewControllers = @[currentViewController];
    [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];

    self.pageViewController.doubleSided = NO;
    return UIPageViewControllerSpineLocationMin;
}

// Sent when a gesture-initiated transition begins.
// ページめくり開始
- (void)pageViewController:(UIPageViewController *)pageViewController willTransitionToViewControllers:(NSArray *)pendingViewControllers
{
    NSLog(@"pageViewController:willTransitionToViewControllers");
}


// ページめくりアニメーション終了
- (void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray *)previousViewControllers transitionCompleted:(BOOL)completed
{
    NSLog(@"pageViewController:didFinishAnimating %d %d", finished, completed);
}

//
- (NSUInteger)pageViewControllerSupportedInterfaceOrientations:(UIPageViewController *)pageViewController
{
    NSLog(@"pageViewControllerSupportedInterfaceOrientations");
    return 0;
}



//- (UIInterfaceOrientation)pageViewControllerPreferredInterfaceOrientationForPresentation:(UIPageViewController *)pageViewController
//{
//    
//}


@end
