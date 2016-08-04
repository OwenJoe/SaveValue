//
//  Woman.m
//  传值
//
//  Created by imac on 16/8/3.
//  Copyright © 2016年 imac. All rights reserved.
//

#import "Woman.h"

@implementation Woman
//在子类中重写这两个方法
- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [super encodeWithCoder:aCoder];
    NSLog(@"调用了Woman encodeWithCoder");
    [aCoder encodeFloat:self.weight forKey:@"weight"];
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        NSLog(@"调用了Woman initWithCoder");
        self.weight = [aDecoder decodeFloatForKey:@"weight"];
    }
    return self;
}
@end
