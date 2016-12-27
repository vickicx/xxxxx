//
//  ExchangeViewController.m
//  Yilicai
//
//  Created by 盐商 on 16/4/5.
//  Copyright © 2016年 Louding. All rights reserved.
//

#import "ExchangeViewController.h"
#import "XXColor.h"

#define eWIDTH ([UIScreen mainScreen].bounds.size.width/375)
#define eHEIGHT ([UIScreen mainScreen].bounds.size.height/667)

@interface ExchangeViewController ()

@end

@implementation ExchangeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    self.view.window.backgroundColor = [UIColor clearColor];
    
//    self.view.backgroundColor = [UIColor clearColor];
    self.view.opaque = NO;
    [self.view.layer setOpaque:NO];
    [self.view setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.868f]];
    
    self.exchangeBackView = [[UIView alloc] init];
    [self.view addSubview:self.exchangeBackView];
    
    self.alertView = [[UIView alloc] init];
    [self.view addSubview:self.alertView];
    
    self.exchangeTitleLabel = [[UILabel alloc] init];
    [self.alertView addSubview:self.exchangeTitleLabel];
    
    self.closeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.alertView addSubview:self.closeButton];
    
    self.okButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.alertView addSubview:self.okButton];
    
    self.exchangeBackView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    self.exchangeBackView.backgroundColor = [UIColor blackColor];
    self.exchangeBackView.alpha = 0.3;
    
    self.alertView.frame = CGRectMake(60 * eWIDTH, 253 * eHEIGHT, 375 * eWIDTH - 120 * eWIDTH, 667 * eHEIGHT - 253 * eHEIGHT * 2);
    self.alertView.backgroundColor = [UIColor cyanColor];
    
    self.exchangeTitleLabel.frame = CGRectMake(50 * eWIDTH, 35 * eHEIGHT , self.alertView.frame.size.width - 100 * eWIDTH, 50 * eHEIGHT);
    self.exchangeTitleLabel.textColor = [UIColor colorWithRed:251 / 255.0 green:114 / 255.0 blue:43 / 255.0 alpha:1.0];
    self.exchangeTitleLabel.backgroundColor = [UIColor yellowColor];
    
    self.closeButton.frame = CGRectMake(self.alertView.frame.size.width - 10, 0, 10, 10);
    [self.closeButton addTarget:self action:@selector(closeButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    //不明颜色
    self.closeButton.backgroundColor = [UIColor grayColor];
    
    self.okButton.frame = CGRectMake(35 * eWIDTH, 45 * eHEIGHT + self.exchangeTitleLabel.frame.size.height, self.alertView.frame.size.width - 70 * eWIDTH, 40 * eHEIGHT);
    self.okButton.backgroundColor = [XXColor btnGoldenColor];
    [self.okButton setTitle:@"确定兑换" forState:UIControlStateNormal];
    [self.okButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.okButton.titleLabel.font = [UIFont systemFontOfSize:15];
    [self.okButton addTarget:self action:@selector(okButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
}


- (void)okButtonClicked:(UIButton *)button
{
    [self dismissViewControllerAnimated:NO completion:^{
        
        
    }];
}


- (void)closeButtonClicked:(UIButton *)button
{
    [self dismissViewControllerAnimated:NO completion:^{
        
        
    }];
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
