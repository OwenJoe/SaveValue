//
//  Signle.m
//  传值
//
//  Created by imac on 16/8/3.
//  Copyright © 2016年 imac. All rights reserved.
//

#import "Signle.h"

@implementation Signle
+(instancetype)shareInstance{

    static Signle *signle = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        signle = [[Signle alloc]init];
        signle.conutry = @"中华人民共和国";
    });
    
    return signle;
}
@end
