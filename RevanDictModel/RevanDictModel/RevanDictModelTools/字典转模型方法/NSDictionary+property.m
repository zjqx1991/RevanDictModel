//
//  NSDictionary+property.m
//  006-字典转模型
//
//  Created by 紫荆秋雪 on 2017/2/25.
//  Copyright © 2017年 Revan. All rights reserved.
//

#import "NSDictionary+property.h"


@implementation NSDictionary (property)

- (void)createPropertyCode {

    //定义一个可变数组
    NSMutableString *codes = [NSMutableString string];
    //遍历字典
    [self enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull value, BOOL * _Nonnull stop) {
        NSString *code;
        
        if ([value isKindOfClass:[NSString class]]) {
            code = [NSString stringWithFormat:@"@property (nonatomic,copy) NSString *%@;", key];
        } else if ([value isKindOfClass:NSClassFromString(@"__NSCFBoolean")]) {
            code = [NSString stringWithFormat:@"@property (nonatomic,assign) BooL %@;", key];
        } else if ([value isKindOfClass:[NSNumber class]]) {
            code = [NSString stringWithFormat:@"@property (nonatomic,assign) NSInteger %@;", key];
        } else if ([value isKindOfClass:[NSArray class]]) {
            code = [NSString stringWithFormat:@"@property (nonatomic,strong) NSArray *%@;", key];
        } else if ([value isKindOfClass:[NSDictionary class]]) {
            code = [NSString stringWithFormat:@"@property (nonatomic,strong) NSDictionary *%@;", key];
        }
        [codes appendString:[NSString stringWithFormat:@"\n%@", code]];
    }];
    NSLog(@"字典属性%@", codes);
}

@end
