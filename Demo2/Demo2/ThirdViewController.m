//
//  ThirdViewController.m
//  Demo2
//
//  Created by vfa on 8/15/22.
//

#import "ThirdViewController.h"

@interface ThirdViewController ()
@property (nonatomic,strong) UIButton *backBtn;
@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Third View";
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.backBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.backBtn setTitle:@"Back" forState:UIControlStateNormal];
    [self.backBtn sizeToFit];
    [self.backBtn addTarget:self action:@selector(goBack) forControlEvents:UIControlEventTouchUpInside];
    self.backBtn.center = self.view.center;
    [self.view addSubview:self.backBtn];
    
    //set image on navigation bar
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    
    UIImage *image = [UIImage imageNamed:@"navigationImage"];
    [imageView setImage:image];
    self.navigationItem.titleView = imageView;
    
    //set up right bar button
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(performDone)];
    // Do any additional setup after loading the view.
}
-(void) goBack{
    NSArray *currentControllers = self.navigationController.viewControllers;
    
    NSMutableArray *newControllers = [NSMutableArray arrayWithArray:currentControllers];
    [newControllers removeLastObject];
    
    [self.navigationController setViewControllers:newControllers];
}
-(void) performDone{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Message" message:@"Congratulations!" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *actionOK = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            }];
            [alert addAction:actionOK];
    [self presentViewController:alert animated:YES completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
