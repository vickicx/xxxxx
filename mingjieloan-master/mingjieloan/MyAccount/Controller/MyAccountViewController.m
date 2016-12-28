//
//  MyAccountViewController.m
//  mingjieloan
//
//  Created by vicki on 2016/12/20.
//  Copyright © 2016年 vicki. All rights reserved.
//

#import "MyAccountViewController.h"

@interface MyAccountViewController ()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation MyAccountViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = [[NSUserDefaults standardUserDefaults] objectForKey:@"username"];
    [self initTableView];
    
    // Do any additional setup after loading the view.
}

- (void)getMyInfo {
    NSString *bodyStr = [NSString stringWithFormat:@"%@"];
}

- (void)initTableView{
    self.MyAccountTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kWIDTH, kHEIGHT - 45) style:UITableViewStylePlain];
    _MyAccountTableView.separatorStyle = UITableViewCellAccessoryNone;
    _MyAccountTableView.delegate = self;
    _MyAccountTableView.dataSource = self;
    
    [self.view addSubview:_MyAccountTableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0)
    {
        return 135*FitHeight;
    }else {
        return 50;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        AccTopTableViewCell *cell = [[AccTopTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return  cell;
    }else {
        AccTopTableViewCell *cell = [[AccTopTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
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
