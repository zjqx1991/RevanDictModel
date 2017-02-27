//
//  ViewController.m
//  RevanDictModel
//
//  Created by 紫荆秋雪 on 2017/2/25.
//  Copyright © 2017年 Revan. All rights reserved.
//

#import "ViewController.h"
#import "NSDictionary+property.h"
#import "NSObject+Model.h"
#import "imageModel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"image.plist" ofType:nil];
    NSArray *array = [NSArray arrayWithContentsOfFile:path];
    
    for (NSDictionary *dict in array) {
        /// 自动生成模型属性
        //[dict createPropertyCode];
        /// 字典转模型
        imageModel *imagemodel = [imageModel modelWithDict:dict];
        NSLog(@"%@", imagemodel);
    }
    
    
}

@end
