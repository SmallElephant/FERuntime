//
//  Teacher.m
//  BaseRuntime
//
//  Created by keso on 2017/7/19.
//  Copyright © 2017年 FlyElephant. All rights reserved.
//

#import "Teacher.h"
#import <objc/runtime.h>

@implementation Teacher

//// 解档
//- (instancetype)initWithCoder:(NSCoder *)aDecoder {
//    NSLog(@"initWithCoder");
//    self = [super init];
//    if (self) {
//        self.teacherName = [aDecoder decodeObjectForKey:@"teacherName"];
//        self.age = [[aDecoder decodeObjectForKey:@"age"] integerValue];
//    }
//    return self;
//}
//
//// 归档
//- (void)encodeWithCoder:(NSCoder *)aCoder {
//    
//    NSLog(@"encodeWithCoder");
//    [aCoder encodeObject:self.teacherName forKey:@"teacherName"];
//    [aCoder encodeObject:@(self.age) forKey:@"age"];
//}

// 解档
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        unsigned int varCount = 0;
        Ivar *vars = class_copyIvarList([self class], &varCount);
        for (int i = 0; i < varCount; i ++) {
            Ivar var = vars[i];
            const char *name = ivar_getName(var);
            NSString *key = [NSString stringWithUTF8String:name];
            id value = [aDecoder decodeObjectForKey:key];
            [self setValue:value forKey:key];
        }
    }
    return self;
}

// 归档
- (void)encodeWithCoder:(NSCoder *)aCoder{
    unsigned int varCount = 0;
    Ivar *vars = class_copyIvarList([self class], &varCount);
    for (int i = 0; i < varCount; i ++) {
        Ivar var = vars[i];
        const char *name = ivar_getName(var);
        NSString *key = [NSString stringWithUTF8String:name];
        
        id value = [self valueForKey:key];
        [aCoder encodeObject:value forKey:key];
    }
}

- (void)fetchMethod {
    NSLog(@"Teacher---fetchMethod");
}

- (void)forwardMethod {
    NSLog(@"Teacher---forwardMethod");
}

@end
