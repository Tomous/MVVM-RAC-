//
//  DCView.m
//  RAC-MVVM
//
//  Created by wenhua on 2017/12/27.
//  Copyright © 2017年 wenhua. All rights reserved.
//

#import "DCLoginView.h"
#define COLORMAIN [UIColor colorWithRed:234/255.0 green:89/255.0 blue:71/255.0 alpha:1]
@implementation DCLoginView


-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(hideKeyboard)];
        [self addGestureRecognizer:tap];
        
        //logo
        _imgView = [[UIImageView alloc]init];
        UIImage *localImage = [UIImage imageNamed:@"ulogo"];
        
        //        LEAccount *account = [LEAccountService sharedService].account;
        //        [_imgView sd_setImageWithURL:[NSURL URLWithString:account.org[@"orgLogo"]] placeholderImage:localImage options:0 completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        //
        //        }];
        
        
        //用户名
        _usernameTextField = [[UITextField alloc]init];
        _usernameTextField.placeholder = @"用户名";
        _usernameTextField.textColor = [UIColor blackColor];
        _usernameTextField.font = [UIFont systemFontOfSize:15];
        _usernameTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
        
        //密码
        _passwordTxtField = [[UITextField alloc]init];
        _passwordTxtField.placeholder = @"密码";
        _passwordTxtField.textColor = [UIColor blackColor];
        _passwordTxtField.font = [UIFont systemFontOfSize:15];
        _passwordTxtField.secureTextEntry = YES;
        _passwordTxtField.clearButtonMode = UITextFieldViewModeWhileEditing;
        
        //登陆
        _signInButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _signInButton.layer.cornerRadius = 4;
        _signInButton.layer.masksToBounds = YES;
        [_signInButton setTitle:@"登录" forState:UIControlStateNormal];
        [_signInButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_signInButton setBackgroundImage:[self imageWithColor:COLORMAIN] forState:UIControlStateNormal];
        [_signInButton setBackgroundImage:[self imageWithColor:[UIColor colorWithRed:202/255.0 green:55/255.0 blue:37/255.0 alpha:1.0]] forState:UIControlStateHighlighted];
        
        //分割线
        _lineView = [[UIView alloc]init];
        _lineView.backgroundColor = [UIColor lightGrayColor];
        
        //注册
        _signUpButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_signUpButton setTitle:@"注册账号" forState:UIControlStateNormal];
        _signUpButton.titleLabel.font = [UIFont systemFontOfSize:14];
        [_signUpButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        
        //忘记密码
        _forgetPasswordButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_forgetPasswordButton setTitle:@"忘记密码" forState:UIControlStateNormal];
        _forgetPasswordButton.titleLabel.font = [UIFont systemFontOfSize:14];
        [_forgetPasswordButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        
        //底部图
        _loginPicture = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"login_pic"]];
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(saveUserName:)
                                                     name:@"back"
                                                   object:nil];
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    __weak typeof(self) weakSelf = self;
    [self addSubview:self.imgView];
    [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(162, 50));
        make.top.equalTo(weakSelf).offset(57);
        make.centerX.equalTo(weakSelf);
    }];
    
    [self addSubview:self.usernameTextField];
    [self.usernameTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.imgView.mas_bottom).offset(40);
        make.size.mas_offset(CGSizeMake(252, 48));
        make.centerX.equalTo(weakSelf);
    }];
    
    [self addSubview:self.passwordTxtField];
    [self.passwordTxtField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.usernameTextField.mas_bottom);
        make.size.mas_offset(CGSizeMake(252, 48));
        make.centerX.equalTo(weakSelf);
    }];
    
    [self addSubview:self.signInButton];
    [self.signInButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.passwordTxtField.mas_bottom).offset(16);
        make.size.mas_offset(CGSizeMake(260, 48));
        make.centerX.equalTo(weakSelf);
    }];
    
    [self addSubview:self.lineView];
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.signInButton.mas_bottom).offset(16);
        make.size.mas_offset(CGSizeMake(1, 20));
        make.centerX.equalTo(weakSelf);
    }];
    
    [self addSubview:self.signUpButton];
    [self.signUpButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.signInButton.mas_bottom).offset(16);
        make.size.mas_offset(CGSizeMake(58, 20));
        make.right.equalTo(weakSelf.lineView.mas_left).offset(-2);
    }];
    
    [self addSubview:self.forgetPasswordButton];
    [self.forgetPasswordButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.signInButton.mas_bottom).offset(16);
        make.size.mas_offset(CGSizeMake(58, 20));
        make.left.equalTo(weakSelf.lineView.mas_right).offset(2);
    }];
    
    [self addSubview:self.loginPicture];
    [self.loginPicture mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(weakSelf.mas_bottom);
        make.height.mas_equalTo(100);
        make.left.equalTo(weakSelf.mas_left);
        make.right.equalTo(weakSelf.mas_right);
    }];
    
    
    CGRect frame = CGRectMake(self.usernameTextField.x-6, self.usernameTextField.y, self.usernameTextField.width+6, self.usernameTextField.height*2);
    UIBezierPath *path =  [UIBezierPath bezierPathWithRoundedRect:frame cornerRadius:2];
    path.lineWidth = 0.5;
    CAShapeLayer *layer = [[CAShapeLayer alloc]init];
    layer.path = path.CGPath;
    layer.fillColor = [UIColor clearColor].CGColor;
    layer.strokeColor = [UIColor colorWithRed:203/255.0 green:203/255.0 blue:209/255.0 alpha:1.0].CGColor;
    [self.layer addSublayer:layer];
    
    UIBezierPath *line = [UIBezierPath bezierPath];
    [line moveToPoint:CGPointMake(self.usernameTextField.x-6, self.usernameTextField.y+self.usernameTextField.height)];
    [line addLineToPoint:CGPointMake(self.usernameTextField.x+self.usernameTextField.width, self.usernameTextField.y+self.usernameTextField.height)];
    line.lineWidth = 0.5;
    CAShapeLayer *layer1 = [[CAShapeLayer alloc]init];
    layer1.path = line.CGPath;
    layer1.fillColor = [UIColor clearColor].CGColor;
    layer1.strokeColor =[UIColor colorWithRed:203/255.0 green:203/255.0 blue:209/255.0 alpha:1.0].CGColor;
    [self.layer addSublayer:layer1];
}

