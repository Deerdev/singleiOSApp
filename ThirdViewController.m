//
//  ThirdViewController.m
//  singleiOSApp
//
//  Created by app on 16/8/29.
//  Copyright © 2016年 app. All rights reserved.
//

#import "ThirdViewController.h"

@interface ThirdViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic,strong) NSMutableArray *tableCellTextList;

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setTitle:@"Page three"];
    self.groupTableView = [[UITableView alloc]
                           initWithFrame:self.view.bounds
                           style:UITableViewStyleGrouped];
    self.groupTableView.dataSource = self;
    self.groupTableView.delegate = self;
    [self.view addSubview:self.groupTableView];
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark set Cell
//返回组的数目
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}

//返回每个组包含的行数
- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section{
    switch (section) {
        case 0:
            return 5;
            break;
        case 1:
            return 6;
            break;
        case 2:
            return 7;
            break;
        default:
            break;
    }
    return 1;
}

//设置cell
- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc]init];
    
    // 分别给每个分区的单元格设置显示的内容
    cell.textLabel.text = [NSString stringWithFormat:@"Section%ld line%ld",
                           indexPath.section,
                           indexPath.row];
    return cell;
}

#pragma mark -
#pragma mark set Height of Head and Footer
//设置标题的高度
- (CGFloat)tableView:(UITableView *)tableView
    heightForHeaderInSection:(NSInteger)section {
    return 30.0f;
}

//设置尾注的高度
- (CGFloat)tableView:(UITableView *)tableView
    heightForFooterInSection:(NSInteger)section {
    return 20.0f;
}

#pragma mark -
#pragma mark set Style of Head and Footer
//设置标题样式
- (UIView *)tableView:(UITableView *)tableView
    viewForHeaderInSection:(NSInteger)section {
    UILabel *headerLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    headerLabel.font = [UIFont boldSystemFontOfSize:18.0f];
    headerLabel.backgroundColor = [UIColor greenColor];
    headerLabel.text = [NSString stringWithFormat:@"Section%ld", section];
    headerLabel.textColor = [UIColor blackColor];
    return headerLabel;
}

//设置尾注样式
- (UIView *)tableView:(UITableView *)tableView
    viewForFooterInSection:(NSInteger)section {
    UILabel *footerLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    footerLabel.font = [UIFont boldSystemFontOfSize:15.0f];
    footerLabel.backgroundColor = [UIColor clearColor];
    footerLabel.textAlignment = NSTextAlignmentCenter;
    footerLabel.text = @"footer";
    footerLabel.textColor = [UIColor blackColor];
    return footerLabel;
}

#pragma mark -
#pragma mark set Cell Click
//设置cell的点击事件，弹出对话框
- (void)tableView:(UITableView *)tableView
    didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *titileString = [NSString stringWithFormat:@"Section%ld line%ld",
                              indexPath.section,
                              indexPath.row];
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示"
                                                   message:titileString
                                                  delegate:self
                                         cancelButtonTitle:@"OK"
                                         otherButtonTitles:nil];
    [alert show];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
