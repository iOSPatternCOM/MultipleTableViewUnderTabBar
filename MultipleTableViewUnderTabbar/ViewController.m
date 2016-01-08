//
//  ViewController.m
//  MultipleTableViewUnderTabbar
//
//  Created by Zin on 16/1/7.
//  Copyright © 2016年 NOTEON. All rights reserved.
//

#import "ViewController.h"
#import "SubViewController.h"


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIButton *button = [[UIButton alloc] initWithFrame:self.view.bounds];
    [button setTitle:@"Sub View" forState:UIControlStateNormal];
    [self.view addSubview:button];
    [button addTarget:self action:@selector(tap:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)tap:(id)sender {
    SubViewController *subViewController = [[SubViewController alloc] init];
    [self.navigationController pushViewController:subViewController animated:YES];
}

@end
