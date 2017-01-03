//
//  ProductDetailThreeTableViewCell.m
//  mingjieloan
//
//  Created by 杜虹锋 on 2016/12/25.
//  Copyright © 2016年 mingjie. All rights reserved.
//

#import "ProductDetailThreeTableViewCell.h"

@implementation ProductDetailThreeTableViewCell

    
    - (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
        self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
        if (self) {
            //        self.contentView.backgroundColor = GetColor(@"#f8f8f8");
            [self createViews];
        }
        return self;
    }
    
- (void)createViews{
    
    self.informaModel = [NSMutableArray array];
    self.shenheArray = [NSMutableArray arrayWithObjects:@"身份证", @"机动车登记证", @"婚姻证明", @"户口本", @"信用报告", @"机构担保审核", nil];
    
    
    self.danbaoTitleImg = [[UIImageView alloc] initWithFrame:CGRectMake(12, 12, 13, 16)];
    _danbaoTitleImg.image = [UIImage imageNamed:@"danbaofangjieshao"];
    [self.contentView addSubview:_danbaoTitleImg];
    
    self.danbaoTitleLab = [[UILabel alloc] initWithFrame:CGRectMake(35, 12, 100, 16)];
    _danbaoTitleLab.font = [UIFont systemFontOfSize:14];
    _danbaoTitleLab.text = @"担保方介绍";
    [self.contentView addSubview:_danbaoTitleLab];
    
    self.lineView1 = [[UIView alloc] initWithFrame:CGRectMake(12, 32, kWIDTH - 24, 1)];
    _lineView1.backgroundColor = GetColor(@"#e8e8e8");
    [self.contentView addSubview:_lineView1];
    
    
    self.danbaoDetailLab = [[UILabel alloc] initWithFrame:CGRectMake(13, 50, kWIDTH - 24, 70)];
    //    _detailLab.backgroundColor = [UIColor greenColor];
    _danbaoDetailLab.font = [UIFont systemFontOfSize:13];
    _danbaoDetailLab.textColor = GetColor(@"#555555");
    _danbaoDetailLab.numberOfLines = 0;
    _danbaoDetailLab.text = @"大连亿嘉担保有限公司，成立于2008年06月30日，注册资本壹亿元，工作深入细致，业务开展有方，与银行合作默契，风险控制有力，社会一小明显。以“卓越、创新、执着”为企业精神，主张“专业沟通、实效营销”的服务理念。展望未来，一家担保将进一步加强与客户以及协作单位的友好合作，力求在充满机遇、挑战、希望的市场中成为大连地区担保行业的第一品牌";
    [self.contentView addSubview:_danbaoDetailLab];
    CGFloat hight1 = [HeightWithString heightForTextLable:_danbaoDetailLab.text width:kWIDTH - 24 fontSize:13];
    _danbaoDetailLab.frame = CGRectMake(13, 47, kWIDTH - 26, hight1);
    
    self.bottomView1 = [[UIView alloc] initWithFrame:CGRectMake(0, 47+hight1+10, kWIDTH, 10)];
    _bottomView1.backgroundColor = GetColor(@"e8e8e8");
    [self.contentView addSubview:_bottomView1];
    
    CGFloat danbaoHight = 47 + hight1 + 10 +10;
    
    self.anquanTitleImg = [[UIImageView alloc] initWithFrame:CGRectMake(12, 12 + danbaoHight, 15, 15)];
    _anquanTitleImg.image = [UIImage imageNamed:@"anquanbaozhang"];
    [self.contentView addSubview:_anquanTitleImg];
    
    self.anquanTitleLab = [[UILabel alloc] initWithFrame:CGRectMake(35, 12 + danbaoHight, 100, 15)];
    _anquanTitleLab.font = [UIFont systemFontOfSize:14];
    _anquanTitleLab.text = @"安全保障";
    [self.contentView addSubview:_anquanTitleLab];
    
    self.lineView2 = [[UIView alloc] initWithFrame:CGRectMake(12, 32 + danbaoHight, kWIDTH - 24, 1)];
    _lineView2.backgroundColor = GetColor(@"#e8e8e8");
    [self.contentView addSubview:_lineView2];
    
    
    self.anquanDetailLab = [[UILabel alloc] initWithFrame:CGRectMake(13, 55 + danbaoHight, kWIDTH - 24, 70)];
    //    _detailLab.backgroundColor = [UIColor greenColor];
    _anquanDetailLab.font = [UIFont systemFontOfSize:13];
    _anquanDetailLab.textColor = GetColor(@"#555555");
    _anquanDetailLab.numberOfLines = 0;
    _anquanDetailLab.text = @"1.明杰贷不触碰用户资金，交易资金完全由第三方支付机构监管。\n2.项目推荐方审核、筛选优质资产\n3.抵押物价值充足，足以支撑还款";
    [self.contentView addSubview:_anquanDetailLab];
    CGFloat hight2 = [HeightWithString heightForTextLable:_anquanDetailLab.text width:kWIDTH - 24 fontSize:13];
    _anquanDetailLab.frame = CGRectMake(13, 50 + danbaoHight, kWIDTH - 26, hight2);
    
    self.bottomView2 = [[UIView alloc] initWithFrame:CGRectMake(0, 50+hight2+25 + danbaoHight, kWIDTH, 10)];
    _bottomView2.backgroundColor = GetColor(@"e8e8e8");
    [self.contentView addSubview:_bottomView2];
    
   CGFloat anquanHeight =  50+hight2+25 + danbaoHight + 10;
    
    
    self.ziliaoTitleImg = [[UIImageView alloc] initWithFrame:CGRectMake(12, 12 + anquanHeight +13, 14.5, 12.5)];
    _ziliaoTitleImg.image = [UIImage imageNamed:@"xinxipilou"];
    [self.contentView addSubview:_ziliaoTitleImg];
    
    self.ziliaoTitleLab = [[UILabel alloc] initWithFrame:CGRectMake(35, 12 + anquanHeight +13, 100, 15)];
    _ziliaoTitleLab.font = [UIFont systemFontOfSize:14];
    _ziliaoTitleLab.text = @"项目资料";
    [self.contentView addSubview:_ziliaoTitleLab];
    
    self.lineView3 = [[UIView alloc] initWithFrame:CGRectMake(12, 32 +anquanHeight, kWIDTH - 24, 1)];
    _lineView3.backgroundColor = GetColor(@"#e8e8e8");
    [self.contentView addSubview:_lineView3];
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake(90*FitWidth, 90 * FitHeight);
    flowLayout.minimumInteritemSpacing = 30.0 * FitWidth;
    flowLayout.minimumLineSpacing = 30 * FitHeight;
    flowLayout.sectionInset = UIEdgeInsetsMake(30, 30 * FitWidth, 30, 30 * FitWidth);
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, anquanHeight + 33, kWIDTH, 130) collectionViewLayout:flowLayout];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:_collectionView];
    
    [self.collectionView registerClass:[ProductDetailCollectionViewCell class] forCellWithReuseIdentifier:@"coCell"];
    
    self.bottomView3 = [[UIView alloc] initWithFrame:CGRectMake(0, anquanHeight + 130 + 33 , kWIDTH, 10)];
    _bottomView3.backgroundColor = GetColor(@"e8e8e8");
    [self.contentView addSubview:_bottomView3];
    
    self.ziliaoTitleImg = [[UIImageView alloc] initWithFrame:CGRectMake(12, 12 + anquanHeight + 33 + 130 + 10, 15, 15)];
    _ziliaoTitleImg.image = [UIImage imageNamed:@"shenhejilu"];
    [self.contentView addSubview:_ziliaoTitleImg];
    
    self.ziliaoTitleLab = [[UILabel alloc] initWithFrame:CGRectMake(35, 12 +anquanHeight + 33  + 130 + 10, 100, 15)];
    _shenheTitleLab.font = [UIFont systemFontOfSize:14];
    _ziliaoTitleLab.text = @"审核记录";
    [self.contentView addSubview:_ziliaoTitleLab];
    
    self.lineView4 = [[UIView alloc] initWithFrame:CGRectMake(12, 12 + anquanHeight + 33 + 130 + 10 + 24, kWIDTH - 24, 1)];
    _lineView4.backgroundColor = GetColor(@"#e8e8e8");
    [self.contentView addSubview:_lineView4];
    
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0,  12 + anquanHeight + 33 + 130 + 10 + 25, kWIDTH, 150) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.contentView addSubview:_tableView];
    
    
}
    
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
        return _informaModel.count;
}
    
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
    {
        ProductDetailCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"coCell" forIndexPath:indexPath];
        cell.backgroundColor = [UIColor whiteColor];
    
        InformationModel *infomaModel = [self.informaModel objectAtIndex:indexPath.item];
        cell.titleLab.text = infomaModel.typeName[0];
        NSLog(@"cel%@", cell.titleLab.text);
        [cell.titleImg sd_setImageWithURL:infomaModel.typeImageUrl[0]];
        
        return cell;
    }
    
    // 点击触发方法

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    [self.delegate popViewAction:indexPath.item];
}
    
    
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 6;
}
    
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 25;
}
    
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"cell";
    ProductShenheTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[ProductShenheTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    cell.titleLab.text = [self.shenheArray objectAtIndex:indexPath.row];
    if(self.checkModel.credibilityCheckFlg == 1){
        cell.titleImg.image = [UIImage imageNamed:@"shenhejilu_right"];
    }
    else{
        cell.titleImg.image = [UIImage imageNamed:@"ex_fail"];
    }
    if(self.checkModel.estateCheckFlg == 1){
        cell.titleImg.image = [UIImage imageNamed:@"shenhejilu_right"];
    }
    else{
        cell.titleImg.image = [UIImage imageNamed:@"ex_fail"];
    }
    if(self.checkModel.guaranteeCheckFlg == 1){
        cell.titleImg.image = [UIImage imageNamed:@"shenhejilu_right"];
    }
    else{
        cell.titleImg.image = [UIImage imageNamed:@"ex_fail"];
    }
    if(self.checkModel.householdCheckFlg == 1){
        cell.titleImg.image = [UIImage imageNamed:@"shenhejilu_right"];
    }
    else{
        cell.titleImg.image = [UIImage imageNamed:@"ex_fail"];
    }
    if(self.checkModel.idCardCheckFlg == 1){
        cell.titleImg.image = [UIImage imageNamed:@"shenhejilu_right"];
    }
    else{
        cell.titleImg.image = [UIImage imageNamed:@"ex_fail"];
    }
    if(self.checkModel.marriageCheckFlg == 1){
        cell.titleImg.image = [UIImage imageNamed:@"shenhejilu_right"];
    }
    else{
        cell.titleImg.image = [UIImage imageNamed:@"ex_fail"];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}


- (void)setDetailPModel:(ProductDetailModel *)detailPModel{
    _detailPModel = detailPModel;
    
    _danbaoDetailLab.text = _detailPModel.descriptionJS;
    CGFloat hight1 = [HeightWithString heightForTextLable:_danbaoDetailLab.text width:kWIDTH - 24 fontSize:13];
    _danbaoDetailLab.frame = CGRectMake(13, 47, kWIDTH - 26, hight1);
    
    self.bottomView1.frame = CGRectMake(0, 47+hight1+10, kWIDTH, 10);
    CGFloat danbaoHight = 47 + hight1 + 10 +10;
    self.anquanTitleImg.frame = CGRectMake(12, 12 + danbaoHight, 15, 15);
    self.anquanTitleLab.frame = CGRectMake(35, 12 + danbaoHight, 100, 15);
    self.lineView2.frame = CGRectMake(12, 32 + danbaoHight, kWIDTH - 24, 1);
    self.anquanDetailLab.frame = CGRectMake(13, 55 + danbaoHight, kWIDTH - 24, 70);

    _anquanDetailLab.text = _detailPModel.descriptionRiskDescri;
    CGFloat hight2 = [HeightWithString heightForTextLable:_anquanDetailLab.text width:kWIDTH - 24 fontSize:13];
    _anquanDetailLab.frame = CGRectMake(13, 50 + danbaoHight, kWIDTH - 26, hight2);
    
    self.bottomView2.frame = CGRectMake(0, 50+hight2+25 + danbaoHight, kWIDTH, 10);

    CGFloat anquanHeight =  50+hight2+25 + danbaoHight + 10;
    
    
    self.ziliaoTitleImg.frame = CGRectMake(12, 12 + anquanHeight +13, 14.5, 12.5);
    self.ziliaoTitleLab.frame = CGRectMake(35, 12 +anquanHeight +13, 100, 15);
    
    self.lineView3.frame = CGRectMake(12, 32 +anquanHeight, kWIDTH - 24, 1);

    self.collectionView.frame = CGRectMake(0, anquanHeight + 33, kWIDTH, 130);
    self.bottomView3.frame = CGRectMake(0, anquanHeight + 130 + 33, kWIDTH, 10);
    self.ziliaoTitleImg.frame = CGRectMake(12, 12 + anquanHeight + 33 + 130  + 10, 15, 15);
    self.ziliaoTitleLab.frame = CGRectMake(35, 12 +anquanHeight + 33  + 130  + 10, 100, 15);
    self.lineView4.frame = CGRectMake(12, 12 + anquanHeight + 33 + 130 + 10 + 24, kWIDTH - 24, 1);
    
    self.tableView.frame = CGRectMake(0,  12 + anquanHeight + 33 + 130 + 10 + 25, kWIDTH, 150);
//    NSLog(@"cell height ===== %f", 12 + anquanHeight + 33 + 130 * FitHeight + 10 + 25);
}

- (void)setCheckModel:(pApplicationCheckModel *)checkModel{
    _checkModel = checkModel;
    [self.tableView reloadData];
}

- (void)setInformaModel:(NSMutableArray *)informaModel{
    _informaModel = informaModel;
    [self.collectionView reloadData];
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
