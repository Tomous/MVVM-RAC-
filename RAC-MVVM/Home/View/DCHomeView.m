//
//  DCHomeView.m
//  RAC-MVVM
//
//  Created by wenhua on 2018/1/9.
//  Copyright © 2018年 wenhua. All rights reserved.
//

#import "DCHomeView.h"
#import "DCHomeCell.h"
@interface DCHomeView()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *mainTableView;
@property(nonatomic,strong)DCHomeViewModel * viewModel;

@end
@implementation DCHomeView

-(instancetype)initWithViewModel:(DCHomeViewModel *)viewModel
{
    if (self = [super init]) {
        self.viewModel = viewModel;
        
        [self setUpView];
    }
    return self;
}

-(void)setUpView
{
    self.mainTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, Screen_Height) style:UITableViewStylePlain];
    self.mainTableView.delegate = self;
    self.mainTableView.dataSource = self;
    [self addSubview:self.mainTableView];
}

#pragma mark - tableView delegate&dataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.viewModel getCellCount];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *distr = @"cell";
    DCHomeCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (!cell) {
        cell = [[DCHomeCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:distr];
    }
    cell.cellModel = [self.viewModel getRowModelWithIndexPath:indexPath];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.viewModel didSelectRowAtIndexPath:indexPath];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
