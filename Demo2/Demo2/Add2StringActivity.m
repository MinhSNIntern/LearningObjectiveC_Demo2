//
//  Add2StringActivity.m
//  Demo2
//
//  Created by vfa on 8/15/22.
//

#import "Add2StringActivity.h"

@interface Add2StringActivity ()
@property (nonatomic,strong) NSArray *activityItems;

@end

@implementation Add2StringActivity
- (NSString *) activityType{
    return [[NSBundle mainBundle].bundleIdentifier stringByAppendingFormat:@".%@", NSStringFromClass([self class])];
}
-(NSString *) activityTitle{
    return @"Add two string";
    
}
- (UIImage *)activityImage{
    return [UIImage imageNamed:@"AddImage"];
}
- (BOOL)canPerformWithActivityItems:(NSArray *)activityItems{
    for (id object in activityItems) {
        if([object isKindOfClass:[NSString class]]){
            return YES;
        }
    }
    return  NO;
}
- (void)prepareWithActivityItems:(NSArray *)activityItems{
    NSMutableArray *stringObjects = [[NSMutableArray alloc] init];
    for (id object in activityItems) {
        if([object isKindOfClass:[NSString class]]){
            [stringObjects addObject: object];
        }
    }
    self.activityItems = [stringObjects copy];
}
- (NSString *) add2String:(NSString *)firstString secondString:(NSString *) secondString{
    return [firstString stringByAppendingString:secondString];
}
- (UIViewController *)rootViewController {
    UIViewController *rootViewController = [UIApplication sharedApplication].delegate.window.rootViewController;
    if([rootViewController isKindOfClass:[UINavigationController class]])
        rootViewController = ((UINavigationController *)rootViewController).viewControllers.firstObject;
    if([rootViewController isKindOfClass:[UITabBarController class]])
        rootViewController = ((UITabBarController *)rootViewController).selectedViewController;
    if (rootViewController.presentedViewController != nil)
        rootViewController = rootViewController.presentedViewController;
    return rootViewController;
}
- (void)performActivity{
    NSString *resultString = [self add2String: self.activityItems[0] secondString:self.activityItems[1]];
//    UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"Add two String" message:resultString preferredStyle:UIAlertControllerStyleAlert];
//        UIAlertAction *actionOK = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//        }];
//        [alert addAction:actionOK];
//
    NSLog(@"%@", resultString);
}
@end
