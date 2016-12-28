//
//  JFViewController.m
//  Yilicai
//
//  Created by 盐商 on 16/4/7.
//  Copyright © 2016年 Louding. All rights reserved.
//

#import "JFViewController.h"
#import "WDJFViewController.h"
#import "JFGZViewController.h"
#import "JFDetialViewController.h"
#import "XXColor.h"

@interface JFViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UIView *headBackView;

@property (nonatomic, strong) UIView *headView;

@property (nonatomic, strong) UIView *kyjfView;

@property (nonatomic, strong) UILabel *kyjfTitleLabel;

@property (nonatomic, strong) UILabel *kyjfLabel;

@property (nonatomic, strong) UILabel *zjfLabel;

@property (nonatomic, strong) UILabel *jjgqLabel;

@property (nonatomic, strong) UITableView *jfTableView;

@property (nonatomic, strong) NSArray *titleArr;

@property (nonatomic, strong) UIButton *jfscButton;

@property (nonatomic, strong) UIButton *jfgzButton;

@property (nonatomic, strong) NSMutableArray *dataArr;

@property (nonatomic, strong) NSMutableArray *mainArr;

@property (nonatomic, copy) NSString *usable_point_m;//可用积分

@property (nonatomic, copy) NSString *froze_usable;//总积分

@property (nonatomic, copy) NSString *usable_point_m_over;//即将过期积分

@property (nonatomic, assign) NSInteger detailType;

@end

@implementation JFViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.titleArr = [NSArray array];
        self.dataArr = [NSMutableArray array];
        self.mainArr = [NSMutableArray array];
    }
    
    return self;
}


- (void)viewWillAppear:(BOOL)animated{
    
    [self dataHandle];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    UIColor * color = [UIColor whiteColor];
    NSDictionary * dict=[NSDictionary dictionaryWithObject:color forKey:NSForegroundColorAttributeName];
    self.navigationController.navigationBar.titleTextAttributes = dict;
    self.navigationItem.title = @"我的积分";
    
    self.navigationItem.backBarButtonItem.title = @"我的账户";
    
    self.titleArr = @[@"    积分明细", @"    积分收入", @"    积分支出", @"    已过期"];
    
    [self dataHandle];
    
    [self createTableView];
    
    [self createHeadView];
    
    self.jfscButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.jfscButton.frame = CGRectMake(40 * FitWidth, 430 * FitHeight, 375 * FitWidth - 80 * FitWidth, 50 * FitHeight);
    [self.view addSubview:self.jfscButton];
    self.jfscButton.backgroundColor = [XXColor btnGoldenColor];
    self.jfscButton.layer.cornerRadius = 5 * FitHeight;
    
    [self.jfscButton setTitle:@"积分商城" forState:UIControlStateNormal];
    [self.jfscButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.jfscButton.titleLabel.font = [UIFont systemFontOfSize:17];
    
    [self.jfscButton addTarget:self action:@selector(jfscButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    self.jfgzButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.jfgzButton.frame = CGRectMake(80 * FitWidth,667 * FitHeight - 35 * FitHeight, 375 * FitWidth - 160 * FitWidth, 25 * FitHeight);
    [self.view addSubview:self.jfgzButton];
    [self.jfgzButton setTitle:@"积分使用规则?" forState:UIControlStateNormal];
    [self.jfgzButton setTitleColor:[XXColor goldenColor] forState:UIControlStateNormal];
    self.jfgzButton.titleLabel.font = [UIFont systemFontOfSize:11];
    [self.jfgzButton addTarget:self action:@selector(jfgzButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)jfscButtonClicked:(UIButton *)button
{
    WDJFViewController *wdscViewController = [[WDJFViewController alloc] init];
    
    wdscViewController.sid = self.sid;
    
    UIBarButtonItem *backIetm = [[UIBarButtonItem alloc] init];
    
    backIetm.title =@"我的积分";
    
    self.navigationItem.backBarButtonItem = backIetm;
    
    [self.navigationController pushViewController:wdscViewController animated:YES];
}

- (void)jfgzButtonClicked:(UIButton *)button
{
    JFGZViewController *jfgzViewController = [[JFGZViewController alloc] init];
    
    jfgzViewController.sid = self.sid;
    
    UIBarButtonItem *backIetm = [[UIBarButtonItem alloc] init];
    
    backIetm.title =@"我的积分";
    
    self.navigationItem.backBarButtonItem = backIetm;
    
    [self.navigationController pushViewController:jfgzViewController animated:YES];
}


- (void)dataHandle
{
    NSString *url = [NSString stringWithFormat:@"%@%@", HOSTURL, WDJF];
    
    NSString *body = [NSString stringWithFormat:@"sid=%@", self.sid];
    
    [VVNetWorkTool postWithUrl:url body:body bodyType:BodyTypeDictionary httpHeader:nil responseType:0 progress:^(NSProgress *progress) {
        
    } success:^(id result) {
        
        //NSLog(@"积分 ====== %@", result);
        
        NSDictionary *dic = result;
        
//        NSString *kyjf = [[self class] countNumAndChangeformat:[dic objectForKey:@"usable_point_m"]];
        self.kyjfLabel.text = [NSString stringWithFormat:@"%@分", [dic objectForKey:@"usable_point_m"]];
        
        NSString *zjf = [[self class] countNumAndChangeformat:[dic objectForKey:@"froze_usable"]];
        self.zjfLabel.text = [NSString stringWithFormat:@"总积分:%@分", zjf];
        
        NSString *jjgq = [[self class] countNumAndChangeformat:[dic objectForKey:@"usable_point_m_over"]];
        self.jjgqLabel.text = [NSString stringWithFormat:@"即将过期:%@分", jjgq];
        
//        self.kyjfLabel.text = [NSString stringWithFormat:@"%@分", [dic objectForKey:@"usable_point_m"]];
        
//        NSString *str1 = [[self class] countNumAndChangeformat:[dic objectForKey:@"usable_point_m"]];
        
        NSString *str = [NSString stringWithFormat:@"%@分", [dic objectForKey:@"usable_point_m"]];
        
        NSMutableAttributedString *AttributedStr = [[NSMutableAttributedString alloc]initWithString:str];
        
        [AttributedStr addAttribute:NSFontAttributeName
         
                              value:[UIFont systemFontOfSize:16.0]
         
                              range:NSMakeRange(str.length-1, 1)];
        
        self.kyjfLabel.attributedText = AttributedStr;
        
        [self.jfTableView reloadData];
         } fail:^(NSError *error) {
             
    }];
}

+(NSString *)countNumAndChangeformat:(NSString *)num
{
    int count = 0;
    long long int a = num.longLongValue;
    while (a != 0)
    {
        count++;
        a /= 10;
    }
    NSMutableString *string = [NSMutableString stringWithString:num];
    NSMutableString *newstring = [NSMutableString string];
    while (count > 3) {
        count -= 3;
        NSRange rang = NSMakeRange(string.length - 3, 3);
        NSString *str = [string substringWithRange:rang];
        [newstring insertString:str atIndex:0];
        [newstring insertString:@"," atIndex:0];
        [string deleteCharactersInRange:rang];
    }
    [newstring insertString:string atIndex:0];
    return newstring;
}


- (void)createHeadView
{
    self.headBackView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, FitWidth * 375, 130 * FitHeight)];
    [self.jfTableView addSubview:self.headBackView];
    self.headBackView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    self.headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, FitWidth * 375, FitHeight * 130)];
    [self.headBackView addSubview:self.headView];
    self.headView.backgroundColor = [UIColor whiteColor];
    
    self.kyjfView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, FitWidth * 375, FitHeight * 130)];
    
    [self.headView addSubview:self.kyjfView];
    
    //土豪金
    self.kyjfView.backgroundColor = [XXColor imagasAsetsSum];
    
    self.kyjfTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(20 * FitWidth, 30 * FitHeight, 150 * FitWidth, 30 * FitHeight)];
    [self.kyjfView addSubview:self.kyjfTitleLabel];
    self.kyjfTitleLabel.text = @"可用积分";
    self.kyjfTitleLabel.font = [UIFont systemFontOfSize:17 weight:0.3];
    self.kyjfTitleLabel.textColor = [UIColor whiteColor];
    
    self.kyjfLabel = [[UILabel alloc] initWithFrame:CGRectMake(20 * FitWidth, 30 * FitHeight + self.kyjfTitleLabel.frame.size.height, 375 * FitWidth, 40 * FitHeight)];
    [self.kyjfView addSubview:self.kyjfLabel];
    self.kyjfLabel.textColor = [UIColor whiteColor];
    self.kyjfLabel.font = [UIFont systemFontOfSize:25];
    self.kyjfLabel.text = self.usable_point_m;
    
    
    
