//
//  DHFZRProductCell.h
//  mingjieloan
//
//  Created by 杜虹锋 on 2017/1/4.
//  Copyright © 2017年 mingjie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PICircularProgressView.h"
#import "ProductDetailModel.h"
@interface DHFZRProductCell : UITableViewCell

@property (nonatomic, strong)UIImageView *titlePic;
@property (nonatomic, strong)UILabel *titleLab;
@property (nonatomic, strong)UIImageView *zhuangtaiLab;
@property (nonatomic, strong)PICircularProgressView *progressView;
@property (nonatomic, strong)UIView *lineView;
@property (nonatomic, strong)UILabel *touziLabel;
@property (nonatomic, strong)UILabel *touzishuziLab;
@property (nonatomic, strong)UILabel *shouyiLabel;
@property (nonatomic, strong)UILabel *shouyibaifenLab;
@property (nonatomic, strong)UILabel *xiangmuLabel;
@property (nonatomic, strong)UILabel *xiangmutianshuLab;
@property (nonatomic, strong)UILabel *daoqiLabel;
@property (nonatomic, strong)UILabel *daoqiTimeLab;


@property (nonatomic, strong)UIImageView *baozhangPic;
@property (nonatomic, strong)UILabel *baozhangLab;
@property (nonatomic, strong)UIImageView *huankuanPic;
@property (nonatomic, strong)UILabel *huankuanLab;
@property (nonatomic, strong)UIImageView *timePic;
@property (nonatomic, strong)UILabel *timeLab;
@property (nonatomic, strong)UIImageView *jixiPic;
@property (nonatomic, strong)UILabel *jixiLab;
@property (nonatomic, strong)UIImageView *zhuanrangPic;
@property (nonatomic, strong)UILabel *zhuanrangLab;
@property (nonatomic, strong)UILabel *qitouLabel;
@property (nonatomic, strong)UILabel *ketouLabel;
@property (nonatomic, strong)UIImageView *manBiaoPic;
@property (nonatomic, strong)UILabel *baifenbiLabel;
@property (nonatomic, strong)UIView *botView;
@property (nonatomic, strong)ProductDetailModel *detailPModel;



@end
