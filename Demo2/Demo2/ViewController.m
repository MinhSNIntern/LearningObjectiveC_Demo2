//
//  ViewController.m
//  Demo2
//
//  Created by vfa on 8/12/22.
//

#import "ViewController.h"
#import "Add2StringActivity.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"

@interface ViewController ()
@property (nonatomic,strong) UITextField *textField;
@property (nonatomic,strong) UIButton *shareBtn;
@property (nonatomic,strong) UIActivityViewController *activityViewController;
@property (nonatomic,strong) UIButton *displaySecondViewBtn;
@property (nonatomic,strong) UIButton *displayThirdViewBtn;

@end

@implementation ViewController
- (void) performDisplaySecondViewController:(id) paramSender{
    SecondViewController *secondViewController = [[SecondViewController alloc] initWithNibName:nil bundle:NULL];
    [self.navigationController pushViewController:secondViewController animated:YES];
}
- (void) performDisplayThirdViewController:(id) paramSender{
    ThirdViewController *thirdViewController = [[ThirdViewController alloc] initWithNibName:nil bundle:NULL];
    [self.navigationController pushViewController:thirdViewController animated:YES];
}
- (void) createTextField{
    self.textField = [[UITextField alloc]initWithFrame:CGRectMake(20, 60, 300, 30)];
   // self.textField.translatesAutoresizingMaskIntoConstraints = NO;
    self.textField.borderStyle = UITextBorderStyleRoundedRect;
    self.textField.placeholder = @"Enter text to share";
    self.textField.delegate = self;
    [self.view addSubview: self.textField];
}
- (void) createButton{
    self.shareBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    //self.shareBtn.translatesAutoresizingMaskIntoConstraints = NO;
    self.shareBtn.frame = CGRectMake(340,55,40, 44);
    [self.shareBtn setTitle:@"Share" forState:UIControlStateNormal];
    [self.shareBtn addTarget:self action:@selector(handlerShare:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.shareBtn];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"First View";
    // set up display second view button
    self.displaySecondViewBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.displaySecondViewBtn setTitle:@"Second View" forState:UIControlStateNormal];
    [self.displaySecondViewBtn sizeToFit];
    self.displaySecondViewBtn.center = self.view.center;
    [self.displaySecondViewBtn addTarget:self action:@selector(performDisplaySecondViewController:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.displaySecondViewBtn];
    //set up display third view button
    self.displayThirdViewBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.displayThirdViewBtn setTitle:@"Third View" forState:UIControlStateNormal];
    [self.displayThirdViewBtn sizeToFit];
    self.displayThirdViewBtn.center = CGPointMake(self.view.frame.size.width/2, 400);
    [self.displayThirdViewBtn addTarget:self action:@selector(performDisplayThirdViewController:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.displayThirdViewBtn];
    self.view.backgroundColor = [UIColor whiteColor];
    //set up text field
    [self createTextField];
    //set up share button
    [self createButton];
    // Do any additional setup after loading the view.
    
    NSArray *item = @[@"string1",
                      @"String2"];
    UIActivityViewController *activity = [[UIActivityViewController alloc] initWithActivityItems:item applicationActivities:@[[Add2StringActivity new]]];
    [self presentViewController:activity animated:YES completion:nil];
}
- (void) didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
    
}

- (BOOL) textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}
- (void) handlerShare:(id)paramSender{
    if([self.textField.text length]==0){
        NSString * message = @"Please enter a text and then press Share";
        UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"Warning" message:message preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *actionOK = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {}];
            [alert addAction:actionOK];
            [self presentViewController: alert animated: YES completion:nil];
        return;
    }
    self.activityViewController = [[UIActivityViewController alloc] initWithActivityItems:@[self.textField.text] applicationActivities:nil];
    [self presentViewController: self.activityViewController animated: YES completion:nil];
    
}


@end
