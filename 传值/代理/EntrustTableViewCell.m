//
//  EntrustTableViewCell.m
//  传值
//
//  Created by imac on 16/8/3.
//  Copyright © 2016年 imac. All rights reserved.
//

#import "EntrustTableViewCell.h"

@implementation EntrustTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    UIButton *btn = [[UIButton alloc]initWithFrame:self.bounds];
    [self addSubview:btn];
    [btn setTitle:@"点击改变背景颜色" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnClickMethod) forControlEvents:UIControlEventTouchUpInside];
    return self;
}

-(void)btnClickMethod{

    //1.判断代理是否实现了该协议方法
    if ([self.delegate respondsToSelector:@selector(entrustMethod:)]) {
        
        //2.如果实现了,再去通知代理工作
        [self.delegate entrustMethod:[UIColor yellowColor]];
    }
}

@end
