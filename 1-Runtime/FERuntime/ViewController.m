//
//  ViewController.m
//  FERuntime
//
//  Created by keso on 16/8/14.
//  Copyright © 2016年 FlyElephant. All rights reserved.
//

#import "ViewController.h"
#import "DetailController.h"
#import "NSArray+FlyElephant.h"

typedef void (^CompleteBlock)();

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //1.可变对象 插入nil
    //Terminating app due to uncaught exception 'NSInvalidArgumentException', reason: '*** -[__NSArrayM insertObject:atIndex:]: object cannot be nil'

    //nil表示数组的结束,插入会中断程序
    UIViewController *controller;
    NSMutableArray *mutableArr = [NSMutableArray new];
    if (controller) {
        [mutableArr addObject:controller];
    }
//    Terminating app due to uncaught exception 'NSInvalidArgumentException', reason: '*** setObjectForKey: object cannot be nil (key: name)'

//    NSMutableDictionary *mutableDict = [NSMutableDictionary new];
//    [mutableDict setObject:controller forKey:@"name"];
    
    //2.数组越界
    //Terminating app due to uncaught exception 'NSRangeException', reason: '*** -[__NSArrayI objectAtIndex:]: index 10 beyond bounds [0 .. 1]'

//    NSArray *arr = @[@"FlyElephant",@"keso"];
//    NSString *result = [arr objectAtIndex:10];
//    NSLog(@"%@",result);
    
    //3.Block
//    CompleteBlock completionBlock;
//    completionBlock();
    
    //4.调用不存在的方法
//    Terminating app due to uncaught exception 'NSInvalidArgumentException', reason: '-[DetailController upload]: unrecognized selector sent to instance 0x7faf61637f80'
//    DetailController *detailController = [DetailController new];
//    [detailController upload];
    
    [self setup];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - SetUp

- (void)setup{
    
    //NSArray
    NSArray  *emptyArr = [NSArray new];
    NSLog(@"%@",[emptyArr objectAtIndex:10]);
    
    NSArray *arr = @[@"FlyElephant",@"keso"];
    NSString *result = [arr objectAtIndex:10];
    NSLog(@"%@",result);
    
    NSMutableArray *mutableArr = [[NSMutableArray alloc] initWithArray:arr];
    NSLog(@"%@", mutableArr[100]);
    NSString *obj;
    [mutableArr addObject:obj];
    
    //NSDictionary
    NSString *dictValue;
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:dictValue forKey:@"FlyElephant"];
    [mutableDict setObject:dictValue forKey:dictValue];
    NSLog(@"%@",mutableDict);
    
}

@end
