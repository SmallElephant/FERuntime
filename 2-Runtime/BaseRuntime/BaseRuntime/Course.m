//
//  Course.m
//  BaseRuntime
//
//  Created by keso on 2017/7/19.
//  Copyright © 2017年 FlyElephant. All rights reserved.
//

#import "Course.h"
#import <objc/runtime.h>


void resolveMethodIMP(id self, SEL _cmd) {
    NSLog(@"resolveInstanceMethod---resolveMethodIMP");
}

@implementation Course

+ (BOOL)resolveClassMethod:(SEL)sel {
    return [super resolveClassMethod:sel];
}

+ (BOOL)resolveInstanceMethod:(SEL)sel {
    NSLog(@"%@",NSStringFromSelector(_cmd));
    if (sel == @selector(calculatData)) {
        class_addMethod([self class], sel, (IMP)resolveMethodIMP, "v@:");
        return YES;
    }
    
    return [super resolveInstanceMethod:sel];
}

- (id)forwardingTargetForSelector:(SEL)aSelector {
     NSLog(@"%@",NSStringFromSelector(_cmd));
    if (aSelector == @selector(fetchMethod)) {
        return [Teacher new];
    }
    return [super forwardingTargetForSelector:aSelector];
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    NSLog(@"%@",NSStringFromSelector(_cmd));
    NSMethodSignature *signature = [super methodSignatureForSelector:aSelector];
    
    if (!signature) {
        if ([Teacher instancesRespondToSelector:aSelector]) {
            signature = [Teacher instanceMethodSignatureForSelector:aSelector];
        }
    }
    
    return signature;
}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
    NSLog(@"%@",NSStringFromSelector(_cmd));
    if ([Teacher instanceMethodForSelector:anInvocation.selector]) {
        [anInvocation invokeWithTarget:[Teacher new]];
    } else {
        [super forwardInvocation:anInvocation];
    }
}

- (void)fetchData {
    NSLog(@"Course---%@执行", NSStringFromSelector(_cmd));
}

@end
