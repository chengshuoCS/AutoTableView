//
//  ViewController.m
//  AutoTableView
//
//  Created by 郭顺 on 15/8/11.
//  Copyright (c) 2015年 hnzdkj. All rights reserved.
//

#import "ViewController.h"
#import "UITableView+FDTemplateLayoutCell.h"


@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>{
    NSMutableArray *m_datas;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _stdCell = [[AutoCellTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"std"];
    [self setDatas];
    _tableView = [[UITableView alloc]init];
    _tableView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:_tableView];
    NSLayoutConstraint *left = [NSLayoutConstraint constraintWithItem:_tableView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0];
    NSLayoutConstraint *right = [NSLayoutConstraint constraintWithItem:_tableView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1.0 constant:0];
    NSLayoutConstraint *top = [NSLayoutConstraint constraintWithItem:_tableView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:20];
    NSLayoutConstraint *bottom = [NSLayoutConstraint constraintWithItem:_tableView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0];
    [self.view addConstraints:@[left,right,top,bottom]];
    
    [_tableView registerClass:[AutoCellTableViewCell class] forCellReuseIdentifier:@"cell"];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.rowHeight = UITableViewAutomaticDimension;
    _tableView.estimatedRowHeight = 70.0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)setDatas{
    m_datas = [[NSMutableArray alloc]initWithCapacity:10];
    [m_datas addObject:@"内容1:主要是测试现有的发公告中的署名和选择机构的问题."];
    [m_datas addObject:@"内容2:今天郭哥把署名不正确的改好了对郭哥改的进行了查看已经理解了改正的原因,之前之所以没有自己改是因为自己对这段数据库的存储具有不明确感,所以不敢轻易尝试改动.还有就是权限的问题老师不可以发公告只有老师身份的才能发公告。"];
    [m_datas addObject:@"内容3:把轮播图封装了目前还差一个定时器,加上定时器的话那么就完成了轮播图。"];
    [m_datas addObject:@"内容4"];
    [m_datas addObject:@"内容5"];
    [m_datas addObject:@"内容6"];
    [m_datas addObject:@"内容7"];
    [m_datas addObject:@"内容8"];
    [m_datas addObject:@"内容9"];
    [m_datas addObject:@"内容10"];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [m_datas count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *identifier = @"cell";
    AutoCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[AutoCellTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    NSDictionary *model = @{@"text":[m_datas objectAtIndex:indexPath.row]};
    cell.model = model;
    [cell setNeedsUpdateConstraints];
    [cell updateConstraintsIfNeeded];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
#ifdef __IPHONE_8_0
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0) {
        return UITableViewAutomaticDimension;
    } else {
        return [tableView fd_heightForCellWithIdentifier:@"cell" configuration:^(AutoCellTableViewCell *cell) {
            NSDictionary *model = @{@"text":[m_datas objectAtIndex:indexPath.row]};
            cell.model = model;
        }];
    }
#else
    return [tableView fd_heightForCellWithIdentifier:@"cell" configuration:^(AutoCellTableViewCell *cell) {
        NSDictionary *model = @{@"text":[m_datas objectAtIndex:indexPath.row]};
        cell.model = model;
    }];
#endif
    
}
@end
