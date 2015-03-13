//
//  UNViewController1.m
//  ViewControllerTest
//

#import "UNViewController1.h"
#import "QuartzCore/QuartzCore.h"

static NSInteger page;

@interface UNViewController1 ()


@end

@implementation UNViewController1

- (void)viewDidLoad {
    [super viewDidLoad];
    page++;
    
    self.label1.text = [NSString stringWithFormat:@"page %ld", page];
}

- (void)dealloc
{
    NSLog(@"dealloc");
}

/*
 * ページをプッシュ
 */
- (IBAction)button1DidTap:(id)sender {
    
    // 新しいページに遷移
    self.pushVC = [[UNViewController1 alloc] initWithNibName:@"UNViewController1" bundle:nil];
    self.pushVC.prevVC = self;
    
    CATransition *transition = [CATransition animation];
    transition.duration = 0.5; // 時間
    
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    // アニメーションのタイプ指定
    transition.type = kCATransitionPush ;
    transition.subtype = kCATransitionFromRight;
    
     // keyはなんでもいい
    NSString *key = [NSString stringWithFormat:@"TransitionText%ld", page];
    [[self.view layer] addAnimation:transition forKey:key];
    
    [self.view addSubview:self.pushVC.view] ;
}



@end
