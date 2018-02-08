//
//  DCLoginView.h
//  RAC-MVVM
//
//  Created by wenhua on 2017/12/27.
//  Copyright © 2017年 wenhua. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DCLoginView : UIView

@property(nonatomic,strong)UIImageView * imgView;//loginView

@property (strong, nonatomic)UITextField *usernameTextField;
@property (strong, nonatomic)UITextField *passwordTxtField;

@property (strong, nonatomic)UIButton *signInButton;//登陆按钮
@property (strong, nonatomic)UIButton *signUpButton;//注册按钮
@property (nonatomic, strong)UIView * lineView;
@property (strong, nonatomic)UIButton *forgetPasswordButton;//忘记密码

@property (nonatomic, strong)UIImageView * loginPicture;//底部图案

@property(nonatomic,assign)BOOL isValidate;
@end
