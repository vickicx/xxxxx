//
//  JFJLViewController.m
//  Yilicai
//
//  Created by 盐商 on 16/5/24.
//  Copyright © 2016年 Louding. All rights reserved.
//

#import "JFJLViewController.h"
#import "HYTQCell.h"

@interface JFJLViewController ()<UITableViewDataSource, UITableViewDelegate, UIAlertViewDelegate>

@property (nonatomic, strong) UITableView *jfjlTableView;

@property (nonatomic, strong) UIImageView *blueView;

@property (nonatomic, strong) UIImageView *lingqutishiImageView;

@property (nonatomic, strong) UILabel *lingqutishiLabel;

@property (nonatomic, strong) UIImageView *giftImageView;

@property (nonatomic, strong) UILabel *jfjlLabel;

@property (nonatomic, strong) UIButton *lingquButton;

@property (nonatomic, strong) UIImageView *whiteBackImageView;

@property (nonatomic, strong) UIImageView *bigGiftImageView;

@property (nonatomic, strong) UIImageView *smallImageView;

@property (nonatomic, strong) UILabel *jifenLabel;

@property (nonatomic, strong) UIButton *getButton;

@property (nonatomic, strong) UIView *lijilingquView;

@property (nonatomic, strong) UIImageView *lijilingquImageView;

@property (nonatomic, strong) UIButton *lijilingquButton;

@property (nonatomic, strong) UIButton *closeButton;

@property (nonatomic, copy) NSString *unavailable;

@property (nonatomic, copy) NSString *msg;

@property (nonatomic, assign) BOOL integralFlag;

@property (nonatomic, assign) BOOL successFlag;

@end

@implementation JFJLViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    UIColor *color = [UIColor whiteColor];
    NSDictionary * dict=[NSDictionary dictionaryWithObject:color forKey:NSForegroundColorAttributeName];
    self.navigationController.navigationBar.titleTextAttributes = dict;
    self.navigationItem.title = @"积分奖励";
    
    [self dataHandle];
    
    [self createTableView];
    
    self.blueView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kWIDTH, 90 * FitHeight)];
    [self.jfjlTableView addSubview:self.blueView];
    self.blueView.image = [UIImage imageNamed:@"jifen_topBJ"];
//    self.blueView.backgroundColor = [UIColor colorWithRed:67 / 255.0 green:134 / 255.0 blue:214 / 255.0 alpha:1.0];
    
//    UIImageView *blueImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 375 * KWIDTH, 100)];
//    [self.jfjlTableView addSubview:blueImageView];
//    blueImageView.image = [UIImage imageNamed:@"blueImage"];
    
//    UIImageView *headBackImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 375 * KWIDTH, 150 * KHEIGHT)];
//    [self.jfjlTableView addSubview:headBackImageView];
//    headBackImageView.image = [UIImage imageNamed:@""];
    
    self.giftImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10 * FitWidth, 20 * FitHeight, 50 * FitWidth, 50 * FitHeight)];
    [self.jfjlTableView addSubview:self.giftImageView];
    self.giftImageView.image = [UIImage imageNamed:@"award-box"];
    self.giftImageView.tintColor = [UIColor whiteColor];
