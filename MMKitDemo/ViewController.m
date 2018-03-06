//
//  ViewController.m
//  MMKitDemo
//
//  Created by 张一鸣 on 2017/12/22.
//  Copyright © 2017年 张一鸣. All rights reserved.
//

#import "ViewController.h"
#import "MMKit.h"


@interface ViewController ()

@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    MMLog(@"11:%@", [MMDeviceInformation UUID]);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
