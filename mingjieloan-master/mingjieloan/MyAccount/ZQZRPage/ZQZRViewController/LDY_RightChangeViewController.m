//
//  LDY_RightChangeViewController.m
//  Yilicai
//
//  Created by 盐商 on 16/2/16.
//  Copyright © 2016年 Louding. All rights reserved.
//
//  债权力转让的界面

#import "LDY_RightChangeViewController.h"
#import "YZRTableViewCell.h"
#import "KZRTableViewCell.h"
#import "ZRZTableViewCell.h"
#import "ZRGZViewController.h"
#import "ZRGZ_ViewController.h"
#import "MJRefresh.h"
#import "XXColor.h"
#import "UIView+Extension.h"

@interface LDY_RightChangeViewController ()<UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate>

@property (nonatomic, strong) UISegmentedControl *segment;

@property (nonatomic, strong) UITableView *kZRTableView;

@property (nonatomic, strong) UITableView *zRZTableView;

@property (nonatomic, strong) UITableView *yZRTableView;

@property (nonatomic, strong) UIScrollView *scrollView;

@property (nonatomic, strong) NSArray *kzrOrdersArr;

@property (nonatomic, strong) NSMutableArray *kzrArr;

@property (nonatomic, strong) NSArray *zrzOrdersArr;

@property (nonatomic, strong) NSMutableArray *zrzArr;

@property (nonatomic, strong) NSArray *yzrOrdersArr;

@property (nonatomic, strong) NSMutableArray *yzrArr;

@property (nonatomic, copy) NSString *xiangmuBJ;

@property (nonatomic, strong) UIImageView *kzrEmptyImageView;

@property (nonatomic, strong) UILabel *kzrEmptyLabel;

@property (nonatomic, strong) UIImageView *zrzEmptyImageView;

@property (nonatomic, strong) UILabel *zrzEmptyLabel;

@property (nonatomic, strong) UIImageView *yzrEmptyImageView;

@property (nonatomic, strong) UILabel *yzrEmptyLabel;

@property (nonatomic, strong) UIView *line1View;

@property (nonatomic, strong) UIView *line2View;

@property (nonatomic, strong) UIView *line3View;

@property (nonatomic, strong) UIButton *kzrBtn;

@property (nonatomic, strong) UIButton *zrzBtn;

@property (nonatomic, strong) UIButton *yzrBtn;

@property (nonatomic, strong) UIButton *zrgzButton;

/** 第几页 */
@property (nonatomic, assign) int kzrPage;
@property (nonatomic, assign) int zrzPage;
@property (nonatomic, assign) int yzrPage;

@end

@implementation LDY_RightChangeViewController

/**
 *XXXXXXX
 */
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        
        self.kzrArr = [NSMutableArray array];
        
        self.zrzArr = [NSMutableArray array];
        
        self.yzrArr = [NSMutableArray array];
    }
    
    return self;
}

/**
 *XXXXXXX
 */
- (void)viewWillAppear:(BOOL)animated {
    
    [self.kZRTableView headerBeginRefreshing];
    
}


/**
 *XXXXXXX
 */
- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.kzrPage = 1;
    self.zrzPage = 1;
    self.yzrPage = 1;
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    UIColor * color = [UIColor whiteColor];
    
    NSDictionary * dict=[NSDictionary dictionaryWithObject:color forKey:NSForegroundColorAttributeName];
    
    self.navigationController.navigationBar.titleTextAttributes = dict;
    
    self.navigationItem.title = @"债权转让";
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] init];
    
    backButton.title = @"我的账户";
    
    //可转让按钮
    self.kzrBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    self.kzrBtn.frame = CGRectMake(10 * KWIDTH, 55 + 20 * KHEIGHT, (self.view.frame.size.width - 20 * KWIDTH) / 3, 35 * KHEIGHT);
    
    [self.view addSubview:self.kzrBtn];
    
    self.kzrBtn.tag = 100000;
    
    self.kzrBtn.selected = YES;
    
    self.kzrBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    
    //kzrBtn.titleLabel.text = @"可转让";
    [self.kzrBtn setTitle:@"可转让" forState:UIControlStateNormal];
    
    self.kzrBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    
    [self.kzrBtn setTitleColor:[XXColor goldenColor] forState:UIControlStateNormal];
    
    [self.kzrBtn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    self.line1View = [[UIView alloc] initWithFrame:CGRectMake(0, self.kzrBtn.frame.size.height, self.kzrBtn.frame.size.width, 2)];
    
    [self.kzrBtn addSubview:self.line1View];
    
    self.line1View.backgroundColor = [XXColor goldenColor];
    
    //kzrBtn.backgroundColor = [UIColor redColor];
    //转让中按钮
    self.zrzBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    self.zrzBtn.frame = CGRectMake(10 * KWIDTH + self.kzrBtn.frame.size.width, 55 + 20 * KHEIGHT, (self.view.frame.size.width - 20 * KWIDTH) / 3, 35 * KHEIGHT);
    
    [self.view addSubview:self.zrzBtn];
    
    self.zrzBtn.tag = 200000;
    
    self.zrzBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    
    [self.zrzBtn setTitle:@"转让中" forState:UIControlStateNormal];
    
    self.zrzBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    
    [self.zrzBtn setTitleColor:[UIColor colorWithRed:47 / 255.0 green:55 / 255.0 blue:85 / 255.0 alpha:1.0] forState:UIControlStateNormal];
    
    [self.zrzBtn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    self.line2View = [[UIView alloc] initWithFrame:CGRectMake(0, self.zrzBtn.frame.size.height, self.kzrBtn.frame.size.width, 2)];
    
    [self.zrzBtn addSubview:self.line2View];
    
    self.line2View.backgroundColor = [UIColor whiteColor];
    
    //已转让按钮
    self.yzrBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    self.yzrBtn.frame = CGRectMake(10 * KWIDTH + self.kzrBtn.frame.size.width * 2, 55 + 20 * KHEIGHT, (self.view.frame.size.width - 20 * KWIDTH) / 3, 35 * KHEIGHT);
    
    [self.view addSubview:self.yzrBtn];
    
    self.yzrBtn.tag = 300000;
    
    self.yzrBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    
    [self.yzrBtn setTitle:@"已转让" forState:UIControlStateNormal];
    
    self.yzrBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    
    [self.yzrBtn setTitleColor:[UIColor colorWithRed:47 / 255.0 green:55 / 255.0 blue:85 / 255.0 alpha:1.0] forState:UIControlStateNormal];
    
    [self.yzrBtn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    self.line3View = [[UIView alloc] initWithFrame:CGRectMake(0, self.yzrBtn.frame.size.height, self.kzrBtn.frame.size.width, 2)];
    
    [self.yzrBtn addSubview:self.line3View];
    
    self.line3View.backgroundColor = [UIColor whiteColor];
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 35 * KHEIGHT + 20 * KHEIGHT + 64, 375 * KWIDTH, [UIScreen mainScreen].bounds.size.height - 30 * KHEIGHT - 64)];
    
    [self.view addSubview:self.scrollView];
    
    self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width * 3, 0);
    
    /* 整页滚动 */
    self.scrollView.pagingEnabled = YES;
    
    /* 视图左上角距离原点的偏移量 */
    self.scrollView.contentOffset = CGPointMake(0, 0);
    
    /* 是否显示垂直滚动条, 默认值为YES */
    self.scrollView.showsVerticalScrollIndicator = NO;
    
    /* 边界是否回弹 */
    self.scrollView.bounces = NO;
    
    self.scrollView.scrollEnabled = NO;
    
    self.scrollView.delegate = self;
    
    [self ZRZDataHandle];
    
    [self YZRDataHandle];
    
    [self createKZRtableView];
    
    [self createZRZtableView];
    
    [self createYZRtableView];
    
    self.kzrEmptyImageView = [[UIImageView alloc] initWithFrame:CGRectMake(105 * KWIDTH, 270 * KHEIGHT - 64, 375 * KWIDTH - 210 * KWIDTH, 110 * KHEIGHT)];
    
    [self.kZRTableView addSubview:self.kzrEmptyImageView];
    
    self.kzrEmptyImageView.image = [UIImage imageNamed:@"empty"];
    
    self.kzrEmptyLabel = [[UILabel alloc] initWithFrame:CGRectMake(105 * KWIDTH , 280 * KHEIGHT + self.kzrEmptyImageView.frame.size.height - 64, 375 * KWIDTH - 210 * KWIDTH, 40 * KHEIGHT)];
    
    [self.kZRTableView addSubview:self.kzrEmptyLabel];
    
    self.kzrEmptyLabel.text = @"暂无数据!";
    
    self.kzrEmptyLabel.textColor = [UIColor lightGrayColor];
    
    self.kzrEmptyLabel.font = [UIFont systemFontOfSize:20];
    
    self.kzrEmptyLabel.textAlignment = NSTextAlignmentCenter;
    
    self.kzrEmptyImageView.hidden = YES;
    
    self.kzrEmptyLabel.hidden = YES;
    
    self.zrzEmptyImageView = [[UIImageView alloc] initWithFrame:CGRectMake(105 * KWIDTH, 270 * KHEIGHT - 64, 375 * KWIDTH - 210 * KWIDTH, 110 * KHEIGHT)];
    
    [self.zRZTableView addSubview:self.zrzEmptyImageView];
    
    self.zrzEmptyImageView.image = [UIImage imageNamed:@"empty"];
    
    self.zrzEmptyLabel = [[UILabel alloc] initWithFrame:CGRectMake(105 * KWIDTH , 280 * KHEIGHT + self.zrzEmptyImageView.frame.size.height - 64, 375 * KWIDTH - 210 * KWIDTH, 40 * KHEIGHT)];
    
    [self.zRZTableView addSubview:self.zrzEmptyLabel];
    
    self.zrzEmptyLabel.text = @"暂无数据!";
    
    self.zrzEmptyLabel.textColor = [UIColor lightGrayColor];
    
    self.zrzEmptyLabel.font = [UIFont systemFontOfSize:20];
    
    self.zrzEmptyLabel.textAlignment = NSTextAlignmentCenter;
    
    self.zrzEmptyImageView.hidden = YES;
    
    self.zrzEmptyLabel.hidden = YES;
    
    
    self.yzrEmptyImageView = [[UIImageView alloc] initWithFrame:CGRectMake(105 * KWIDTH, 270 * KHEIGHT - 64, 375 * KWIDTH - 210 * KWIDTH, 110 * KHEIGHT)];
    
    [self.yZRTableView addSubview:self.yzrEmptyImageView];
    
    self.yzrEmptyImageView.image = [UIImage imageNamed:@"empty"];
    
    self.yzrEmptyLabel = [[UILabel alloc] initWithFrame:CGRectMake(105 * KWIDTH , 280 * KHEIGHT + self.yzrEmptyImageView.frame.size.height - 64, 375 * KWIDTH - 210 * KWIDTH, 40 * KHEIGHT)];
    
    [self.yZRTableView addSubview:self.yzrEmptyLabel];
    
    self.yzrEmptyLabel.text = @"暂无数据!";
    
    self.yzrEmptyLabel.textColor = [UIColor lightGrayColor];
    
    self.yzrEmptyLabel.font = [UIFont systemFontOfSize:20];
    
    self.yzrEmptyLabel.textAlignment = NSTextAlignmentCenter;
    
    self.yzrEmptyImageView.hidden = YES;
    
    self.yzrEmptyLabel.hidden = YES;
    
    self.zrgzButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    self.zrgzButton.frame = CGRectMake(220 * KWIDTH, 25 * KHEIGHT, 80 * KWIDTH, 30 * KHEIGHT);
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:self.zrgzButton];
    
    self.navigationItem.rightBarButtonItem = rightItem;
    
    self.zrgzButton.titleLabel.font = [UIFont systemFontOfSize:16 * KWIDTH];
    
    self.zrgzButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    
    [self.zrgzButton setTitle:@"转让规则" forState:UIControlStateNormal];
    
    [self.zrgzButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    [self.zrgzButton addTarget:self action:@selector(zrgzButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
}

/**
 * 选择按钮的点击事件
 */
- (void)btnClicked:(UIButton *)button {
    
    if (button.tag == 100000) {
        
        if (self.kzrBtn.selected != YES) {
            
            [self.kzrBtn setTitleColor:[XXColor goldenColor] forState:UIControlStateNormal];
            
            self.line1View.backgroundColor = [XXColor goldenColor];
            
            [self.zrzBtn setTitleColor:[UIColor colorWithRed:47 / 255.0 green:55 / 255.0 blue:85 / 255.0 alpha:1.0] forState:UIControlStateNormal];
            [self.yzrBtn setTitleColor:[UIColor colorWithRed:47 / 255.0 green:55 / 255.0 blue:85 / 255.0 alpha:1.0] forState:UIControlStateNormal];
            
            self.line2View.backgroundColor = [UIColor clearColor];
            self.line3View.backgroundColor = [UIColor clearColor];
            
            self.zrzBtn.selected = NO;
            self.yzrBtn.selected = NO;
            
            [self kZRTableViewHeaderRefreshing];
            
            self.scrollView.contentOffset = CGPointMake(0, 0);
        }
        
        
    }else if (button.tag == 200000) {
        
        if (self.zrzBtn.selected != YES) {
            
            [self.zrzBtn setTitleColor:[XXColor goldenColor] forState:UIControlStateNormal];
            
            self.line2View.backgroundColor = [XXColor goldenColor];
            
            [self.kzrBtn setTitleColor:[UIColor colorWithRed:47 / 255.0 green:55 / 255.0 blue:85 / 255.0 alpha:1.0] forState:UIControlStateNormal];
            [self.yzrBtn setTitleColor:[UIColor colorWithRed:47 / 255.0 green:55 / 255.0 blue:85 / 255.0 alpha:1.0] forState:UIControlStateNormal];
            
            self.line1View.backgroundColor = [UIColor clearColor];
            self.line3View.backgroundColor = [UIColor clearColor];
            
            self.kzrBtn.selected = NO;
            self.yzrBtn.selected = NO;
            
            [self zRZTableViewHeaderRefreshing];
            
            self.scrollView.contentOffset = CGPointMake(self.view.frame.size.width, 0);
        }
        
    }else if (button.tag == 300000) {
        
        if (self.yzrBtn.selected != YES) {
            
            [self.yzrBtn setTitleColor:[XXColor goldenColor] forState:UIControlStateNormal];
            
            self.line3View.backgroundColor = [XXColor goldenColor];
            
            [self.kzrBtn setTitleColor:[UIColor colorWithRed:47 / 255.0 green:55 / 255.0 blue:85 / 255.0 alpha:1.0] forState:UIControlStateNormal];
            
            [self.zrzBtn setTitleColor:[UIColor colorWithRed:47 / 255.0 green:55 / 255.0 blue:85 / 255.0 alpha:1.0] forState:UIControlStateNormal];
            
            self.line1View.backgroundColor = [UIColor clearColor];
            
            self.line2View.backgroundColor = [UIColor clearColor];
            
            self.zrzBtn.selected = NO;
            
            self.kzrBtn.selected = NO;
            
            [self yZRTableViewHeaderRefreshing];
            
            self.scrollView.contentOffset = CGPointMake(self.view.frame.size.width * 2, 0);
        }
        
    }
    
    
}



- (void)zrgzButtonClicked:(UIButton *)button {
    
    ZRGZ_ViewController *zrgz = [[ZRGZ_ViewController alloc] init];
    
    [self.navigationController pushViewController:zrgz animated:YES];
    
}


#pragma mark segment的点击事件
/**
 * segment的点击事件
 */
-(void)segmentAction:(UISegmentedControl *)segment{
    
    switch (segment.selectedSegmentIndex) {
            
        case 0:
            
            [self.kZRTableView headerBeginRefreshing];
            
            
            self.scrollView.contentOffset = CGPointMake(0, 0);
            
            break;
            
        case 1:
            
            [self.zRZTableView headerBeginRefreshing];
            
            self.scrollView.contentOffset = CGPointMake(self.view.frame.size.width, 0);
            
            break;
            
        case 2:
            
            [self.yZRTableView headerBeginRefreshing];
            
            self.scrollView.contentOffset = CGPointMake(self.view.frame.size.width * 2, 0);
            
        default:
            break;
    }
    
}


/**
 * 加载可转让的数据
 */
- (void)KZRDataHandle {
    
    NSString *body = [NSString stringWithFormat:@"sid=%@&page=%d", self.sid, (int)self.kzrPage];
    
    NSString *url = [NSString stringWithFormat:@"%@%@", HOSTURL, KZR];
    
    [VVNetWorkTool postWithUrl:url body:body bodyType:BodyTypeString httpHeader:nil responseType:0 progress:^(NSProgress *progress) {
        
    } success:^(id result) {
        
        self.kzrOrdersArr = [result objectForKey:@"orders"];
        
        for (NSDictionary *dic in self.kzrOrdersArr) {
            
            ZQZRModel *model = [[ZQZRModel alloc] init];
            
            [model setValuesForKeysWithDictionary:dic];
            
            [self.kzrArr addObject:model];
        }
        
        if (self.kzrArr.count > 0) {
            
            [self.kZRTableView reloadData];
            
        }
        
        if (self.kzrArr.count == 0) {
            
            self.kzrEmptyImageView.hidden = NO;
            
            self.kzrEmptyLabel.hidden = NO;
            
        }else{
            
            self.kzrEmptyImageView.hidden = YES;
            
            self.kzrEmptyLabel.hidden = YES;
        }
           } fail:^(NSError *error) {
           
           }];
    
}


/**
 * XXXXXX
 */
- (void)ZRZDataHandle {
    
    NSString *body = [NSString stringWithFormat:@"sid=%@&page=%d", self.sid, (int)self.zrzPage];
    
    NSString *url = [NSString stringWithFormat:@"%@%@", HOSTURL, ZRZ];
    
    [VVNetWorkTool postWithUrl:url body:body bodyType:BodyTypeString httpHeader:nil responseType:0 progress:^(NSProgress *progress) {
        
    } success:^(id result) {
        
        self.zrzOrdersArr = [result objectForKey:@"orders"];
        
        for (NSDictionary *dic in self.zrzOrdersArr) {
            
            ZRZmodel *model = [[ZRZmodel alloc] init];
            
            [model setValuesForKeysWithDictionary:dic];
            
            [self.zrzArr addObject:model];
        }
        
        if (self.zrzArr.count > 0) {
            
            [self.zRZTableView reloadData];
        }
        
        if (self.zrzArr.count == 0) {
            
            self.zrzEmptyImageView.hidden = NO;
            
            self.zrzEmptyLabel.hidden = NO;
            
        }else{
            
            self.zrzEmptyImageView.hidden = YES;
            
            self.zrzEmptyLabel.hidden = YES;
        }
       
           } fail:^(NSError *error) {
               
    }];
    
}


/**
 * XXXXXX
 */
- (void)YZRDataHandle {
    
    NSString *body = [NSString stringWithFormat:@"sid=%@&page=%d", self.sid, (int)self.yzrPage];
    
    NSString *url = [NSString stringWithFormat:@"%@%@", HOSTURL, YZR];
    
    [VVNetWorkTool postWithUrl:url body:body bodyType:BodyTypeString httpHeader:nil responseType:0 progress:^(NSProgress *progress) {
        
    } success:^(id result) {
        
        self.yzrOrdersArr = [result objectForKey:@"orders"];
        
        for (NSDictionary *dic in self.yzrOrdersArr) {
            
            YZRModel *model = [[YZRModel alloc] init];
            
            [model setValuesForKeysWithDictionary:dic];
            
            [self.yzrArr addObject:model];
        }
        
        if (self.yzrArr.count > 0) {
            
            [self.yZRTableView reloadData];
        }
        
        if (self.yzrArr.count == 0) {
            
            self.yzrEmptyImageView.hidden = NO;
            
            self.yzrEmptyLabel.hidden = NO;
            
        }else{
            
            self.yzrEmptyImageView.hidden = YES;
            
            self.yzrEmptyLabel.hidden = YES;
        }
        
            } fail:^(NSError *error) {
                
    }];
    
}

#pragma mark - 可转让
/**
 * 创建可转让的TableView
 */
- (void)createKZRtableView {
    
    self.kZRTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 375 * KWIDTH, [UIScreen mainScreen].bounds.size.height - 64 - 55 * KHEIGHT) style:UITableViewStyleGrouped];
    
    [self.scrollView addSubview:self.kZRTableView];
    
    self.kZRTableView.tag = 10000;
    
    self.kZRTableView.delegate = self;
    
    self.kZRTableView.dataSource = self;
    
    self.kZRTableView.rowHeight = 150 * KHEIGHT;
    
    [self.kZRTableView addHeaderWithTarget:self action:@selector(kZRTableViewHeaderRefreshing)];
    
    [self.kZRTableView addFooterWithTarget:self action:@selector(kZRTableViewFooterRefreshing)];
    
}

