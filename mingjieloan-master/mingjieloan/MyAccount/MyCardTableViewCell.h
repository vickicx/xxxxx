//
//  MyCardTableViewCell.h
//  mingjieloan
//
//  Created by 王好帅 on 2017/1/4.
//  Copyright © 2017年 mingjie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyCardTableViewCell : UITableViewCell


@property (strong, nonatomic) UIImageView   * bgIV;
@property (strong, nonatomic) UILabel       * cashPriceLabel;
@property (strong, nonatomic) UILabel       * cashDes;
@property (strong, nonatomic) UILabel       * timeDes;
@property (strong, nonatomic) UILabel       * beginTime;
@property (strong, nonatomic) UILabel       * activeTime;
@property (strong, nonatomic) UIButton      * useBtn;
@property (strong, nonatomic) UIImageView   * circleImageView;
@property (strong, nonatomic) UILabel       * quanTypeLabel;
@property (strong, nonatomic) UIImageView   * userImageView;

@end
