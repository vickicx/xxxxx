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
    [self addHeader];
    [self addFooter];
    [self getCard];
}

- (void)createTableView {
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.showsHorizontalScrollIndicator = NO;
    self.tableView.showsVerticalScrollIndicator = NO;
    
    [self.view addSubview:self.tableView];
}
#pragma tableView DataSource Delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 0;
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
    return 70*FitHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MyCardTableViewCell *cell = [[MyCardTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    if (!cell) {
        cell = [[MyCardTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[NSString stringWithFormat:@"%ldcell",indexPath.row]];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
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
        
    } fail:^(NSError *error) {
        
    }];
}

- (void)addHeader {
    WeakObj(self);
    [self.tableView addHeaderWithCallback:^{
        
    }];
}

- (void)addFooter {
    WeakObj(self);
    [self.tableView addFooterWithCallback:^{
        
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
