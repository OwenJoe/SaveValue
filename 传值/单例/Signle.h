//
//  Signle.h
//  传值
//
//  Created by imac on 16/8/3.
//  Copyright © 2016年 imac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Signle : NSObject
+(instancetype)shareInstance;
@property (nonatomic,strong) NSString *conutry;
@end
