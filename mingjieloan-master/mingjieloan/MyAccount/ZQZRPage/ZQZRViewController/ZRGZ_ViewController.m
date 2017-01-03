//
//  ZRGZ_ViewController.m
//  Yilicai
//
//  Created by 盐商 on 16/3/7.
//  Copyright © 2016年 Louding. All rights reserved.
//

#import "ZRGZ_ViewController.h"

@interface ZRGZ_ViewController ()

@end

@implementation ZRGZ_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    UIColor * color = [UIColor whiteColor];
    NSDictionary * dict=[NSDictionary dictionaryWithObject:color forKey:NSForegroundColorAttributeName];
    self.navigationController.navigationBar.titleTextAttributes = dict;
    self.navigationItem.title = @"转让规则";
    
    
    UILabel *ruleTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(15 * FitWidth, 0 * FitHeight + 64, 200 * FitWidth, 45 * FitHeight)];
    [self.view addSubview:ruleTitleLabel];
    ruleTitleLabel.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    UILabel *ruleLabel = [[UILabel alloc] initWithFrame:CGRectMake(15 * FitWidth, 0 * FitHeight + 64 + ruleTitleLabel.frame.size.height, kWIDTH - 25 * FitWidth, 400 * FitHeight)];
    [self.view addSubview:ruleLabel];
    ruleLabel.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    ruleTitleLabel.font = [UIFont systemFontOfSize:17 * FitWidth];
    ruleTitleLabel.textColor = [UIColor colorWithRed:39 / 255.0 green:39 / 255.0 blue:39 / 255.0 alpha:1.0];
    ruleTitleLabel.text = @"债权转让规则";
    
    ruleLabel.font = [UIFont systemFontOfSize:14 * FitWidth];
    ruleLabel.textColor = [UIColor colorWithRed:71 / 255.0 green:71 / 255.0 blue:71 / 255.0 alpha:1.0];
    ruleLabel.numberOfLines = 0;
    
    
    
    
    NSString *str1 = @"1.  项目冻结期满后，允许全部转让;";
    NSString *str2 = @"2.  仅一次性还本付息、按月付息到期还本的项目可进行\n     转让;";
    NSString *str3 = @"3.  还款日前15日（含还款日当日）不允许转让;";
    NSString *str4 = @"4.  债权转让自发布日后不允许撤销，24小时内未转让成\n     功自动下架;";
    NSString *str5 = @"5.  转让发布日之前的原项目收益，归转让人所有;";
    NSString *str6 = @"6.  转让服务费以转让本金的0.1%为收取标准，具体费用\n     以实际收取为准;";
    NSString *str7 = @"7.  铭捷贷有权对债权转让人提交的申请进行审核，以确\n     保该申请符合法律及铭捷贷债权转让规则的要求;";
    NSString *str8 = @"8.  铭捷贷对上述债权转让规则有最终解释权。";
    //    NSString *str9 = @"9.  铭捷贷平台收取转让人债权转让本金的0-0.3%的金额作为平台服务费,具体费用以实际收取为准;";
    //    NSString *str10 = @"（项目持有30-60天，收取转让本金的0.2%;持有60-90天，收取转让本金的0.1%;持有90天以上，暂不收取）";
    //    NSString *str11 = @"10. 铭捷贷有权对债权转让人提交的转让申请进行审核，以确保该申请符合法律合规及铭捷贷债权转让规则的要求;";
    //    NSString *str12 = @"11. 铭捷贷对上述债权转让规则有最终解释权;";
    
    ruleLabel.text = [NSString stringWithFormat:@"%@\n%@\n%@\n%@\n%@\n%@\n%@\n%@", str1,str2,str3,str4,str5,str6,str7,str8];
    
    NSMutableAttributedString * attributedString1 = [[NSMutableAttributedString alloc] initWithString:ruleLabel.text];
    NSMutableParagraphStyle * paragraphStyle1 = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle1 setLineSpacing:6];
    [attributedString1 addAttribute:NSParagraphStyleAttributeName value:paragraphStyle1 range:NSMakeRange(0, [ruleLabel.text length])];
    [ruleLabel setAttributedText:attributedString1];
    [ruleLabel sizeToFit];
    
    
    //    UIImageView *zrgzImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 64, 375 * KWIDTH, 667 * KHEIGHT - 54)];
    //    [self.view addSubview:zrgzImageView];
    //    zrgzImageView.image = [UIImage imageNamed:@"zhuanrangguize"];
    
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
