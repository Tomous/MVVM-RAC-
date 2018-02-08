//
//  DCHomeViewController.m
//  RAC-MVVM
//
//  Created by wenhua on 2018/1/9.
//  Copyright © 2018年 wenhua. All rights reserved.
//

#import "DCHomeViewController.h"
#import "DCHomeView.h"
#import "DCHomeViewModel.h"
@interface DCHomeViewController ()

@property(nonatomic,strong)DCHomeView * homeView;
@property(nonatomic,strong)DCHomeViewModel * homeViewModel;

@end

@implementation DCHomeViewController

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"home";
    
    self.homeViewModel = [DCHomeViewModel new];
    
    [self setUpView];
    
    self.homeViewModel.SelectCellBlock = ^(NSIndexPath *indexPath) {
      NSLog(@"我是第%ld行",(long)indexPath.row);
    };
}
-(void)setUpView{
    self.homeView = [[DCHomeView alloc]initWithViewModel:self.homeViewModel];
    self.homeView.frame = CGRectMake(0, 0, Screen_Width, Screen_Height);
    [self.view addSubview:self.homeView];
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
