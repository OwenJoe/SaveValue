//
//  Person.h
//  传值
//
//  Created by imac on 16/8/3.
//  Copyright © 2016年 imac. All rights reserved.
//

#import <Foundation/Foundation.h>
// 如果想将一个自定义对象保存到文件中必须实现NSCoding协议
@interface Person : NSObject<NSCopying>

 //姓名
 @property(nonatomic,copy)NSString *name;
//年龄
@property(nonatomic,assign)int age;
//身高
 @property(nonatomic,assign)double height;

-(void)encodeWithCoder:(NSCoder *)aCoder;
-(id)initWithCoder:(NSCoder *)aDecoder;
@end
