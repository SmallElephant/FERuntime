//
//  ViewController.m
//  BaseRuntime
//
//  Created by keso on 2017/7/19.
//  Copyright © 2017年 FlyElephant. All rights reserved.
//

#import "ViewController.h"
#import "Course.h"
#import <objc/message.h>
#import <objc/runtime.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    [self setup];
//    [self setup1];
    [self setup2];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setup {
    Course *course = [[Course alloc] init];
    [course fetchData];
}

- (void)setup1 {
//    /Users/keso/Desktop/Git/GitHub/FERuntime/2-Runtime/BaseRuntime/BaseRuntime/ViewController.m:39:17: Declaration of 'objc_msgSend' must be imported from module 'ObjectiveC.message' before it is required
//
    
//    id myobjc = objc_msgSend([Course class], @selector(alloc));
//    myobjc = objc_msgSend(myobjc, @selector(init));
    
//    Course *courseClass = objc_msgSend([Course class], sel_registerName("alloc"));
//    courseClass = objc_msgSend(courseClass, sel_registerName("init"));
//    SEL sel = sel_registerName("fetchData");
//    objc_msgSend(courseClass,sel);
    
    Course *courseClass = objc_msgSend([Course class], @selector(alloc));
    courseClass = objc_msgSend(courseClass, @selector(init));
    SEL sel = @selector(fetchData);
    objc_msgSend(courseClass,sel);
}

- (void)setup2 {
    
//    Course *course = [Course new];
//    [course calculatData];
    
//    [course fetchMethod];
    Course *course = [Course new];
    [course forwardMethod];
}


@end