/**
 * 可转让界面上拉加载数据
 */
- (void)kZRTableViewHeaderRefreshing {
    
    self.kzrPage = 1;
    
    [self kZRTableViewRefreshing];
}

/**
 * 可转让界面下拉加载数据
 */
- (void)kZRTableViewFooterRefreshing {
    
    self.kzrPage ++;
    
    [self kZRTableViewRefreshing];
}

/**
 * 可转让界面加载数据
 */
- (void)kZRTableViewRefreshing {
    
    if (self.kzrPage == 1) {
        
        [self.kzrArr removeAllObjects];
    }
    
    NSString *body = [NSString stringWithFormat:@"sid=%@&page=%d", self.sid, (int)self.kzrPage];
    
    NSString *url = [NSString stringWithFormat:@"%@%@", HOSTURL, KZR];
    
    [VVNetWorkTool postWithUrl:url body:body bodyType:BodyTypeString httpHeader:nil responseType:0 progress:^(NSProgress *progress) {
        
    } success:^(id result) {
        
        self.kzrOrdersArr = [result objectForKey:@"orders"];
        
        for (NSDictionary *dic in self.kzrOrdersArr) {
            
            ZQZRModel *model = [[ZQZRModel alloc] init];
            
            [model setValuesForKeysWithDictionary:dic];
            
            [self.kzrArr addObject:model];
        }
        
        if (self.kzrArr.count > 0) {
            
            [self.kZRTableView reloadData];
        }
        
        if (self.kzrArr.count == 0) {
            
            self.kzrEmptyImageView.hidden = NO;
            
            self.kzrEmptyLabel.hidden = NO;
            
        }else{
            
            self.kzrEmptyImageView.hidden = YES;
            
            self.kzrEmptyLabel.hidden = YES;
        }
        
        [self.kZRTableView headerEndRefreshing];
        [self.kZRTableView footerEndRefreshing];
        
            } fail:^(NSError *error) {
    }];
    
}


