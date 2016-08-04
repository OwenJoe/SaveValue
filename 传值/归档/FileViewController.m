//
//  FileViewController.m
//  传值
//
//  Created by imac on 16/8/3.
//  Copyright © 2016年 imac. All rights reserved.
//  归档参照引用:http://www.cnblogs.com/wendingding/p/3775293.html

#import "FileViewController.h"
#import "Person.h"
#import "Woman.h"


@interface FileViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *enTableView;

@end

@implementation FileViewController

/**
 *  归档/解档 主要用在自定类型数据存储才会用到
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"归档解档";
    self.enTableView  = [[UITableView alloc]initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStyleGrouped];
    self.enTableView.dataSource = self;
    self.enTableView.delegate = self;
    [self.view addSubview:self.enTableView];

}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return 2;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *iDs =@"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:iDs];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:iDs];
    }
    if (indexPath.row==0) {
        cell.textLabel.text = @"归档";
    }
    if (indexPath.row==1) {
        
        cell.textLabel.text = @"解档";
         }
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    [self.enTableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row==0) {

        //1.创建对象
//        Person *per=[[Person alloc]init];
//        per.name=@"周洁璐";
//        per.age=25;
//        per.height=1.6;
        
        Woman *wo=[[Woman alloc]init];
        wo.name=@"周洁璐";
        wo.age=25;
        wo.height=1.6;
        wo.weight = 66;
        
        //2.获取文件路径
        NSString *docPath=[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject];
        NSString *path=[docPath stringByAppendingPathComponent:@"person.like"];
        NSLog(@"path=%@",path);
        
        //3.将自定义的对象保存到文件中
//        [NSKeyedArchiver archiveRootObject:per toFile:path];
         [NSKeyedArchiver archiveRootObject:wo toFile:path];
    }
    if (indexPath.row==1) {
        //1.获取文件路径
        NSString *docPath=[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject];
        NSString *path=[docPath stringByAppendingPathComponent:@"person.like"];
        NSLog(@"path=%@",path);
        
        //2.从文件中读取对象
        Woman *w=[NSKeyedUnarchiver unarchiveObjectWithFile:path];
        NSLog(@"%@,%d,%.1f,%f",w.name,w.age,w.height,w.weight);
    }

}


@end
