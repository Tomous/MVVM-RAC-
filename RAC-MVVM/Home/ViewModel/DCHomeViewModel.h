//
//  DCHomeViewModel.h
//  RAC-MVVM
//
//  Created by wenhua on 2018/1/9.
//  Copyright © 2018年 wenhua. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RowModel.h"

typedef void (^didSelectCellBlock)(NSIndexPath *indexPath);

@interface DCHomeViewModel : NSObject

@property(nonatomic,copy)didSelectCellBlock SelectCellBlock;

-(RowModel *)getRowModelWithIndexPath:(NSIndexPath *)indexPath;

-(NSInteger)getCellCount;

-(void)didSelectRowAtIndexPath:(NSIndexPath *)indexPath;

@end
