//
//  SRHBViewController.m
//  Yilicai
//
//  Created by 盐商 on 16/5/24.
//  Copyright © 2016年 Louding. All rights reserved.
//

#import "SRHBViewController.h"
#import "HYTQCell.h"

@interface SRHBViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *srhbTableView;

@property (nonatomic, strong) UIImageView *blueView;

@property (nonatomic, strong) UIImageView *lingqutishiImageView;

@property (nonatomic, strong) UILabel *lingqutishiLabel;

@property (nonatomic, strong) UIImageView *giftImageView;

@property (nonatomic, strong) UILabel *srhbLabel;

@property (nonatomic, strong) UILabel *shengriLabel;

@property (nonatomic, strong) UIButton *lingquButton;

@property (nonatomic, strong) UIImageView *whiteBackImageView;

@property (nonatomic, strong) UIImageView *bigGiftImageView;

@property (nonatomic, strong) UIImageView *smallImageView;

@property (nonatomic, strong) UILabel *jineLabel;

@property (nonatomic, strong) UIButton *getButton;

@property (nonatomic, strong) UIView *lijilingquView;

@property (nonatomic, strong) UIImageView *lijilingquImageView;

@property (nonatomic, strong) UILabel *xianjinjineLabel;

@property (nonatomic, strong) UIButton *lijilingquButton;

@property (nonatomic, strong) UIButton *closeButton;

@property (nonatomic, copy) NSString *unavailable;

@property (nonatomic, copy) NSString *msg;

@property (nonatomic, assign) BOOL birthdayRedFlag;

@property (nonatomic, assign) BOOL successFlag;

@end

@implementation SRHBViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    UIColor *color = [UIColor whiteColor];
    NSDictionary * dict=[NSDictionary dictionaryWithObject:color forKey:NSForegroundColorAttributeName];
    self.navigationController.navigationBar.titleTextAttributes = dict;
    self.navigationItem.title = @"生日红包";
    
    [self dataHandle];
    
    [self createTableView];
    
    self.blueView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kWIDTH, 90 * FitHeight)];
    [self.srhbTableView addSubview:self.blueView];
    self.blueView.image = [UIImage imageNamed:@"jifen_topBJ"];
//    self.blueView.backgroundColor = [UIColor colorWithRed:67 / 255.0 green:134 / 255.0 blue:214 / 255.0 alpha:1.0];
    
    self.giftImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10 * FitWidth, 20 * FitHeight, 50 * FitWidth, 50 * FitHeight)];
    [self.srhbTableView addSubview:self.giftImageView];
    self.giftImageView.image = [UIImage imageNamed:@"birthday-money"];
