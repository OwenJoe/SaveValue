//
//  EntrustTableViewCell.h
//  传值
//
//  Created by imac on 16/8/3.
//  Copyright © 2016年 imac. All rights reserved.
//

#import <UIKit/UIKit.h>

@class EntrustTableViewCell;

//1.添加代理
@protocol EntrustTableViewCellDelegate <NSObject>

//2.代理的协议方法
-(void)entrustMethod:(UIColor *)color;

@end

@interface EntrustTableViewCell : UITableViewCell

//3.定义代理属性
@property (nonatomic,assign) id<EntrustTableViewCellDelegate>delegate;

@end
