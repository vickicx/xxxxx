//
//  MyCardModel.h
//  mingjieloan
//
//  Created by 王好帅 on 2017/1/4.
//  Copyright © 2017年 mingjie. All rights reserved.
//

#import "BaseModel.h"

@interface MyCardModel : BaseModel

@property (strong, nonatomic) NSString * end_time;
@property (strong, nonatomic) NSString * cash_price;
@property (strong, nonatomic) NSString * type_flag;
@property (strong, nonatomic) NSString * used_time;
@property (strong, nonatomic) NSString * start_time;
@property (strong, nonatomic) NSString * casha_desc;
@property (strong, nonatomic) NSString * status;

//var end_time: String?
//
//var cash_price: String?
//
//var type_flag: String?
//
//var used_time: String?
//
//var start_time: Double?
//
//var cash_desc: String?
//
//var status:CashSumStatus?
//
//required init(data: [String : AnyObject]) {
//    
//    end_time <-- data["end_time"]
//    
//    cash_price <-- data["cash_price"]
//    
//    type_flag <-- data["type_flag"]
//    
//    used_time <-- data["used_time"]
//    
//    start_time <-- data["start_time"]
//    
//    cash_desc <-- data["cash_desc"]
//    
//    var s: Int
//    
//    s = data["status"] as! Int
//    
//    status = CashSumStatus(rawValue: s)


@end

