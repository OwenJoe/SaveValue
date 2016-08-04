//
//  ProViewController.m
//  传值
//
//  Created by imac on 16/8/3.
//  Copyright © 2016年 imac. All rights reserved.
//

#import "ProViewController.h"


@interface ProViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *enTableView;

@end

@implementation ProViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"属性传值";
    self.enTableView  = [[UITableView alloc]initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStyleGrouped];
    self.enTableView.dataSource = self;
    self.enTableView.delegate = self;
    [self.view addSubview:self.enTableView];
}



-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return 5;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *iDs =@"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:iDs];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:iDs];
    }
    //属性接收过来的值
    cell.textLabel.text = self.cellString;
    return cell;
}

@end
