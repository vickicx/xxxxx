//
//  ProductDetailThreeTableViewCell.h
//  mingjieloan
//
//  Created by 杜虹锋 on 2016/12/25.
//  Copyright © 2016年 mingjie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProductDetailCollectionViewCell.h"
#import "ProductShenheTableViewCell.h"
#import "UIImageView+WebCache.h"
#import "ProductDetailModel.h"
#import "pApplicationCheckModel.h"//审核信息
#import "InformationModel.h"//项目资料model
@protocol PopUpViewDelegate <NSObject>
- (void)popViewAction:(NSInteger )num;
@end

@interface ProductDetailThreeTableViewCell : UITableViewCell<UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong)PopView *popView;
@property (nonatomic, assign) id<PopUpViewDelegate>delegate;
@property (nonatomic, strong)UIImageView *danbaoTitleImg;
@property (nonatomic, strong)UILabel *danbaoTitleLab;
@property (nonatomic, strong)UIView *lineView1;
@property (nonatomic, strong)UILabel *danbaoDetailLab;
@property (nonatomic, strong)UIView *bottomView1;
@property (nonatomic, strong)UIImageView *anquanTitleImg;
@property (nonatomic, strong)UILabel *anquanTitleLab;
@property (nonatomic, strong)UIView *lineView2;
@property (nonatomic, strong)UILabel *anquanDetailLab;
@property (nonatomic, strong)UIView *bottomView2;
    
    
    @property (nonatomic, strong)UIImageView *ziliaoTitleImg;
    @property (nonatomic, strong)UILabel *ziliaoTitleLab;
    @property (nonatomic, strong)UIView *lineView3;
    @property (nonatomic, strong)UICollectionView *collectionView;
    @property (nonatomic, strong)UIView *bottomView3;
    
    @property (nonatomic, strong)UIImageView *shenheTitleImg;
    @property (nonatomic, strong)UILabel *shenheTitleLab;
    @property (nonatomic, strong)UIView *lineView4;
    @property (nonatomic, strong)UITableView *tableView;
    @property (nonatomic, strong)ProductDetailModel *detailPModel;
@property (nonatomic, strong)pApplicationCheckModel *checkModel;
@property (nonatomic, strong)NSMutableArray *informaModel;
@property (nonatomic, strong)NSMutableArray *shenheArray;
@end
