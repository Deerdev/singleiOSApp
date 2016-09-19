//
//  SecondViewController.m
//  singleiOSApp
//
//  Created by app on 16/8/29.
//  Copyright © 2016年 app. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController () <UITableViewDataSource, UITableViewDelegate>

//@property (strong, nonatomic) NSMutableArray *tableCellTextList;
@property (strong, nonatomic) NSMutableArray *tableCellTextList;
@property (strong, nonatomic) NSMutableArray *tableCellTextList2;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self setTitle:@"Page two"];
    
    //初始化数组
    _tableCellTextList = [[NSMutableArray alloc] init];
    for (int i=0; i < 25; ++i) {
        NSString *textStr = [NSString stringWithFormat:@"line %d", i];
        [_tableCellTextList addObject:textStr];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//返回列表行数
- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section{
    return [_tableCellTextList count];
}

// 设置Cell
- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [[UITableViewCell alloc]
                               initWithStyle:UITableViewCellStyleValue1
                             reuseIdentifier:nil];
    //设置cell标题
    cell.textLabel.text = _tableCellTextList[indexPath.row];
    //设置cell副标题
    cell.detailTextLabel.text = @"Page two";
    return cell;
}

//设置cell点击事件
- (void)tableView:(UITableView *)tableView
    didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark -
#pragma mark setCellEdit
//允许cell左滑
- (BOOL)tableView:(UITableView *)tableView
    canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return true;
}

//设置cell左滑按钮
- (NSString *)tableView:(UITableView *)tableView
    titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath {
    return @"Delete";
}

//点击左滑按钮事件
- (void)tableView:(UITableView *)tableView
    commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
     forRowAtIndexPath:(NSIndexPath *)indexPath {
    [_tableCellTextList removeObjectAtIndex:indexPath.row];
    //删除指定的cell
    [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]
                     withRowAnimation:UITableViewRowAnimationRight];
}

@end
