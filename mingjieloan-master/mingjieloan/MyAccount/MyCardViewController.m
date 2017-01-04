//
//  MyCardViewController.m
//  mingjieloan
//
//  Created by 王好帅 on 2017/1/4.
//  Copyright © 2017年 mingjie. All rights reserved.
//

#import "MyCardViewController.h"

@interface MyCardViewController ()

// 未使用1  已使用2  已过期99
@property (strong, nonatomic) NSString * status;

@end

@implementation MyCardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title  = @"我的卡券";
    self.status = @"1";
    self.page   = 20;
    [self getCard];
}

- (void)getCard {
    
    //    et params: [String : AnyObject]! = [
    //                                        "sid" : sid,
    //                                        "status" : "\(useStatus)",
    //                                        "page":page
    //                                        ]
    NSDictionary *dic = @{
                          @"sid":[[NSUserDefaults standardUserDefaults] objectForKey:@"sid"],
                          @"status":self.status,
                          @"page":[NSString stringWithFormat:@"%d",self.page]
                          };
    [VVNetWorkTool postWithUrl:Url(MYCASH) body:dic bodyType:BodyTypeDictionary httpHeader:nil responseType:0 progress:^(NSProgress *progress) {
        
    } success:^(id result) {
        NSLog(@"%@",result);
    } fail:^(NSError *error) {
        
    }];
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
