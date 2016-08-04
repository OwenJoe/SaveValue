//
//  NoticeTableViewCell.m
//  传值
//
//  Created by imac on 16/8/3.
//  Copyright © 2016年 imac. All rights reserved.
//

#import "NoticeTableViewCell.h"

@implementation NoticeTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    UIButton *btn = [[UIButton alloc]initWithFrame:self.bounds];
    [self addSubview:btn];
    [btn setTitle:@"点击接收男孩姓名" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnClickMethod) forControlEvents:UIControlEventTouchUpInside];
    return self;
}


/**
 *  发出通知
 */
-(void)btnClickMethod{

    [[NSNotificationCenter defaultCenter]postNotificationName:@"changeColor" object:nil userInfo:@{@"name":@"欧文"}];
}

@end
