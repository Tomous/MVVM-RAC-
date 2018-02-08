//
//  DCBaseViewModel.m
//  RAC-MVVM
//
//  Created by wenhua on 2018/1/9.
//  Copyright © 2018年 wenhua. All rights reserved.
//

#import "DCBaseViewModel.h"

@implementation DCBaseViewModel

-(instancetype)init
{
    if (self = [super init]) {
        
        _currentController = [UIViewController currentViewController];
    }
    return self;
}


-(void)pushToViewController:(UIViewController *)viewController withTitle:(NSString *)title fromSuperViewController:(UIViewController *)superViewController
{
    viewController.title = title;
    
    [superViewController.navigationController pushViewController:viewController animated:YES];
}
@end
