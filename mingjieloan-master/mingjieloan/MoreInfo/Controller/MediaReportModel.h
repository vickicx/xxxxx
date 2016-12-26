//
//  MediaReportModel.h
//  mingjieloan
//
//  Created by 杜虹锋 on 2016/12/25.
//  Copyright © 2016年 mingjie. All rights reserved.
//

#import "BaseModel.h"

@interface MediaReportModel : BaseModel

@property (nonatomic, copy) NSString *img_path;//图片地址

@property (nonatomic, copy) NSString *summary;//报道内容

@property (nonatomic, copy) NSString *author;//作者

@property (nonatomic, copy) NSString *title;//标题

@property (nonatomic, copy) NSString *source;//来源

@property (nonatomic, copy) NSString *publish_date;//收入时间



@end
