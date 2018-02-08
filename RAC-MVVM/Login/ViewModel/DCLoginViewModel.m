//
//  DCLoginViewModel.m
//  RAC-MVVM
//
//  Created by wenhua on 2017/12/27.
//  Copyright © 2017年 wenhua. All rights reserved.
//

#import "DCLoginViewModel.h"

#import "DCHomeViewController.h"

@implementation DCLoginViewModel

#pragma mark - init
- (instancetype)init {
    if (self = [super init]) {
        [self setup];
    }
    return self;
}

-(void)setLoginView:(DCLoginView *)loginView
{
    _loginView = loginView;
    RAC(self, username) = loginView.usernameTextField.rac_textSignal;
    RAC(self, password) = loginView.passwordTxtField.rac_textSignal;
    RAC(loginView.signInButton, enabled) = self.loginButtonEnableSignal;//根据输入框文字判断登陆按钮是否可点击
    
}
- (void)setup{
    
    self.loginButtonEnableSignal = [RACSignal combineLatest:@[RACObserve(self, username),RACObserve(self, password)] reduce:^id(NSString *username, NSString *password){
        return @(username.length && password.length);
    }];
    
    self.loginCommond = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(id input) {
        
        return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
            
            self.username = [self.username stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
            
            if (![self.loginView isValidate]) {
                [subscriber sendCompleted];
                return nil;
            }
            
            DCHomeViewController *VC = [[DCHomeViewController alloc] init];
//            [self.currentController presentViewController:VC animated:YES completion:nil];
            [self.currentController.navigationController pushViewController:VC animated:YES];
            
            [subscriber sendCompleted];
            return nil;
        }];
    }];
    
    
//    [self.loginCommad.executionSignals.switchToLatest subscribeNext:^(NSDictionary *x){
//        if ([x.allKeys.lastObject isEqualToString:@"success"]) {
//            [SVProgressHUD showSuccessWithStatus:@"登录成功"];
//
//            NSLog(@"登录成功");
//        }else {
//            [SVProgressHUD showErrorWithStatus:@"登录失败"];
//            [SVProgressHUD dismissWithDelay:1];
//        }
//    }];
    
//    [[self.loginCommad.executing skip:1] subscribeNext:^(NSNumber * _Nullable x) {
//        if ([x boolValue]) {
//            [SVProgressHUD showWithStatus:@"正在登录中"];
//        }
//    }];
}
@end
