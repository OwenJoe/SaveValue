//
//  BlockViewController.h
//  传值
//
//  Created by imac on 16/8/3.
//  Copyright © 2016年 imac. All rights reserved.
//

#import <UIKit/UIKit.h>

//定义一个字符串
typedef void(^nameBlock)(NSString *nameString);

//定义一个字典
typedef void(^dictBlock)(NSDictionary *params);

//定义多个参数
typedef void(^moreFruitBlock)(NSString *apple,NSString *banana);

@interface BlockViewController : UIViewController

//定义属性
@property (nonatomic,copy) nameBlock  nameLab;

//定义字典
@property (nonatomic,copy) dictBlock  dicts;

@property (nonatomic,copy) moreFruitBlock fruits;

//block语句块函数
-(void)returnText:(nameBlock)block;

-(void)returnDict:(dictBlock)block;

-(void)returnFruit:(moreFruitBlock)block;

@end
