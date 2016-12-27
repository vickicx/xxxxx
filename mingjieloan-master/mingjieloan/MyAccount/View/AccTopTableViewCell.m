//
//  AccTopTableViewCell.m
//  mingjieloan
//
//  Created by vicki on 2016/12/27.
//  Copyright © 2016年 mingjie. All rights reserved.
//

#import "AccTopTableViewCell.h"

@implementation AccTopTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.contentView.backgroundColor = [XXColor imagasAsetsSum];
        [self createView];
    }
    return self;
}

- (void)createView {
    UILabel *zongzichan = [[UILabel alloc] initWithFrame:CGRectMake(19*FitWidth, 45*FitHeight, 150*FitWidth, 30*FitHeight)];
    zongzichan.text = @"总资产 （元）";
    zongzichan.textColor = [UIColor whiteColor];
   
    self.totalMoney = [[UILabel alloc] initWithFrame:CGRectMake(zongzichan.right + 10 * FitWidth, zongzichan.top, zongzichan.width, zongzichan.height)];
    self.totalMoney.text = @"0.00";
    self.totalMoney.textColor = [UIColor whiteColor];
    zongzichan.font = self.totalMoney.font = RealFont(23);
    
     [self addSubview:zongzichan];
    [self addSubview:self.totalMoney];
    
    
    UILabel *yuqishouyi = [[UILabel alloc] initWithFrame:CGRectMake(zongzichan.left, zongzichan.bottom +10*FitWidth, zongzichan.width+10*FitWidth, zongzichan.height)];
    yuqishouyi.text = @"预期待收收益 （元）";
    yuqishouyi.textColor = [UIColor whiteColor];
    
    self.yuqishouyiLab = [[UILabel alloc] initWithFrame:CGRectMake(yuqishouyi.right + 10 * FitWidth, yuqishouyi.top, yuqishouyi.width, yuqishouyi.height)];
    self.yuqishouyiLab.text = @"0.00";
    self.yuqishouyiLab.textColor = [UIColor whiteColor];
    yuqishouyi.font = self.yuqishouyiLab.font = RealFont(16);
    
    [self addSubview:yuqishouyi];
    [self addSubview:self.yuqishouyiLab];
    
    self.myCarBtn = [[UIButton alloc] initWithFrame:CGRectMake(self.right -45*FitWidth, self.yuqishouyiLab.top, 100*FitWidth, self.yuqishouyiLab.height)];
    [_myCarBtn addTarget:self action:@selector(didSelectMyCar:) forControlEvents:UIControlEventTouchUpInside];
    _myCarBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    [_myCarBtn setTitle:@"交易记录>>" forState:UIControlStateNormal];
    [_myCarBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.contentView addSubview:_myCarBtn];
}

-(void)didSelectMyCar:(UIButton *)button{
    
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
