//
//  NSObject+FlyElephant.h
//  FERuntime
//
//  Created by FlyElephant on 16/8/15.
//  Copyright © 2016年 FlyElephant. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (FlyElephant)

- (void)swizzleMethod:(SEL)originalSelector swizzledSelector:(SEL)swizzledSelector;

@end
