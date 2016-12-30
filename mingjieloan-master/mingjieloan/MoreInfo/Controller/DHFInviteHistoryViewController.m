//
//  DHFInviteHistoryViewController.m
//  mingjieloan
//
//  Created by kang on 16/12/29.
//  Copyright © 2016年 mingjie. All rights reserved.
//

#import "DHFInviteHistoryViewController.h"

@interface DHFInviteHistoryViewController ()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation DHFInviteHistoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIBarButtonItem *backbutton = [[UIBarButtonItem alloc]init];
    backbutton.title = @"返回";
    self.navigationItem.backBarButtonItem = backbutton;
    self.title = @"邀请记录";
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kWIDTH, kHEIGHT) style:UITableViewStylePlain];
    _tableView.separatorStyle = UITableViewCellAccessoryNone;
    _tableView.backgroundColor = GetColor(@"#EAE9EF");
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellIdentifier = @"MoreCell";
    DHFInviteHistoryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[DHFInviteHistoryTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return  cell;
    
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
