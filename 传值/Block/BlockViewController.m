//
//  BlockViewController.m
//  传值
//
//  Created by imac on 16/8/3.
//  Copyright © 2016年 imac. All rights reserved.
//

#import "BlockViewController.h"


@interface BlockViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *enTableView;

@end

@implementation BlockViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"Block传值";
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
    cell.textLabel.text = @"Block按钮点击";
    
    return cell;
}


-(void)returnText:(nameBlock)block{

    self.nameLab = block;
}

-(void)returnDict:(dictBlock)block{

    self.dicts = block;
}

-(void)returnFruit:(moreFruitBlock)block{

    self.fruits = block;
}

-(void)viewWillDisappear:(BOOL)animated{

    if (self.nameLab != nil) {
        
        self.nameLab(@"我是成龙");
    }
    if (self.dicts!= nil) {
        
        self.dicts(@{@"密码":@"123456"});
    }
    if (self.fruits != nil) {
        
        self.fruits(@"苹果",@"香蕉");
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

      [self.navigationController popViewControllerAnimated:YES];
}











@end
