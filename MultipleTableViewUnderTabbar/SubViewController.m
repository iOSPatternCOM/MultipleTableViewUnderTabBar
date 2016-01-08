//
//  SubViewController.m
//  MultipleTableViewUnderTabbar
//
//  Created by Zin on 16/1/7.
//  Copyright © 2016年 NOTEON. All rights reserved.
//

#import "SubViewController.h"

static const CGFloat kSubViewControllerSegmentHolderHeight = 80.f;

@interface SubViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, weak) UITableView *table1;
@property (nonatomic, weak) UITableView *table2;
@property (nonatomic, weak) UITableView *table3;

@property (nonatomic, weak) UITableView *currentTable;
@end

@implementation SubViewController

- (UITableView *)table1 {
    if (!_table1) {
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, kSubViewControllerSegmentHolderHeight, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds) - kSubViewControllerSegmentHolderHeight)];
        tableView.dataSource = self;
        tableView.delegate = self;
        tableView.hidden = YES;
        [self.view insertSubview:tableView atIndex:0];
        _table1 = tableView;
    }
    return _table1;
}
- (UITableView *)table2 {
    if (!_table2) {
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, kSubViewControllerSegmentHolderHeight, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds) - kSubViewControllerSegmentHolderHeight)];
        tableView.dataSource = self;
        tableView.delegate = self;
        tableView.hidden = YES;
        [self.view insertSubview:tableView atIndex:0];
        _table2 = tableView;
    }
    return _table2;
}
- (UITableView *)table3 {
    if (!_table3) {
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, kSubViewControllerSegmentHolderHeight, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds) - kSubViewControllerSegmentHolderHeight)];
        tableView.dataSource = self;
        tableView.delegate = self;
        tableView.hidden = YES;
        [self.view insertSubview:tableView atIndex:0];
        _table3 = tableView;
    }
    return _table3;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"Sub View";
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIVisualEffectView *segmentHolderView = [[UIVisualEffectView alloc] initWithFrame:CGRectMake(0, 64.f, CGRectGetWidth(self.view.bounds), kSubViewControllerSegmentHolderHeight)];
    segmentHolderView.effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleExtraLight];
    [self.view addSubview:segmentHolderView];
    
    UISegmentedControl *segment = [[UISegmentedControl alloc] initWithItems:@[@"Table 1", @"Table 2", @"Table 3"]];
    [segment addTarget:self action:@selector(seg:) forControlEvents:UIControlEventValueChanged];
    [segmentHolderView addSubview:segment];
    segment.center = CGPointMake(CGRectGetMidX(segmentHolderView.bounds), CGRectGetMidY(segmentHolderView.bounds));
    
//    self.automaticallyAdjustsScrollViewInsets = YES;
//    self.edgesForExtendedLayout = UIRectEdgeTop | UIRectEdgeBottom;
    
    self.table1.hidden = NO;
    [self.view insertSubview:self.table1 atIndex:0];
    self.currentTable = self.table1;
}

- (void)seg:(UISegmentedControl *)segment {
    NSLog(@"seg");
    NSArray *tables = @[self.table1, self.table2, self.table3];
    UITableView *selectedTable = tables[segment.selectedSegmentIndex];
    if ([self.currentTable isEqual:selectedTable]) {
        return;
    }
    // show selected table
    self.currentTable.hidden = YES;
    selectedTable.hidden = NO;
    // update selected table layout to first the table
    selectedTable.contentInset = self.table1.contentInset;
    selectedTable.scrollIndicatorInsets = self.table1.scrollIndicatorInsets;
    [selectedTable scrollRectToVisible:CGRectMake(0, 0, 100, 100) animated:NO];
//    [self.view insertSubview:selectedTable atIndex:0];
    self.currentTable = selectedTable;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        cell.textLabel.textColor = [UIColor redColor];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%@ - %ld", tableView, (long)indexPath.row];
    return cell;
}

@end
