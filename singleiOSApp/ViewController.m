//
//  ViewController.m
//  singleiOSApp
//
//  Created by app on 16/8/25.
//  Copyright © 2016年 app. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) NSMutableArray *tableCellTextList;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _tableCellTextList = [[NSMutableArray alloc] init];
    for (int i=0; i < 25; ++i) {
        NSString *textStr = [NSString stringWithFormat:@"this is line %d", i];
        [_tableCellTextList addObject:textStr];
    }
    
    self.tableView = [[UITableView alloc]
                      initWithFrame:self.view.bounds
                      style:UITableViewStylePlain];
    self.tableView.delegate   = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
    self.navigationItem.title = @"Page one";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]
                                              initWithTitle:@"Page2"
                                              style:UIBarButtonItemStyleDone
                                              target:self
                                              action:@selector(changeToPage2)];
    self.navigationItem.leftBarButtonItem  = [[UIBarButtonItem alloc]
                                             initWithTitle:@"Page3"
                                             style:UIBarButtonItemStyleDone
                                             target:self
                                             action:@selector(changeToPage3)];
    

}

- (void)changeToPage2{
    SecondViewController *secondViewController = [[SecondViewController alloc]
                                                  init];
    [self.navigationController pushViewController:secondViewController
                                         animated:YES];
}

- (void)changeToPage3{
    ThirdViewController *thirdViewController = [[ThirdViewController alloc]init];
    [self.navigationController pushViewController:thirdViewController
                                         animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section{
    return [_tableCellTextList count];
}

// 设置Cell
- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc]init];
    //设置cell的标题
    cell.textLabel.text = _tableCellTextList[indexPath.row];
    return cell;
}

//设置cell点击事件
- (void)tableView:(UITableView *)tableView
    didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

//允许cell左滑
- (BOOL)tableView:(UITableView *)tableView
    canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return true;
}

//设置左滑按钮
- (NSString *)tableView:(UITableView *)tableView
titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath{
    return @"Delete";
}

//点击按钮时事件
- (void)tableView:(UITableView *)tableView
    commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
     forRowAtIndexPath:(NSIndexPath *)indexPath{
    [_tableCellTextList removeObjectAtIndex:indexPath.row];
    //删除指定的cell
    [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]
                     withRowAnimation:UITableViewRowAnimationRight];
}

@end
