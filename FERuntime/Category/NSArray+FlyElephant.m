//
//  NSArray+FlyElephant.m
//  FERuntime
//
//  Created by keso on 16/8/14.
//  Copyright © 2016年 FlyElephant. All rights reserved.
//

#import "NSArray+FlyElephant.h"

@implementation NSArray (FlyElephant)

+ (void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];
        
        // When swizzling a class method, use the following:
        // Class class = object_getClass((id)self);
        
        SEL originalSelector = @selector(objectAtIndex:);
        SEL swizzledSelector = @selector(safeObjectIndex:);
        
        Method originalMethod = class_getInstanceMethod(class, originalSelector);
        Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
        
        BOOL didAddMethod = class_addMethod(class,
                        originalSelector,
                        method_getImplementation(swizzledMethod),
                        method_getTypeEncoding(swizzledMethod));
        
        if (didAddMethod) {
            class_replaceMethod(class,
                                swizzledSelector,
                                method_getImplementation(originalMethod),
                                method_getTypeEncoding(originalMethod));
        } else {
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
    });
}

- (id)safeObjectIndex:(NSInteger)index{
    if (index>=self.count && index <0) {
        return nil;
    }
    return [self safeObjectIndex:index];
}

@end
