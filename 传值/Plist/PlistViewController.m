//
//  PlistViewController.m
//  传值
//
//  Created by imac on 16/8/3.
//  Copyright © 2016年 imac. All rights reserved.


#import "PlistViewController.h"



@interface PlistViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *enTableView;

@end

@implementation PlistViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"Plsit存储";
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
    if (indexPath.row==0) {
        //在项目的Plist文件只读不能写,在沙盒路径下的plist才可读可写
        cell.textLabel.text = @"本地读取Plist";
    }
    if (indexPath.row==1) {
        
        cell.textLabel.text = @"添加沙盒路径Plist";
    }
    if (indexPath.row==2) {
        
        cell.textLabel.text = @"在沙盒路径读取Plist";
    }
    if (indexPath.row==3) {
        
        cell.textLabel.text = @"在沙盒路径修改Plist";
    }
    if (indexPath.row==4) {
        
        cell.textLabel.text = @"删除沙盒路径Plist";
    }
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [self.enTableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row==0) {
        
        //读取Property List文件
        NSString *userDataPath = [[NSBundle mainBundle] pathForResource:@"UserData" ofType:@"plist"];
        NSMutableDictionary *data = [[NSMutableDictionary alloc] initWithContentsOfFile:userDataPath];
        NSLog(@"%@",data);
        NSLog(@"用户名:%@ 密码:%@", data[@"Login"][@"UserName"],data[@"Login"][@"UserPassWord"]);
        [data setObject:@"登录信息" forKey:@"Login"];
    }
    if (indexPath.row==1) {
        NSArray *sandboxpath= NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        //获取完整路径
        NSString *documentsDirectory = [sandboxpath objectAtIndex:0];
        NSString *plistPath = [documentsDirectory stringByAppendingPathComponent:@"sandbox.plist"];
        //存储根数据
        NSMutableDictionary *rootDic = [[NSMutableDictionary alloc ] init];
        //字典中的详细数据
        NSMutableDictionary *userDataDic = [[NSMutableDictionary alloc]init];
        [userDataDic setObject:@"OwenZ" forKey:@"UserName"];
        [userDataDic setObject:@"就是不告诉你密码" forKey:@"UserPassWord"];
        
        [rootDic setObject:userDataDic forKey:@"Login"];
        //写入文件
        [rootDic writeToFile:plistPath atomically:YES];
        NSLog(@"%@",NSHomeDirectory());
        NSLog(@"写入成功");
        
        
    }
    
    if (indexPath.row == 2) {
        
        //获取路径
        NSArray *sandboxpath= NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *filePath = [[sandboxpath objectAtIndex:0] stringByAppendingPathComponent:@"sandbox.plist"];
        NSLog(@"%@",NSHomeDirectory());
        //获取数据
        NSMutableDictionary *searchdata = [[NSMutableDictionary alloc] initWithContentsOfFile:filePath];
        NSLog(@"%@",searchdata);
    }
    if (indexPath.row==3) {
        
        //获取路径
        NSString *filepath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)objectAtIndex:0]stringByAppendingPathComponent:@"sandbox.plist"];
        //所有的数据列表
        NSMutableDictionary *datalist= [[[NSMutableDictionary alloc]initWithContentsOfFile:filepath]mutableCopy];
        
        //获取Login节点
        NSMutableDictionary *loginData = [datalist objectForKey:@"Login"];
        
        [loginData setValue: @"FlyElephant" forKey:@"UserName"];
        [loginData setValue: @"123456" forKey:@"UserPassWord"];
        [datalist setValue:loginData forKey:@"Login"];
        [datalist writeToFile:filepath atomically:YES];
        NSLog(@"修改成功");
    }
    
    if (indexPath.row == 4) {
        
        NSFileManager *manager=[NSFileManager defaultManager];
        //文件路径
        NSString *filepath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)objectAtIndex:0]stringByAppendingPathComponent:@"sandbox.plist"];
        if ([manager removeItemAtPath:filepath error:nil]) {
            NSLog(@"文件删除成功");
        }
    }
}










@end
