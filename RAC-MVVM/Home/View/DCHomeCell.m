//
//  DCHomeCell.m
//  RAC-MVVM
//
//  Created by wenhua on 2018/1/9.
//  Copyright © 2018年 wenhua. All rights reserved.
//

#import "DCHomeCell.h"

@interface DCHomeCell()

@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *detailLabel;

@end
@implementation DCHomeCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setUpUI];
    }
    return self;
}
-(void)setUpUI
{
    UILabel *nameLabel = [UILabel new];
    nameLabel.textAlignment = NSTextAlignmentLeft;
    nameLabel.textColor = [UIColor grayColor];
    nameLabel.font = [UIFont systemFontOfSize:16];
    nameLabel.frame = CGRectMake(10, 10, 80, 30);
    [self.contentView addSubview:nameLabel];
    self.nameLabel = nameLabel;
    
    UILabel *detailLabel = [UILabel new];
    detailLabel.textAlignment = NSTextAlignmentRight;
    detailLabel.textColor = [UIColor grayColor];
    detailLabel.font = [UIFont systemFontOfSize:14];
    detailLabel.frame = CGRectMake(120, 10, Screen_Width - 130, 30);
    [self.contentView addSubview:detailLabel];
    self.detailLabel = detailLabel;
}

-(void)setCellModel:(RowModel *)cellModel
{
    _cellModel = cellModel;
    self.nameLabel.text = cellModel.name;
    self.detailLabel.text = cellModel.detail;
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