#pragma mark - 转让中
/**
 * 创建转让中的TableView
 */
- (void)createZRZtableView {
    
    self.zRZTableView = [[UITableView alloc] initWithFrame:CGRectMake(self.view.frame.size.width, 0, 375 * KWIDTH, [UIScreen mainScreen].bounds.size.height - 64 - 55 * KHEIGHT) style:UITableViewStyleGrouped];
    
    [self.scrollView addSubview:self.zRZTableView];
    
    self.zRZTableView.tag = 20000;
    
    self.zRZTableView.delegate = self;
    
    self.zRZTableView.dataSource = self;
    
    self.zRZTableView.rowHeight = 177 * KHEIGHT;
    
    [self.zRZTableView addHeaderWithTarget:self action:@selector(zRZTableViewHeaderRefreshing)];
    
    [self.zRZTableView addFooterWithTarget:self action:@selector(zRZTableViewFooterRefreshing)];
    
}

/**
 * 转让中界面上拉加载数据
 */
- (void)zRZTableViewHeaderRefreshing {
    
    self.zrzPage = 1;
    
    [self zRZTableViewRefreshing];
}

/**
 * 转让中界面下拉加载数据
 */
- (void)zRZTableViewFooterRefreshing {
    
    self.zrzPage ++;
    
    [self zRZTableViewRefreshing];
}