//    self.giftImageView.backgroundColor = [UIColor whiteColor];
    
    self.jfjlLabel = [[UILabel alloc] initWithFrame:CGRectMake(20 * FitWidth + self.giftImageView.frame.size.width, 20 * FitHeight, 100 * FitWidth, 50 * FitHeight)];
    [self.jfjlTableView addSubview:self.jfjlLabel];
    self.jfjlLabel.font = [UIFont systemFontOfSize:15 weight:8];
    self.jfjlLabel.textColor = [UIColor whiteColor];
    self.jfjlLabel.text = @"积分奖励";
    
    self.lingquButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.lingquButton.frame = CGRectMake(kWIDTH - 10 * FitWidth - 130 * FitWidth, 25 * FitHeight, 130 * FitWidth, 35 * FitHeight);
    [self.jfjlTableView addSubview:self.lingquButton];
    [self.lingquButton setTitle:[NSString stringWithFormat:@"V%ld会员专享", self.vip] forState:UIControlStateNormal];
    [self.lingquButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.lingquButton.layer.masksToBounds = YES;
    self.lingquButton.layer.cornerRadius = 3 * FitWidth;
    self.lingquButton.layer.borderColor = [UIColor whiteColor].CGColor;
    self.lingquButton.layer.borderWidth = 1.5;
    [self.lingquButton addTarget:self action:@selector(lingquButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    self.lingqutishiImageView = [[UIImageView alloc] initWithFrame:CGRectMake(kWIDTH - 15 * FitWidth - 120 * FitWidth, 0, 120 * FitWidth, 25 * FitHeight)];
    [self.jfjlTableView addSubview:self.lingqutishiImageView];
//    self.lingqutishiImageView.backgroundColor = [UIColor whiteColor];
    self.lingqutishiImageView.hidden = YES;
    self.lingqutishiImageView.image = [UIImage imageNamed:@"bubble_white"];
    
    self.lingqutishiLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 120 * FitWidth, 25 * FitHeight)];
    [self.lingqutishiImageView addSubview:self.lingqutishiLabel];
    self.lingqutishiLabel.font = [UIFont systemFontOfSize:10];
    self.lingqutishiLabel.textColor = [UIColor colorWithRed:67 / 255.0 green:134 / 255.0 blue:214 / 255.0 alpha:1.0];
    self.lingqutishiLabel.textAlignment = NSTextAlignmentCenter;
    self.lingqutishiLabel.text = @"每月1-10号领取";
    self.lingqutishiLabel.hidden = YES;

//    self.whiteBackImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 80 * KHEIGHT, 375 * KWIDTH, 220 * KHEIGHT)];
//    [self.jfjlTableView addSubview:self.whiteBackImageView];
//    self.whiteBackImageView.backgroundColor = [UIColor yellowColor];
    
    self.bigGiftImageView = [[UIImageView alloc] initWithFrame:CGRectMake((375 - 160) * FitWidth / 2, 120 * FitHeight, 160 * FitHeight, 160 * FitHeight)];
    [self.jfjlTableView addSubview:self.bigGiftImageView];
//    self.bigGiftImageView.image = [UIImage imageNamed:@"get-box"];
    self.bigGiftImageView.userInteractionEnabled = YES;
//    self.bigGiftImageView.backgroundColor = [UIColor orangeColor];
    
    self.smallImageView = [[UIImageView alloc] initWithFrame:CGRectMake(13 * FitWidth, 47 * FitHeight, 130 * FitWidth, 100 * FitHeight)];
    [self.bigGiftImageView addSubview:self.smallImageView];
    self.smallImageView.hidden = YES;
    
    self.jifenLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, self.bigGiftImageView.frame.size.height / 5, self.bigGiftImageView.frame.size.width, self.bigGiftImageView.frame.size.height / 3)];
    [self.bigGiftImageView addSubview:self.jifenLabel];
    self.jifenLabel.font = [UIFont systemFontOfSize:16 weight:8];
    self.jifenLabel.textAlignment = NSTextAlignmentCenter;
    self.jifenLabel.textColor = [UIColor whiteColor];
//    self.jifenLabel.text = @"500";
    
    self.getButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.bigGiftImageView addSubview:self.getButton];
    self.getButton.frame = CGRectMake(0, self.bigGiftImageView.frame.size.height / 3 * 2 - 5 * FitHeight, self.bigGiftImageView.frame.size.width, self.bigGiftImageView.frame.size.height / 4);
//    [self.getButton setTitle:@"可领取" forState:UIControlStateNormal];
//    [self.getButton setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    self.getButton.titleLabel.font = [UIFont systemFontOfSize:13 weight:6];
    
    [self.getButton addTarget:self action:@selector(getButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    
    self.lijilingquView = [[UIView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview:self.lijilingquView];
    self.lijilingquView.backgroundColor = [UIColor blackColor];
    self.lijilingquView.alpha = 0.4;
    
    self.lijilingquImageView = [[UIImageView alloc] initWithFrame:CGRectMake(20 * FitWidth, 150 * FitHeight, kWIDTH - 40 * FitWidth, kWIDTH - 60 * FitWidth)];
    [self.view addSubview:self.lijilingquImageView];
    self.lijilingquImageView.image = [UIImage imageNamed:@"lijilingqu"];
    self.lijilingquImageView.userInteractionEnabled = YES;
    
    self.lijilingquButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.lijilingquImageView addSubview:self.lijilingquButton];
    self.lijilingquButton.frame = CGRectMake(50 * FitWidth, self.lijilingquImageView.frame.size.height - 33 * FitHeight, self.lijilingquImageView.frame.size.width - 100 * FitWidth, 30 * FitHeight);
    [self.lijilingquButton addTarget:self action:@selector(lijilingquButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
//    self.lijilingquButton.backgroundColor = [UIColor redColor];
    
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
    NSString *url = [NSString stringWithFormat:@"%@/vip/getPoints2", HOSTURL];
    
     NSDictionary *body = @{@"sid":MySid};
    
    [VVNetWorkTool postWithUrl:url body:body bodyType:BodyTypeDictionary httpHeader:nil responseType:0 progress:^(NSProgress *progress) {
        
    } success:^(id result) {
        
        self.successFlag = [[result objectForKey:@"successFlag"] boolValue];
        
        NSString *str = [NSString stringWithFormat:@"%@", [result objectForKey:@"msg"]];
        
        if (self.successFlag == YES) {
            
            [self dataHandle];
        }
        
        if (self.successFlag == NO) {
            
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message: str preferredStyle:UIAlertControllerStyleAlert];
            
//            UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:nil];
            
            UIAlertAction *defautAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
                [self dismissViewControllerAnimated:alert completion:nil];
                
            }];
            
//            [alert addAction:cancelAction];
            [alert addAction:defautAction];
            
            [self presentViewController:alert animated:YES completion:nil];
            
        }
    } fail:^(NSError *error) {

    }];
    
    self.lijilingquView.hidden = YES;
    self.lijilingquImageView.hidden = YES;
}

