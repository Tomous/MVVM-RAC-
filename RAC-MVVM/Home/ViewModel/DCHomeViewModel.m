//
//  DCHomeViewModel.m
//  RAC-MVVM
//
//  Created by wenhua on 2018/1/9.
//  Copyright © 2018年 wenhua. All rights reserved.
//

#import "DCHomeViewModel.h"

@interface DCHomeViewModel ()

@property(nonatomic,strong)NSMutableArray * listArr;//盛放所有model的数组

@end
@implementation DCHomeViewModel

-(instancetype)init{
    if (self = [super init]) {
        
        [self configModelArr];
    }
    return self;
}

-(void)configModelArr
{
    self.listArr = [NSMutableArray array];
    
    for (int i = 0; i < 4; i ++) {
        
        RowModel * model = [RowModel new];
        model.name = [NSString stringWithFormat:@"第%d行", i];
        model.detail = [NSString stringWithFormat:@"我是第%d行， 多多指教", i];
        [self.listArr addObject:model];
    }
}

-(RowModel *)getRowModelWithIndexPath:(NSIndexPath *)indexPath
{
    return [self.listArr objectAtIndex:indexPath.row];
}

-(NSInteger)getCellCount{
    return self.listArr.count;
}

-(void)didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (self.SelectCellBlock) {
        self.SelectCellBlock(indexPath);
    }
}
@end
