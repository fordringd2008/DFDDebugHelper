//
//  NSObject+DFDDebugHelper.m
//  DFDDebugHelper
//
//  Created by 丁付德 on 16/7/4.
//  Copyright © 2016年 dfd. All rights reserved.
//

#import "NSObject+DFDDebugHelper.h"
#import <objc/runtime.h>

@implementation NSObject (DFDDebugHelper)


// 重写系统方法，打印模型的详细信息
-(NSString *)description
{
    NSArray *arrPropertys = [self filterPropertys];
    NSArray *arrValue = [self propertyValues:arrPropertys];
    NSMutableString *reuslt = [NSMutableString new];
    //[reuslt appendString:[super description]];
    [reuslt appendString:@"\n"];
    for (int i = 0 ; i < arrPropertys.count; i++) {
        NSString *strProperty = arrPropertys[i];
        id property = arrValue[i];
        [reuslt appendFormat:@"%@ : %@\n", strProperty, property];
    }
    return reuslt;
}

// 获取所有属性名称
- (NSArray *)filterPropertys
{
    NSMutableArray *props = [NSMutableArray array];
    unsigned int outCount, i;
    objc_property_t *properties = class_copyPropertyList([self class], &outCount);
    for (i = 0; i<outCount; i++)
    {
        const char* char_f =property_getName(properties[i]);
        NSString *propertyName = [NSString stringWithUTF8String:char_f];
        [props addObject:propertyName];
    }
    free(properties);
    return props;
}

// 获取当前模型的所有属性值
- (NSArray *)propertyValues:(NSArray *)arrPropertys {
    NSMutableArray *values = [NSMutableArray array];
    for (NSString *columnName in arrPropertys) {
        id value = [self valueForKey:columnName];
        if (value != nil) {
            [values addObject:value];
        } else {
            [values addObject:[NSNull null]];
        }
    }
    return values;
}



@end