-(void)hideKeyboard{
    [self.usernameTextField resignFirstResponder];
    [self.passwordTxtField resignFirstResponder];
}

- (UIImage *)imageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}


-(void)shake:(UIView *)view {
    const int MAX_SHAKES = 6;
    const CGFloat SHAKE_DURATION = 0.08;
    const CGFloat SHAKE_TRANSFORM = 10;
    
    CGFloat direction = 1;
    
    for (int i = 0; i <= MAX_SHAKES; i++) {
        [UIView animateWithDuration:SHAKE_DURATION
                              delay:SHAKE_DURATION * i
                            options:UIViewAnimationOptionCurveEaseIn
                         animations:^{
                             if (i >= MAX_SHAKES) {
                                 view.transform = CGAffineTransformIdentity;
                             } else {
                                 view.transform = CGAffineTransformMakeTranslation(SHAKE_TRANSFORM * direction, 0);
                             }
                         } completion:nil];
        
        direction *= -1;
    }
}

-(BOOL)isValidate
{
    if ([self.usernameTextField.text isEqualToString:@""]) {
        [self shake:self.usernameTextField];
        [self.usernameTextField becomeFirstResponder];
        return NO;
    }else if ([self.passwordTxtField.text isEqualToString:@""]) {
        [self shake:self.passwordTxtField];
        [self.passwordTxtField becomeFirstResponder];
        return NO;
    }
    return YES;
}
- (void)saveUserName:(NSNotification *)note
{
    NSArray *array = note.object;
    
    self.usernameTextField.text = [array objectAtIndex:0];
    
}
@end

