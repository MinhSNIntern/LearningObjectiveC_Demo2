//
//  ViewController.m
//  Demo2
//
//  Created by vfa on 8/12/22.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic,strong) UITextField *textField;
@property (nonatomic,strong) UIButton *shareBtn;
@property (nonatomic,strong) UIActivityViewController *activityViewController;

@end

@implementation ViewController
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
    self.view.backgroundColor = [UIColor whiteColor];
    [self createTextField];
    CGRect newFrame = self.textField.frame;
    NSLog(@"%@",NSStringFromCGRect(newFrame));
    [self createButton];
    
    UILabel *yourLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 10, 300, 70)];
            [yourLabel setTextColor:[UIColor brownColor]];
            [yourLabel setBackgroundColor:[UIColor clearColor]];
            [yourLabel setFont:[UIFont fontWithName: @"Trebuchet MS" size: 14.0f]];
            [yourLabel setText:@"UIViewController Demo"];
            [self.view addSubview:yourLabel];
    // Do any additional setup after loading the view.
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
