//
//  DHFProductCenterCell.h
//  mingjieloan
//
//  Created by kang on 16/12/22.
//  Copyright © 2016年 mingjie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProductModel.h"

@interface DHFProductCenterCell : UITableViewCell

@property (nonatomic, strong)UIView *backView;

//@property (nonatomic ,strong)UIImageView *zhuanXiangIV;/** 右上角的图片 */
//@property (nonatomic ,strong)UIImageView *activityTab;/** 周末专享的背景图片 */
////@property (nonatomic ,strong)UILabel *activityLabel;/** 周末专享的背景图片的文字 */

/** 设置什么什么专区 */
@property (nonatomic ,strong)UILabel *product_type_name;

/** cell的名称 */
@property (nonatomic ,strong)UILabel *nameLab;

/** 预计年化收益率 */
@property (nonatomic ,strong)UILabel *annualizedGainLab;

/** 天数 */
@property (nonatomic ,strong)UILabel *extraRate;

/** 100元起投 */
@property (nonatomic ,strong)UILabel *repaymentMethodNameLab;

/** 剩余百分比 */
@property (nonatomic ,strong)UILabel *percentLabel;

/** 进度条*/
@property (nonatomic ,strong)UIProgressView *progressView;

/** 到期还本付息 */
@property (nonatomic ,strong)UILabel *qitou;

/** 剩余可投 */
@property (nonatomic ,strong)UILabel *rest;

/** 投资按钮 */
@property (nonatomic ,strong)UIButton *purchaseBtn;


@property (nonatomic, strong)ProductModel *productModel;







@end
