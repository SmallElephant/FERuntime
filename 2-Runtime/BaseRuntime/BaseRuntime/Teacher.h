//
//  Teacher.h
//  BaseRuntime
//
//  Created by keso on 2017/7/19.
//  Copyright © 2017年 FlyElephant. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Teacher : NSObject<NSCoding>

@property (copy, nonatomic) NSString *teacherName;

@property (assign, nonatomic) NSInteger age;

- (void)fetchMethod;

- (void)forwardMethod;

@end
