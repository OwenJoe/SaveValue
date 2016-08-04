//
//  ViewController.m
//  传值
//
//  Created by imac on 16/7/28.
//  Copyright © 2016年 imac. All rights reserved.
//

#import "ViewController.h"
#import "EntrustViewController.h"
#import "NoticeViewController.h"
#import "BlockViewController.h"
#import "ProViewController.h"
#import "UdViewController.h"
#import "SignViewController.h"
#import "FileViewController.h"
#import "PlistViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *wbTableView;
@property (nonatomic,strong)  NSMutableArray *arry;
@end

@implementation ViewController

-(UITableView *)wbTableView{
    
    if (!_wbTableView) {
        
        self.wbTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
        self.wbTableView.delegate = self;
        self.wbTableView.dataSource =self;
    }
    return _wbTableView;
}

-(NSMutableArray *)arry{
    
    if (_arry) {
        _arry = [NSMutableArray array];
    }
    return _arry;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"传值demo";
    self.view.backgroundColor =  [UIColor whiteColor];
    [self.view addSubview:self.wbTableView];
    
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 8;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *iDs =@"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:iDs];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:iDs];
    }
    _arry = [NSMutableArray arrayWithObjects:@"代理",@"通知",@"Block",@"属性顺传",@"Plist",@"NSUserDefault",@"归档",@"单例", nil];
    cell.textLabel.text = _arry[indexPath.row];
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //返回的时候,默认不选中
    [self.wbTableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.row == 0) {
        
        EntrustViewController *entrustVc = [[EntrustViewController alloc]init];
        [self.navigationController pushViewController:entrustVc animated:YES];
    }
    
    if (indexPath.row == 1) {
        
        NoticeViewController *noticeVc = [[NoticeViewController alloc]init];
        [self.navigationController pushViewController:noticeVc animated:YES];
    }
    if (indexPath.row == 2) {
        
        BlockViewController *blockVc = [[BlockViewController alloc]init];
        [self.navigationController pushViewController:blockVc animated:YES];
        
        //__weak typeof (self) weakSelf = self;
        //字符串
        [blockVc returnText:^(NSString *nameString) {
            
            NSLog(@"Block传字符串:%@",nameString);
        }];
        //字典
        [blockVc returnDict:^(NSDictionary *params) {
            
            NSLog(@"Block传字典:%@",params);
        }];
        
        //多个参数
        [blockVc returnFruit:^(NSString *apple, NSString *banana) {
            
            NSLog(@"Block传多个参数:%@---%@",apple,banana);
        }];
    }
    if (indexPath.row == 3) {
        
        ProViewController *proVc = [[ProViewController alloc]init];
        NSString *text = @"中华56个名族";
        proVc.cellString = text;
        [self.navigationController pushViewController:proVc animated:YES];
    }
    if (indexPath.row == 4) {
        
        PlistViewController *plistVc = [[PlistViewController alloc]init];
        [self.navigationController pushViewController:plistVc animated:YES];
    }
    if (indexPath.row == 5) {
        
        //NSUserDefaults 是异步操作
        [[NSUserDefaults standardUserDefaults]setObject:@"苹果的老总叫谁?---乔布斯" forKey:@"sendValus"];
        [[NSUserDefaults standardUserDefaults]synchronize];
        UdViewController *UdVc = [[UdViewController alloc]init];
        [self.navigationController pushViewController:UdVc animated:YES];
    }
    if (indexPath.row == 6) {
        FileViewController *fileVc = [[FileViewController alloc]init];
        [self.navigationController pushViewController:fileVc animated:YES];
    }
    if (indexPath.row == 7) {
        SignViewController *signVc = [[SignViewController alloc]init];
        [self.navigationController pushViewController:signVc animated:YES];
    }
    
}












@end