/**
 * 加载转让中的数据
 */
- (void)zRZTableViewRefreshing {
    
    if (self.zrzPage == 1) {
        
        [self.zrzArr removeAllObjects];
    }
    
    NSString *body = [NSString stringWithFormat:@"sid=%@&page=%d", self.sid, (int)self.zrzPage];
    
    NSString *url = [NSString stringWithFormat:@"%@%@", HOSTURL, ZRZ];
    
    [VVNetWorkTool postWithUrl:url body:body bodyType:BodyTypeString httpHeader:nil responseType:0 progress:^(NSProgress *progress) {
        
    } success:^(id result) {
        
        self.zrzOrdersArr = [result objectForKey:@"orders"];
        
        for (NSDictionary *dic in self.zrzOrdersArr) {
            
            ZRZmodel *model = [[ZRZmodel alloc] init];
            
            [model setValuesForKeysWithDictionary:dic];
            
            [self.zrzArr addObject:model];
        }
        
        if (self.zrzArr.count > 0) {
            
            [self.zRZTableView reloadData];
        }
        
        if (self.zrzArr.count == 0) {
            
            self.zrzEmptyImageView.hidden = NO;
            
            self.zrzEmptyLabel.hidden = NO;
            
        }else{
            
            self.zrzEmptyImageView.hidden = YES;
            
            self.zrzEmptyLabel.hidden = YES;
        }
        
        [self.zRZTableView headerEndRefreshing];
        [self.zRZTableView footerEndRefreshing];
          } fail:^(NSError *error) {
          }];
}