//    self.zjfLabel = [[UILabel alloc] initWithFrame:CGRectMake(15 * KWIDTH, 100 * KHEIGHT, 200 * KWIDTH, 55 * KHEIGHT)];
//    [self.headView addSubview:self.zjfLabel];
//    self.zjfLabel.font = [UIFont systemFontOfSize:14];
//    self.zjfLabel.textColor = [XXColor goldenColor];
    
//    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(190 * KWIDTH, 110 * KHEIGHT, 2 * KWIDTH, 55 * KHEIGHT - 20 * KHEIGHT)];
//    [self.headView addSubview:line];
//    line.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
//    self.jjgqLabel = [[UILabel alloc] initWithFrame:CGRectMake(200 * KWIDTH, 100 * KHEIGHT, 200 * KWIDTH, 55 * KHEIGHT)];
//    [self.headView addSubview:self.jjgqLabel];
//    self.jjgqLabel.font = [UIFont systemFontOfSize:14];
//    self.jjgqLabel.textColor = [XXColor goldenColor];
}



- (void)createTableView
{
    self.jfTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, 375 * FitWidth, 667 * FitHeight - 64) style:UITableViewStyleGrouped];
    [self.view addSubview:self.jfTableView];
    
    self.jfTableView.delegate = self;
    self.jfTableView.dataSource = self;
    
    self.jfTableView.scrollEnabled = NO;
    
    self.jfTableView.backgroundColor = [UIColor whiteColor];
    
    self.jfTableView.rowHeight = 40 * FitHeight;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.titleArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    if (!cell) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
    }
    
    cell.textLabel.textColor = [UIColor darkGrayColor];
    cell.textLabel.font = [UIFont systemFontOfSize:14];
    cell.textLabel.text = [self.titleArr objectAtIndex:indexPath.row];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}





- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return self.headView.frame.size.height;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.detailType = indexPath.row + 1;
    
    JFDetialViewController *jfDetialViewController = [[JFDetialViewController alloc] init];
    
    jfDetialViewController.detailType = self.detailType;
    jfDetialViewController.sid = self.sid;
    
    UIBarButtonItem *backIetm = [[UIBarButtonItem alloc] init];
    
    backIetm.title =@"我的积分";
    
    self.navigationItem.backBarButtonItem = backIetm;
    
    [self.navigationController pushViewController:jfDetialViewController animated:YES];
    
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
