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

static NSArray * ClassMethodNames(Class c)
{
    NSMutableArray * array = [NSMutableArray array];
    unsigned int methodCount = 0;
    Method * methodList = class_copyMethodList(c, &methodCount);
    unsigned int i;
    for(i = 0; i < methodCount; i++) {
        [array addObject: NSStringFromSelector(method_getName(methodList[i]))];
    }
    
    free(methodList);
    return array;
}

@interface ViewController ()

@property (strong, nonatomic) Teacher *teacher;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    [self setup];
//    [self setup1];
//    [self setup2];
//    [self setup3];
//    NSLog(@"viewDidload执行");
    [self setup4];
}



- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
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

- (void)setup3 {
    Course *course = [[Course alloc] init];
    Class  class = [course class];
    
    unsigned int procount = 0;
    objc_property_t *properties = class_copyPropertyList(class, &procount);
    for (int i = 0; i < procount; i++) {
        objc_property_t property = properties[i];
        const char *propertyName =  property_getName(property);
        NSLog(@"属性名称: %s", propertyName);
    }
    free(properties);
    
    unsigned int varcount = 0;
    Ivar *varlist = class_copyIvarList(class, &varcount);
    for (int i = 0; i < varcount; i++) {
        Ivar var = varlist[i];
        const char *varname =  ivar_getName(var);
        NSLog(@"变量名称: %s", varname);
    }
    free(varlist);
    
    
    unsigned int methodcount = 0;
    Method *methods = class_copyMethodList(class, &methodcount);
    for (int i = 0; i < methodcount; i++) {
        Method method = methods[i];
        SEL method_name = method_getName(method);
        NSLog(@"方法名称:%@",NSStringFromSelector(method_name));
    }
    free(methods);
    
}

- (void)setup4 {
    Teacher *teacher = [Teacher new];
    
    NSLog(@"Teacher->isa:%@",object_getClass(teacher));
    NSLog(@"Teacher class:%@",[teacher class]);
    NSLog(@"Teacher方法列表 = %@",ClassMethodNames(object_getClass(teacher)));
    [teacher addObserver:self forKeyPath:@"courseName" options:NSKeyValueObservingOptionNew context:nil];
    
    NSLog(@"Teacher->isa:%@",object_getClass(teacher));
    NSLog(@"Teacher class:%@",[teacher class]);
    NSLog(@"Teacher方法列表 = %@",ClassMethodNames(object_getClass(teacher)));
    
    self.teacher = teacher;
    
    [teacher willChangeValueForKey:@""];
    
}


@end
