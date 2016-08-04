//
//  NoticeViewController.m
//  传值
//
//  Created by imac on 16/8/3.
//  Copyright © 2016年 imac. All rights reserved.
//

#import "NoticeViewController.h"


@interface NoticeViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *enTableView;

@end

@implementation NoticeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"通知传值";
    self.enTableView  = [[UITableView alloc]initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStyleGrouped];
    self.enTableView.dataSource = self;
    self.enTableView.delegate = self;
    [self.view addSubview:self.enTableView];
    
    //接收通知
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(NoticeMethod:) name:@"changeColor" object:nil];
}

/**
 *  移除通知
 */
-(void)dealloc{

    [[NSNotificationCenter defaultCenter]removeObserver:self];
}



-(void)NoticeMethod:(NSNotification *)text{

    NSLog(@"男孩的名字叫:%@",text.userInfo[@"name"]);
    
}












-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return 5;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *iDs =@"cell";
    NoticeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:iDs];
    if (!cell) {
        cell = [[NoticeTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:iDs];
    }
    
    return cell;
}

@end