//    self.giftImageView.backgroundColor = [UIColor whiteColor];
    
    self.srhbLabel = [[UILabel alloc] initWithFrame:CGRectMake(20 * FitWidth + self.giftImageView.frame.size.width, 20 * FitHeight, 100 * FitWidth, 30 * FitHeight)];
    [self.srhbTableView addSubview:self.srhbLabel];
    self.srhbLabel.font = [UIFont systemFontOfSize:15 weight:8];
    self.srhbLabel.textColor = [UIColor whiteColor];
    self.srhbLabel.text = @"生日红包";
    
    self.shengriLabel = [[UILabel alloc] initWithFrame:CGRectMake(20 * FitWidth + self.giftImageView.frame.size.width, 15 * FitHeight + self.srhbLabel.frame.size.height, 150 * FitWidth, 30 * FitHeight)];
    [self.srhbTableView addSubview:self.shengriLabel];
    self.shengriLabel.font = [UIFont systemFontOfSize:12 weight:0.4];
    self.shengriLabel.textColor = [UIColor whiteColor];
    
    //领取提示按钮
    self.lingquButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.lingquButton.frame = CGRectMake(kWIDTH - 10 * FitWidth - 130 * FitWidth, 25 * FitHeight, 130 * FitWidth, 35 * FitHeight);
    [self.srhbTableView addSubview:self.lingquButton];
    [self.lingquButton setTitle:[NSString stringWithFormat:@"V%ld会员专享", self.vip] forState:UIControlStateNormal];
    [self.lingquButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.lingquButton.layer.masksToBounds = YES;
    self.lingquButton.layer.cornerRadius = 3 * FitWidth;
    self.lingquButton.layer.borderColor = [UIColor whiteColor].CGColor;
    self.lingquButton.layer.borderWidth = 1.5;
    [self.lingquButton addTarget:self action:@selector(lingquButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    self.lingqutishiImageView = [[UIImageView alloc] initWithFrame:CGRectMake(kWIDTH - 15 * FitWidth - 120 * FitWidth, 0, 120 * FitWidth, 25 * FitHeight)];
    [self.srhbTableView addSubview:self.lingqutishiImageView];
//    self.lingqutishiImageView.backgroundColor = [UIColor whiteColor];
    self.lingqutishiImageView.hidden = YES;
    self.lingqutishiImageView.image = [UIImage imageNamed:@"bubble_white"];
    
    self.lingqutishiLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 120 * FitWidth, 25 * FitHeight)];
    [self.lingqutishiImageView addSubview:self.lingqutishiLabel];
    self.lingqutishiLabel.font = [UIFont systemFontOfSize:10];
    self.lingqutishiLabel.textColor = [UIColor colorWithRed:67 / 255.0 green:134 / 255.0 blue:214 / 255.0 alpha:1.0];
    self.lingqutishiLabel.textAlignment = NSTextAlignmentCenter;
    self.lingqutishiLabel.text = @"生日当月内可领取";
    self.lingqutishiLabel.hidden = YES;
    
//    self.whiteBackImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 80 * KHEIGHT, 375 * KWIDTH, 220 * KHEIGHT)];
//    [self.srhbTableView addSubview:self.whiteBackImageView];
//    self.whiteBackImageView.backgroundColor = [UIColor yellowColor];
    
    self.bigGiftImageView = [[UIImageView alloc] initWithFrame:CGRectMake((kWIDTH - 200 * FitWidth) / 2, 120 * FitHeight, 200 * FitWidth, 160 * FitHeight)];
    [self.srhbTableView addSubview:self.bigGiftImageView];
//    self.bigGiftImageView.image = [UIImage imageNamed:@"can-receive"];
    self.bigGiftImageView.userInteractionEnabled = YES;
//    self.bigGiftImageView.backgroundColor = [UIColor orangeColor];
    
    self.smallImageView = [[UIImageView alloc] initWithFrame:CGRectMake(35 * FitWidth, 47 * FitHeight, 130 * FitWidth, 100 * FitHeight)];
    [self.bigGiftImageView addSubview:self.smallImageView];
    self.smallImageView.hidden = YES;
    
    self.jineLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, self.bigGiftImageView.frame.size.height / 5, self.bigGiftImageView.frame.size.width, self.bigGiftImageView.frame.size.height / 3)];
    [self.bigGiftImageView addSubview:self.jineLabel];
    self.jineLabel.font = [UIFont systemFontOfSize:30 weight:1];
    self.jineLabel.textAlignment = NSTextAlignmentCenter;
    
    self.jineLabel.font = [UIFont fontWithName:@"黑体" size:30];
//    self.jineLabel.text = @"¥10元";
    
    self.getButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.bigGiftImageView addSubview:self.getButton];
    self.getButton.frame = CGRectMake(0, self.bigGiftImageView.frame.size.height / 7 * 5, self.bigGiftImageView.frame.size.width, self.bigGiftImageView.frame.size.height / 4);
