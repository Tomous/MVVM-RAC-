//
//  DCLoginViewModel.h
//  RAC-MVVM
//
//  Created by wenhua on 2017/12/27.
//  Copyright © 2017年 wenhua. All rights reserved.
//

#import "DCBaseViewModel.h"
#import "DCLoginView.h"
@interface DCLoginViewModel : DCBaseViewModel


@property (nonatomic,copy)NSString *username;
@property (nonatomic,copy)NSString *password;
@property(nonatomic,strong)DCLoginView * loginView;

@property (nonatomic,strong)RACSignal *loginButtonEnableSignal;
@property(nonatomic,strong)RACCommand * loginCommond;
@end
