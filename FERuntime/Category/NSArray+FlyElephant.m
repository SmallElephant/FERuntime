//
//  NSArray+FlyElephant.m
//  FERuntime
//
//  Created by keso on 16/8/14.
//  Copyright © 2016年 FlyElephant. All rights reserved.
//

#import "NSArray+FlyElephant.h"
#import "NSObject+FlyElephant.h"

@implementation NSArray (FlyElephant)

+ (void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        @autoreleasepool {
            [objc_getClass("__NSArray0") swizzleMethod:@selector(objectAtIndex:) swizzledSelector:@selector(emptyObjectIndex:)];
            [objc_getClass("__NSArrayI") swizzleMethod:@selector(objectAtIndex:) swizzledSelector:@selector(arrObjectIndex:)];
            [objc_getClass("__NSArrayM") swizzleMethod:@selector(objectAtIndex:) swizzledSelector:@selector(mutableObjectIndex:)];
            [objc_getClass("__NSArrayM") swizzleMethod:@selector(insertObject:atIndex:) swizzledSelector:@selector(mutableInsertObject:atIndex:)];
        }
    });
}


- (id)emptyObjectIndex:(NSInteger)index{
    return nil;
}

- (id)arrObjectIndex:(NSInteger)index{
    if (index >= self.count || index < 0) {
        return nil;
    }
    return [self arrObjectIndex:index];
}

- (id)mutableObjectIndex:(NSInteger)index{
    if (index >= self.count || index < 0) {
        return nil;
    }
    return [self mutableObjectIndex:index];
}

- (void)mutableInsertObject:(id)object atIndex:(NSUInteger)index{
    if (object) {
        [self mutableInsertObject:object atIndex:index];
    }
}

@end

@implementation NSDictionary (FlyElephant)

+ (void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        @autoreleasepool {
            [objc_getClass("__NSDictionaryM") swizzleMethod:@selector(setObject:forKey:) swizzledSelector:@selector(mutableSetObject:forKey:)];
        }
    });
}

- (void)mutableSetObject:(id)obj forKey:(NSString *)key{
    if (obj && key) {
        [self mutableSetObject:obj forKey:key];
    }
}

@end
