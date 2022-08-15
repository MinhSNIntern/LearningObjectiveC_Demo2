//
//  SecondViewController.m
//  Demo2
//
//  Created by vfa on 8/15/22.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Second View";
    self.view.backgroundColor =[UIColor whiteColor];
    
    // Do any additional setup after loading the view.
}
-(void) goBack{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void) viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self performSelector:@selector(goBack)
                                    withObject:nil
    afterDelay:10.0f];
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
