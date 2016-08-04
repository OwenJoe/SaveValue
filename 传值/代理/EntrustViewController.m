//
//  EntrustViewController.m
//  传值
//
//  Created by imac on 16/8/3.
//  Copyright © 2016年 imac. All rights reserved.
//

#import "EntrustViewController.h"


@interface EntrustViewController ()<UITableViewDelegate,UITableViewDataSource,EntrustTableViewCellDelegate>
@property (nonatomic,strong) UITableView *enTableView;

@end

@implementation EntrustViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"代理(委托)";
    self.enTableView  = [[UITableView alloc]initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStyleGrouped];
    self.enTableView.dataSource = self;
    self.enTableView.delegate = self;
    [self.view addSubview:self.enTableView];
}

/**
 *  代理方法,从EntrustTableViewCell点击后过来触发
 */
-(void)entrustMethod:(UIColor *)color{

    NSLog(@"代理方法被触发");
    self.enTableView.backgroundColor = color;
    [self.enTableView reloadData];

}



-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return 5;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *iDs =@"cell";
    EntrustTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:iDs];
    if (!cell) {
        cell = [[EntrustTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:iDs];
    }
    
    //遵守代理协议,cell在遵守前必须先初始化
    cell.delegate = self;
    return cell;
}

@end
