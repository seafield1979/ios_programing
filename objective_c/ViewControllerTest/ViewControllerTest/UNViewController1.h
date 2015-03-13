//
//  UNViewController1.h
//  ViewControllerTest
//

#import <UIKit/UIKit.h>

@interface UNViewController1 : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *label1;

// pushして表示するViewController
@property (nonatomic, strong) UNViewController1 *pushVC;

// １つ前（親）のViewController
@property (nonatomic, strong) UNViewController1 *prevVC;

@end