//    [self.getButton setTitle:@"可领取" forState:UIControlStateNormal];
    [self.getButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    self.getButton.titleLabel.font = [UIFont systemFontOfSize:13 weight:6];
//    self.getButton.backgroundColor = [UIColor blueColor];
    
    [self.getButton addTarget:self action:@selector(getButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    
    self.lijilingquView = [[UIView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview:self.lijilingquView];
    self.lijilingquView.backgroundColor = [UIColor blackColor];
    self.lijilingquView.alpha = 0.4;
    
    self.lijilingquImageView = [[UIImageView alloc] initWithFrame:CGRectMake(30 * FitWidth, 220 * FitHeight, kWIDTH - 60 * FitWidth, 220 * FitHeight)];
    [self.view addSubview:self.lijilingquImageView];
    self.lijilingquImageView.image = [UIImage imageNamed:@"receiving"];
    self.lijilingquImageView.userInteractionEnabled = YES;
//    self.lijilingquImageView.backgroundColor = [UIColor cyanColor];
    
    self.xianjinjineLabel = [[UILabel alloc] initWithFrame:CGRectMake(107 * FitWidth, 55 * FitHeight, 70 * FitWidth, 50 * FitHeight)];
    [self.lijilingquImageView addSubview:self.xianjinjineLabel];
    self.xianjinjineLabel.font = [UIFont systemFontOfSize:30 weight:0.4];
    self.xianjinjineLabel.textAlignment = NSTextAlignmentCenter;
//    self.xianjinjineLabel.text = @"100";
    
//    self.xianjinjineLabel.backgroundColor = [UIColor redColor];
    
    self.lijilingquButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.lijilingquImageView addSubview:self.lijilingquButton];
    self.lijilingquButton.frame = CGRectMake(50 * FitWidth, self.lijilingquImageView.frame.size.height - 60 * FitHeight, self.lijilingquImageView.frame.size.width - 100 * FitWidth, 30 * FitHeight);
    [self.lijilingquButton addTarget:self action:@selector(lijilingquButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
//        self.lijilingquButton.backgroundColor = [UIColor redColor];
    
    self.closeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.lijilingquImageView addSubview:self.closeButton];
    self.closeButton.frame = CGRectMake(self.lijilingquImageView.frame.size.width - 30 * FitWidth, 20 * FitHeight, 25 * FitWidth, 25 * FitHeight);
    [self.closeButton setImage:[UIImage imageNamed:@"guanbi"] forState:UIControlStateNormal];
    [self.closeButton addTarget:self action:@selector(closeButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    self.lijilingquView.hidden = YES;
    self.lijilingquImageView.hidden = YES;
}

- (void)lingquButtonClicked:(UIButton *)button
{
    button.selected = !button.isSelected;
    if (button.selected) {
        
        self.lingqutishiLabel.hidden = NO;
        self.lingqutishiImageView.hidden = NO;
        
    }else{
        
        self.lingqutishiLabel.hidden = YES;
        self.lingqutishiImageView.hidden = YES;

    }
}



- (void)getButtonClicked:(UIButton *)button
{
    
    self.lijilingquView.hidden = NO;
    self.lijilingquImageView.hidden = NO;
    
}

- (void)lijilingquButtonClicked:(UIButton *)button
{
    NSString *url = [NSString stringWithFormat:@"%@/birthday/get_red2", HOSTURL];
    
     NSDictionary *body = [NSDictionary dictionaryWithObjectsAndKeys:@"sid",MySid, nil];
    [VVNetWorkTool postWithUrl:url body:body bodyType:BodyTypeDictionary httpHeader:nil responseType:0 progress:^(NSProgress *progress) {
        
    } success:^(id result)  {
        
        self.successFlag = [[result objectForKey:@"successFlag"] boolValue];
        
//        NSString *str = [NSString stringWithFormat:@"%@", [result objectForKey:@"msg"]];
        
        if (self.successFlag == YES) {
            
            [self dataHandle];
        }
        
        if (self.successFlag == NO) {
            
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message: @"对不起，您领取失败" preferredStyle:UIAlertControllerStyleAlert];
            
            //            UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:nil];
            
            UIAlertAction *defautAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                
                [self dismissViewControllerAnimated:alert completion:nil];
                
            }];
            
            //            [alert addAction:cancelAction];
            [alert addAction:defautAction];
            
            [self presentViewController:alert animated:YES completion:nil];
            
        }
         }fail:^(NSError *error) {
        
    }];
    
    self.lijilingquView.hidden = YES;
    self.lijilingquImageView.hidden = YES;
}

- (void)closeButtonClicked:(UIButton *)button
{
    self.lijilingquView.hidden = YES;
    self.lijilingquImageView.hidden = YES;
}


- (void)dataHandle
{
    NSString *url = [NSString stringWithFormat:@"%@%@", HOSTURL, SRTQ];
    
    
     NSDictionary *body = [NSDictionary dictionaryWithObjectsAndKeys:@"sid",MySid,@"vip",self.vip, nil];
    
    [VVNetWorkTool postWithUrl:url body:body bodyType:BodyTypeDictionary httpHeader:nil responseType:0 progress:^(NSProgress *progress) {
        
    } success:^(id result)  {

        
        self.jineLabel.text = [NSString stringWithFormat:@"¥%@元", [result objectForKey:@"redMoney"]];
        
        self.xianjinjineLabel.text = [NSString stringWithFormat:@"%@", [result objectForKey:@"redMoney"]];
        
        self.unavailable = [result objectForKey:@"unavailable"];
        
        self.msg = [result objectForKey:@"msg"];
        
        self.birthdayRedFlag = [[result objectForKey:@"birthdayRedFlag"] boolValue];
        
        self.shengriLabel.text = [NSString stringWithFormat:@"您的生日月为：%@月",[result objectForKey:@"birthdayMonth"]];
        
        //判断红圈图案是否存在
        if ([self.unavailable isEqualToString:@"0"]) {
            
            
            self.smallImageView.image = [UIImage imageNamed:@""];
            
            
        }
        
        if ([self.unavailable isEqualToString:@"1"]) {
            
            
            self.smallImageView.image = [UIImage imageNamed:@"received"];
            
            
        }
        
        if ([self.unavailable isEqualToString:@"2"]) {
            
            
            self.smallImageView.image = [UIImage imageNamed:@"out-date"];
            
        }
        
        
        //判断是否显示灰色，以及按钮是否可点击
        if (self.birthdayRedFlag == YES) {
            self.bigGiftImageView.image = [UIImage imageNamed:@"can-receive"];
            self.jineLabel.textColor = [UIColor colorWithRed:169 / 255.0 green:0 / 255.0 blue:33 / 255.0 alpha:1.0];
            [self.getButton setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
            self.getButton.userInteractionEnabled = YES;
            self.smallImageView.hidden = YES;
        }
        
        if (self.birthdayRedFlag == NO) {
            self.bigGiftImageView.image = [UIImage imageNamed:@"can't-receive"];
            self.jineLabel.textColor = [UIColor lightGrayColor];
            [self.getButton setTitle:[NSString stringWithFormat:@"%@", self.msg] forState:UIControlStateNormal];
            [self.getButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
            self.getButton.userInteractionEnabled = NO;
            self.smallImageView.hidden = NO;
            //            [self.getButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
            [self.getButton setTitle:[NSString stringWithFormat:@"%@", self.msg] forState:UIControlStateNormal];
        }
        
        
        [self.srhbTableView reloadData];
    }fail:^(NSError *error) {
     
    }];
    
}


- (void)createTableView
{
    self.srhbTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kWIDTH, kHEIGHT) style:UITableViewStyleGrouped];
    [self.view addSubview:self.srhbTableView];
    self.srhbTableView.delegate = self;
    self.srhbTableView.dataSource = self;
    
    self.srhbTableView.rowHeight = 60 * FitHeight;
    
    self.srhbTableView.backgroundColor = [UIColor whiteColor];
    
    self.srhbTableView.scrollEnabled = NO;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HYTQCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SRHBCell"];
    if (!cell) {
        
        cell = [[HYTQCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"SRHBCell"];
    }
    
    if (indexPath.row == 0) {
        
        cell.titleLabel.text = @"积分奖励特权说明";
        cell.describeLabel.text = @"V4-V8会员，铭捷贷会送出10-100元不等金额现金券";
    }
    if (indexPath.row == 1){
        
        cell.titleLabel.text = @"有效时间";
        cell.describeLabel.text = @"生日当月内可领取，每位会员每年限领1次";
    }
    if (indexPath.row == 2){
        
        cell.titleLabel.text = @"特权对象";
        cell.describeLabel.text = @"已完成实名验证的V4，V5，V6，V7，V8会员";
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 300 * FitHeight;
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
