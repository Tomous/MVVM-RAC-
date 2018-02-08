//
//  DCViewController.m
//  RAC-MVVM
//
//  Created by wenhua on 2017/12/27.
//  Copyright © 2017年 wenhua. All rights reserved.
//

#import "DCViewController.h"
#import "DCLoginView.h"
#import "DCLoginViewModel.h"

@interface DCViewController ()

@property(nonatomic,strong)DCLoginView * loginView;
@property(nonatomic,strong)DCLoginViewModel * loginViewModel;
@end

@implementation DCViewController
-(void)loadView
{
    DCLoginView *loginView = [[DCLoginView alloc]init];
    self.loginView = loginView;
    self.view = loginView;
}

-(DCLoginViewModel *)loginViewModel
{
    if (!_loginViewModel) {
        _loginViewModel = [[DCLoginViewModel alloc]init];
    }
    return _loginViewModel;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:NO];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.loginViewModel.loginView = self.loginView;
    
    [self addLoginViewAction];
    
}
-(void)addLoginViewAction{
    
#pragma mark - 登陆
    [[self.loginView.signInButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        
        [self.loginViewModel.loginCommond execute:nil];
        NSLog(@"signInButtonDidClick");
    }];
    
#pragma mark - 注册
    [[self.loginView.signUpButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        
        NSLog(@"signUpButtonDidClick");
    }];
    
#pragma mark - 忘记密码
    [[self.loginView.forgetPasswordButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        
        NSLog(@"forgetPasswordButtonDidClick");
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
