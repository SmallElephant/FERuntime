//
//  Course.h
//  BaseRuntime
//
//  Created by keso on 2017/7/19.
//  Copyright © 2017年 FlyElephant. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Teacher.h"

@interface Course : NSObject {
    NSInteger num;
}

@property (copy, nonatomic) NSString *courseName;

@property (assign, nonatomic) NSInteger type;

- (void)fetchData;

- (void)calculatData;

- (void)fetchMethod;

- (void)forwardMethod;

@end
