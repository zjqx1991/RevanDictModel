//
//  NSObject+Model.m
//  RevanDictModel
//
//  Created by 紫荆秋雪 on 2017/2/26.
//  Copyright © 2017年 Revan. All rights reserved.
//
/*
 //获取 - 成员变量
 class_copyIvarList(<#__unsafe_unretained Class cls#>, <#unsigned int *outCount#>)
 //获取 - 属性变量
 class_copyPropertyList(<#__unsafe_unretained Class cls#>, <#unsigned int *outCount#>)
 方法的比较：
 “属性变量”来自动生成“带有下划线”的“成员变量”
 而 “成员变量”不会自动转化成 “属性变量”， 所以
 当我们使用 class_copyPropertyList 来获取
 “属性变量”的时候，有可能会丢失类中的 “成员变量”，
 当是当使用获取 “成员变量” 的时候，就不会丢失 
 “属性变量” ，所以我们使用 class_copyIvarList
 方法
 */

#import "NSObject+Model.h"
#import <objc/message.h>

@implementation NSObject (Model)

+ (instancetype)modelWithDict:(NSDictionary *)dict {
    //1、创建模型
    id objc = [[self alloc] init];
    // runtime:根据模型中属性，去字典中取出对应的value给模型属性赋值
    // 1、获取模型中所有属性 key
    // 2、根据属性名去字典中查找value
    // 3、给模型中的属性赋值 KVC
    // count：成员变量个数 count
    unsigned int count = 0;
    Ivar *ivarList = class_copyIvarList([self class], &count);
    //class_copyIvarList([self class], &count);
    // 遍历所有成员变量
    for (int i = 0; i < count; i++) {
        // 获取成员变量
        Ivar ivar = ivarList[i];
        // 获取成员变量名字
        NSString *ivarName = [NSString stringWithUTF8String:ivar_getName(ivar)];
        // 获取成员变量类型
        NSString *ivarType = [NSString stringWithUTF8String:ivar_getTypeEncoding(ivar)];
        // @\"User"\ -> User
        ivarType = [ivarType stringByReplacingOccurrencesOfString:@"\"" withString:@""];
        ivarType = [ivarType stringByReplacingOccurrencesOfString:@"@" withString:@""];
        
        // 获取key
        NSString *key = [ivarName substringFromIndex:1];
        // 去字典中查找对应value
        id value = dict[key];
        
        // 二级转换：判断value是否是字典，如果是，字典转模型
        // 并且是自定义对象才需要转模型
//        if ([value isKindOfClass:[NSDictionary class]] && ![ivarType hasPrefix:@"NS"]) {
//            // 获取类
//            Class modelClass = NSClassFromString(ivarType);
//            value = [modelClass modelWithDict:value];
//        }
        
        
        // KVC 赋值
        if (value) {
            [objc setValue:value forKey:key];
        }
    }
    
    return objc;
}
@end
