//
//  MyCardViewController.m
//  mingjieloan
//
//  Created by 王好帅 on 2017/1/4.
//  Copyright © 2017年 mingjie. All rights reserved.
//

#import "MyCardViewController.h"
#import "MyCardTableViewCell.h"


@implementation MyCardViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title  = @"我的卡券";
    self.status = @"1";
    self.page   = 1;
    [self createTableView];
    [self createView];
    [self addHeader];
    [self addFooter];
    [self getCard];
}

- (void)createView {
    
    self.lineView                 = [[UIView alloc] initWithFrame:CGRectMake(kWIDTH / 12, 35 * FitHeight, kWIDTH / 6, 2 * FitHeight)];
    self.lineView.backgroundColor = [XXColor goldenColor];
    
    NSArray *array = @[@"未使用",@"已使用",@"已过期"];
    for (int i = 0; i < 3; i++) {
        UIButton *button        = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setTitle:array[i] forState:UIControlStateNormal];
        button.frame            = CGRectMake(0 + i * kWIDTH / 3, 0, kWIDTH / 3, 35*FitHeight);
        button.titleLabel.font  = RealFont(14);
        button.tag              = 10000 + i;
        [button addTarget:self action:@selector(selectCardType:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
    }
    [self.view addSubview:self.lineView];
    
    self.emptyImageView = [[UIImageView alloc] initWithFrame:CGRectMake(kWIDTH/ 2 -83*FitWidth, 270 * FitHeight - 64, 165 * FitWidth, 110 * FitHeight)];
    
    [self.tableView addSubview:self.emptyImageView];
    
    self.emptyImageView.image = [UIImage imageNamed:@"empty"];
    
    self.emptyLabel = [[UILabel alloc] initWithFrame:CGRectMake(kWIDTH/2 -105*FitWidth , 280 * FitHeight + self.emptyImageView.frame.size.height - 64, 210 * FitWidth, 40 * FitHeight)];
    
    [self.tableView addSubview:self.emptyLabel];
    
    self.emptyLabel.text = @"暂无数据!";
    
    self.emptyLabel.textColor = [UIColor lightGrayColor];
    
    self.emptyLabel.font = [UIFont systemFontOfSize:20];
    
    self.emptyLabel.textAlignment = NSTextAlignmentCenter;
    
    self.emptyImageView.hidden = YES;
    
    self.emptyLabel.hidden = YES;
}

- (void)selectCardType:(UIButton *)button {
    if (button.tag == 10000) {
        [button setTitleColor:[XXColor goldenColor] forState:UIControlStateNormal];
        UIButton *button1 = [self.view viewWithTag:10001];
        [button1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        UIButton *button2 = [self.view viewWithTag:10002];
        [button2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.lineView.frame = CGRectMake(kWIDTH / 12 , 30 * FitHeight, kWIDTH / 6, 2 * FitHeight);
        self.status = @"1";
        [self getCard];
    }
    if (button.tag == 10001) {
        [button setTitleColor:[XXColor goldenColor] forState:UIControlStateNormal];
        UIButton *button1 = [self.view viewWithTag:10000];
        [button1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        UIButton *button2 = [self.view viewWithTag:10002];
        [button2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.lineView.frame = CGRectMake(kWIDTH / 12 + kWIDTH / 3, 30 * FitHeight, kWIDTH / 6, 2 * FitHeight);
        self.status = @"2";
        [self getCard];
    }
    if (button.tag == 10002) {
        [button setTitleColor:[XXColor goldenColor] forState:UIControlStateNormal];
        UIButton *button1 = [self.view viewWithTag:10001];
        [button1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        UIButton *button2 = [self.view viewWithTag:10000];
        [button2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.lineView.frame = CGRectMake(kWIDTH / 12 + 2 * kWIDTH / 3, 30 * FitHeight, kWIDTH / 6, 2 * FitHeight);
        self.status = @"99";
        [self getCard];
    }
}

- (void)createTableView {
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 37*FitHeight, self.view.width, self.view.height- 37*FitHeight - 64*FitHeight) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.showsHorizontalScrollIndicator = NO;
    self.tableView.showsVerticalScrollIndicator = NO;
    
    [self.view addSubview:self.tableView];
}
#pragma tableView DataSource Delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 120*FitHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MyCardTableViewCell *cell = [[MyCardTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    
    if (!cell) {
        cell = [[MyCardTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[NSString stringWithFormat:@"%ldcell",indexPath.row]];
    }
    cell.model = self.dataSource[indexPath.row];
    cell.delegate = self;
    
    return cell;
}

- (void)useCard {
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}



- (void)getCard {
    
    NSMutableArray *mutableArr = [NSMutableArray arrayWithCapacity:0];
    NSDictionary *dic = @{
                          @"sid":[[NSUserDefaults standardUserDefaults] objectForKey:@"sid"],
                          @"status":self.status,
                          @"page":[NSString stringWithFormat:@"%d",self.page]
                          };
    [VVNetWorkTool postWithUrl:Url(MYCASH) body:dic bodyType:BodyTypeDictionary httpHeader:nil responseType:0 progress:^(NSProgress *progress) {
        
    } success:^(id result) {
        NSArray *array = result[@"cash"][@"items"];
        for (NSDictionary *dic in array) {
            self.model = [[MyCardModel alloc] initWithDictionary:dic];
            [mutableArr addObject:self.model];
        }
        self.dataSource = [NSArray arrayWithArray:mutableArr];
        [self.tableView reloadData];
        [self.tableView headerEndRefreshing];
        [self.tableView footerEndRefreshing];
        
        if (self.dataSource.count > 0) {
            self.emptyLabel.hidden = true;
            self.emptyImageView.hidden = true;
        } else {
            self.emptyImageView.hidden = false;
            self.emptyLabel.hidden = FALSE;
        }
        
    } fail:^(NSError *error) {
        
    }];
}

- (void)addHeader {
    WeakObj(self);
    self.page = 1;
    [self.tableView addHeaderWithCallback:^{
        [selfWeak getCard];
    }];
}

- (void)addFooter {
    WeakObj(self);
    self.page ++;
    [self.tableView addFooterWithCallback:^{
        [selfWeak getCard];
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
