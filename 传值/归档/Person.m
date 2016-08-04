//
//  Person.m
//  传值
//
//  Created by imac on 16/8/3.
//  Copyright © 2016年 imac. All rights reserved.
//

#import "Person.h"

@implementation Person
// 当将一个自定义对象保存到文件的时候就会调用该方法
// 在该方法中说明如何存储自定义对象的属性
// 也就说在该方法中说清楚存储自定义对象的哪些属性
-(void)encodeWithCoder:(NSCoder *)aCoder
{
    NSLog(@"调用了encodeWithCoder:方法");
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeInteger:self.age forKey:@"age"];
    [aCoder encodeDouble:self.height forKey:@"height"];
}

// 当从文件中读取一个对象的时候就会调用该方法
// 在该方法中说明如何读取保存在文件中的对象
// 也就是说在该方法中说清楚怎么读取文件中的对象
-(id)initWithCoder:(NSCoder *)aDecoder
{
    NSLog(@"调用了initWithCoder:方法");
    //注意：在构造方法中需要先初始化父类的方法
    if (self=[super init]) {
        self.name=[aDecoder decodeObjectForKey:@"name"];
        self.age=[aDecoder decodeIntegerForKey:@"age"];
        self.height=[aDecoder decodeDoubleForKey:@"height"];
    }
    return self;
}


/**
3.遵守NSCoding协议，并实现该协议中的两个方法。
 
4.如果是继承，则子类一定要重写那两个方法。因为person的子类在存取的时候，会去子类中去找调用的方法，没找到那么它就去父类中找，所以最后保存和读取的时候新增加的属性会被忽略。需要先调用父类的方法，先初始化父类的，再初始化子类的。
 
5.保存数据的文件的后缀名可以随意命名。
 
6.通过plist保存的数据是直接显示的，不安全。通过归档方法保存的数据在文件中打开是乱码的，更安全。
 */
@end
