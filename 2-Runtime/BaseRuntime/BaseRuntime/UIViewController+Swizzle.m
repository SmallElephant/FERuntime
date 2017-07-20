//
//  UIViewController+Swizzle.m
//  BaseRuntime
//
//  Created by keso on 2017/7/19.
//  Copyright © 2017年 FlyElephant. All rights reserved.
//

#import "UIViewController+Swizzle.h"
#import <objc/runtime.h>

@implementation UIViewController (Swizzle)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];

        SEL originalSelector = @selector(dealloc);
        SEL swizzledSelector = @selector(fe_delloc);
        
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

- (void)fe_viewDidload {
    NSLog(@"fe_viewDidload执行");
    [self fe_viewDidload];
}

- (void)fe_delloc {
    NSLog(@"fe_delloc--移除通知");
    [self fe_delloc];
}

@end