// alertView的点击(提示你没有收藏任何东西, 返回上一个界面)
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    [self.navigationController popViewControllerAnimated:YES];
    
    
}

- (void)closeButtonClicked:(UIButton *)button
{
    self.lijilingquView.hidden = YES;
    self.lijilingquImageView.hidden = YES;
}


- (void)dataHandle
{
    NSString *url = [NSString stringWithFormat:@"%@%@", HOSTURL, JFJL];
    
  
    
    NSDictionary *body = @{@"sid":self.sid,@"vip":[NSString stringWithFormat:@"%ld",self.vip]};
    

    [VVNetWorkTool postWithUrl:url body:body bodyType:BodyTypeDictionary httpHeader:nil responseType:0 progress:^(NSProgress *progress) {
        
    } success:^(id result) {
        
        self.jifenLabel.text = [NSString stringWithFormat:@"%@", [result objectForKey:@"vip"]];
        
        self.unavailable = [result objectForKey:@"unavailable"];
        
        self.msg = [result objectForKey:@"msg"];
        
        self.integralFlag = [[result objectForKey:@"integralFlag"] boolValue];
        
        [self.getButton setTitle:[NSString stringWithFormat:@"%@", self.msg] forState:UIControlStateNormal];
        
        if ([self.unavailable isEqualToString:@"0"]) {
            
            
            self.smallImageView.image = [UIImage imageNamed:@""];
            
        }
        
        if ([self.unavailable isEqualToString:@"1"]) {
            
            self.smallImageView.image = [UIImage imageNamed:@"received"];
            
            
        }
        
        if ([self.unavailable isEqualToString:@"2"]) {
            
            
            self.smallImageView.image = [UIImage imageNamed:@"out-date"];
            
        
        }
        
        
        if (self.integralFlag == YES) {
            
            self.bigGiftImageView.image = [UIImage imageNamed:@"get-box"];
            
            self.getButton.userInteractionEnabled = YES;
            self.smallImageView.hidden = YES;
            [self.getButton setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
        }
        
        if (self.integralFlag == NO) {
            
            self.bigGiftImageView.image = [UIImage imageNamed:@"got-box"];
            self.getButton.userInteractionEnabled = NO;
            self.smallImageView.hidden = NO;
            [self.getButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        }
        
        
        [self.jfjlTableView reloadData];
        
        } fail:^(NSError *error) {
    }];
    
}



- (void)createTableView
{
    self.jfjlTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kWIDTH, kHEIGHT) style:UITableViewStyleGrouped];
    [self.view addSubview:self.jfjlTableView];
    self.jfjlTableView.delegate = self;
    self.jfjlTableView.dataSource = self;
    
    self.jfjlTableView.rowHeight = 60 * FitHeight;
    
    self.jfjlTableView.backgroundColor = [UIColor whiteColor];
    
    self.jfjlTableView.scrollEnabled = NO;
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
    HYTQCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JFJLCell"];
    if (!cell) {
        
        cell = [[HYTQCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"JFJLCell"];
    }
    
    if (indexPath.row == 0) {
        
        cell.titleLabel.text = @"积分奖励特权说明";
        cell.describeLabel.text = @"V3-V8会员，铭捷贷每月奖励200-10000不等数量积分";
    }
    if (indexPath.row == 1){
        
        cell.titleLabel.text = @"有效时间";
        cell.describeLabel.text = @"每月1-10号领取，每个会员每月限领一次";
    }
    if (indexPath.row == 2){
        
        cell.titleLabel.text = @"特权对象";
        cell.describeLabel.text = @"已完成实名验证的V3，V4，V5，V6，V7，V8会员";
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
