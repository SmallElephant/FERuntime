//
//  NSObject+FlyElephant.m
//  FERuntime
//
//  Created by FlyElephant on 16/8/15.
//  Copyright © 2016年 FlyElephant. All rights reserved.
//

#import "NSObject+FlyElephant.h"
#import <objc/runtime.h>

@implementation NSObject (FlyElephant)

- (void)swizzleMethod:(SEL)originalSelector swizzledSelector:(SEL)swizzledSelector{
    Class class = [self class];
    
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
}

@end