#pragma mark - 已转让
/**
 * 创建已转让的TableView
 */
- (void)createYZRtableView {
    
    self.yZRTableView = [[UITableView alloc] initWithFrame:CGRectMake(self.view.frame.size.width * 2, 0, 375 * KWIDTH, [UIScreen mainScreen].bounds.size.height - 64 - 55 * KHEIGHT) style:UITableViewStyleGrouped];
    
    [self.scrollView addSubview:self.yZRTableView];
    
    self.yZRTableView.tag = 30000;
    
    self.yZRTableView.delegate = self;
    
    self.yZRTableView.dataSource = self;
    
    self.yZRTableView.rowHeight = 120 * KHEIGHT;
    
    [self.yZRTableView addHeaderWithTarget:self action:@selector(yZRTableViewHeaderRefreshing)];
    
    [self.yZRTableView addFooterWithTarget:self action:@selector(yZRTableViewFooterRefreshing)];
    
}

/**
 * 已转让界面上拉加载数据
 */
- (void)yZRTableViewHeaderRefreshing {
    
    self.yzrPage = 1;
    
    [self yZRTableViewRefreshing];
}

/**
 * 已转让界面下拉加载数据
 */
- (void)yZRTableViewFooterRefreshing {
    
    self.yzrPage ++;
    
    [self yZRTableViewRefreshing];
}

