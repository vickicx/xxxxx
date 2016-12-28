//
//  ZZNoDataPromptVC.m
//  mingjieloan
//
//  Created by kang on 16/12/27.
//  Copyright © 2016年 mingjie. All rights reserved.
//

#import "ZZNoDataPromptVC.h"

@interface ZZNoDataPromptVC ()

@end

@implementation ZZNoDataPromptVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.backImage = [[UIImageView alloc] initWithFrame:CGRectMake((kWIDTH - 125) / 2, (kHEIGHT - 90) / 2, 125 * FitWidth, 90 * FitHeight)];
    self.backImage.image = [UIImage imageNamed:@"empty"];
    [self.view addSubview:_backImage];
    
    UILabel *textLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, (kHEIGHT - 90) / 2 + 110 * FitHeight, kWIDTH, 25)];
    textLabel.font = [UIFont systemFontOfSize:18];
    textLabel.text = @"暂无数据!";
    textLabel.textAlignment = NSTextAlignmentCenter;
    textLabel.textColor = GetColor(@"#e9e9e9");
    [self.view addSubview:textLabel];
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
