//
//  PopView.m
//  mingjieloan
//
//  Created by 杜虹锋 on 2016/12/25.
//  Copyright © 2016年 mingjie. All rights reserved.
//

#import "PopView.h"

@implementation PopView
    
    
- (id)initWithFrame:(CGRect)frame
    {
        self = [super initWithFrame:frame];
        if (self) {
            // Initialization code
            _innerView = [UIView new];
            _innerView.frame = frame;
            _innerView.backgroundColor = GetColor(@"#ffffff");
            [self addSubview:_innerView];
            [self createViews];
        }
        return self;
    }
    
    
+ (instancetype)defaultPopupView{
    return [[PopView alloc]initWithFrame:CGRectMake(0, 0, kWIDTH - 47 * 2, 400)];
}
    
- (void)dismissAction:(id)sender{
    [_parentVC lew_dismissPopupView];
}
    
- (void)createViews{
//    self.picView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, FitWidth - 47 * 2, 290)];
//    [_picView sd_setImageWithURL:_imgUrlArray[0]];
//    [_innerView addSubview:_picView];
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kWIDTH - 47 * 2, 400) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_innerView addSubview:_tableView];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return  400;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSLog(@"%lu", (unsigned long)_imgUrlArray.count);
    return _imgUrlArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"PopViewCell";
    PopViewTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[PopViewTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    cell.backgroundColor = [UIColor whiteColor];
    if (_imgUrlArray.count > 0) {
        NSLog(@"%@", _imgUrlArray[indexPath.row]);
        [cell.imgView sd_setImageWithURL:_imgUrlArray[indexPath.row]];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)setImgUrlArray:(NSMutableArray *)imgUrlArray{
    _imgUrlArray = imgUrlArray;
    [self.tableView reloadData];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
