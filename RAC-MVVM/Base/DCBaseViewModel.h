//
//  DCBaseViewModel.h
//  RAC-MVVM
//
//  Created by wenhua on 2018/1/9.
//  Copyright © 2018年 wenhua. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveObjC/ReactiveObjC.h>

@interface DCBaseViewModel : NSObject

@property(nonatomic,strong)UIViewController * currentController;

-(void)pushToViewController:(UIViewController *)viewController withTitle:(NSString *)title fromSuperViewController:(UIViewController *)superViewController;
@end