/**
 * 加载已转让界面的数据
 */
- (void)yZRTableViewRefreshing {
    
    if (self.yzrPage == 1) {
        
        [self.yzrArr removeAllObjects];
    }
    
    NSString *body = [NSString stringWithFormat:@"sid=%@&page=%d", self.sid, (int)self.yzrPage];
    
    NSString *url = [NSString stringWithFormat:@"%@%@", HOSTURL, YZR];
    
    [VVNetWorkTool postWithUrl:url body:body bodyType:BodyTypeString httpHeader:nil responseType:0 progress:^(NSProgress *progress) {
        
    } success:^(id result) {
        
        self.yzrOrdersArr = [result objectForKey:@"orders"];
        
        for (NSDictionary *dic in self.yzrOrdersArr) {
            
            YZRModel *model = [[YZRModel alloc] init];
            
            [model setValuesForKeysWithDictionary:dic];
            
            [self.yzrArr addObject:model];
        }
        
        if (self.yzrArr.count > 0) {
            
            [self.yZRTableView reloadData];
        }
        
        if (self.yzrArr.count == 0) {
            
            self.yzrEmptyImageView.hidden = NO;
            
            self.yzrEmptyLabel.hidden = NO;
            
        }else{
            
            self.yzrEmptyImageView.hidden = YES;
            
            self.yzrEmptyLabel.hidden = YES;
        }
        
        [self.yZRTableView headerEndRefreshing];
        [self.yZRTableView footerEndRefreshing];
        
    } fail:^(NSError *error) {
              
    }];
    
}


