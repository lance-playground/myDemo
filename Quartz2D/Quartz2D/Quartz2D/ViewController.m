//
//  ViewController.m
//  Quartz2D
//
//  Created by macbook on 16/11/29.
//  Copyright © 2016年 macbook. All rights reserved.
//

#import "ViewController.h"
#import "BaseGraphViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
// tableView
@property (nonatomic,strong) UITableView *tableView;
// listArray
@property (nonatomic,strong) NSArray *listArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.tableView];
    
    [self.tableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.listArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"identifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:ID];
    }
    cell.textLabel.text = self.listArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        BaseGraphViewController *baseGraph = [[BaseGraphViewController alloc] init];
        [self.navigationController pushViewController:baseGraph animated:YES];
    }
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:(UITableViewStylePlain)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

- (NSArray *)listArray {
    if (!_listArray) {
        _listArray = [[NSArray alloc] init];
        _listArray = @[@"基本图形绘制"];
    }
    return _listArray;
}
@end
