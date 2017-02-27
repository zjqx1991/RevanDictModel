//
//  imageModel.m
//  RevanDictModel
//
//  Created by 紫荆秋雪 on 2017/2/26.
//  Copyright © 2017年 Revan. All rights reserved.
//

#import "imageModel.h"

@interface imageModel ()

@property (nonatomic,assign) NSInteger w;
@property (nonatomic,copy) NSString *img;
@property (nonatomic,copy) NSString *price;
@property (nonatomic,assign) NSInteger h;

@end

@implementation imageModel
/*
+ (instancetype)imageWithDict:(NSDictionary *)dict {
    
    imageModel *imagemodel = [[self alloc] init];
    [dict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull value, BOOL * _Nonnull stop) {
        
        [imagemodel setValue:value forKey:key];
    }];
    
    return imagemodel;
}
*/
@end