/**
 * XXXXXX
 */
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    if (tableView.tag == 10000) {
        
        if (self.kzrArr.count > 0) {
            
            return self.kzrArr.count;
            
        }else{
            
            return 0;
            
        }
    }else if (tableView.tag == 20000){
        
        if (self.zrzArr.count > 0) {
            
            return self.zrzArr.count;
            
        }else{
            
            return 0;
        }
        
    }else{
        
        if (self.yzrArr.count > 0) {
            
            return self.yzrArr.count;
            
        }else{
            
            return 0;
        }
    }
    
}

/**
 * XXXXXX
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 1;
}

/**
 * XXXXXX
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (tableView.tag == 10000) {
        
        KZRTableViewCell *kzrCell = [tableView dequeueReusableCellWithIdentifier:@"KZRTableViewCell"];
        
        if (!kzrCell) {
            
            kzrCell = [[KZRTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"KZRTableViewCell"];
        }
        
        if (self.kzrArr.count > 0) {
            
            kzrCell.model = [self.kzrArr objectAtIndex:indexPath.section];
            
        }
        
        self.xiangmuBJ = kzrCell.model.tender_amount;
        
        kzrCell.zhuanRangButton.tag = indexPath.section + 90000;
        
        [kzrCell.zhuanRangButton addTarget:self action:@selector(zhuanRangButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        
        [kzrCell setSelectionStyle:UITableViewCellSelectionStyleNone];
        
        return kzrCell;
        
    }else if (tableView.tag == 20000){
        
        ZRZTableViewCell *zrzCell = [tableView dequeueReusableCellWithIdentifier:@"ZRZTableViewCell"];
        
        if (!zrzCell) {
            
            zrzCell = [[ZRZTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ZRZTableViewCell"];
        }
        
        zrzCell.zhuanRangLabel.text = @"转让中";
        
        zrzCell.zhuanRangJGLabel.text = @"转让价格";
        
        zrzCell.yuQiSYLabel.text = @"年化收益率";
        
        zrzCell.shengYuQXLabel.text = @"项目期限";
        
        zrzCell.zhuanRangGPRQLabel.text = @"转让挂牌日期";
        
        zrzCell.zhuanRangXJRQLabel.text = @"转让下架日期";
        
        if (self.zrzArr.count > 0) {
            
            zrzCell.model = [self.zrzArr objectAtIndex:indexPath.section];
        }
        
        [zrzCell setSelectionStyle:UITableViewCellSelectionStyleNone];
        
        return zrzCell;
        
    }else{
        
        YZRTableViewCell *yzrCell = [tableView dequeueReusableCellWithIdentifier:@"YZRTableViewCell"];
        
        if (!yzrCell) {
            
            yzrCell = [[YZRTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"YZRTableViewCell"];
        }
        
        yzrCell.productStateLabel.text = @"已转让";
        
        yzrCell.dateTitleLabel.text = @"转让日期";
        
        yzrCell.priceTitleLabel.text = @"转让价格";
        
        if (self.yzrArr.count > 0) {
            
            yzrCell.model = [self.yzrArr objectAtIndex:indexPath.section];
            
        }
        
        [yzrCell setSelectionStyle:UITableViewCellSelectionStyleNone];
        
        return yzrCell;
    }
}


#pragma mark 转让button
/**
 * button
 */
- (void)zhuanRangButtonClicked:(UIButton *)button {
    
    ZRGZViewController *zrgz = [[ZRGZViewController alloc] init];
    
    zrgz.sid = self.sid;
    
    zrgz.xiangmuBJ = self.xiangmuBJ;
    
    UIBarButtonItem *backIetm = [[UIBarButtonItem alloc] init];
    
    backIetm.title = @"返回";
    
    self.navigationItem.backBarButtonItem = backIetm;
    
    ZQZRModel *model = [[ZQZRModel alloc] init];
    
    if (self.kzrArr.count > 0) {
        
        model = [self.kzrArr objectAtIndex:button.tag - 90000];
        
        zrgz.tender_from = model.tender_from;
        
        zrgz.oid_tender_id = [NSString stringWithFormat:@"%@", model.oid_tender_id];
        
        zrgz.pageTag = @"1";
        
        [self.navigationController pushViewController:zrgz animated:YES];
    }
    
}

/**
 * XXXXXX
 */
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return KHEIGHT * 7;
}

/**
 * XXXXXX
 */
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    return 1;
}

@end
