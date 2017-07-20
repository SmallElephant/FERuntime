//
//  DetailViewController.m
//  BaseRuntime
//
//  Created by keso on 2017/7/19.
//  Copyright © 2017年 FlyElephant. All rights reserved.
//

#import "DetailViewController.h"
#import "Teacher.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    NSLog(@"Dealloc---%@",NSStringFromClass([self class]));
}

- (IBAction)saveAction:(UIButton *)sender {
    Teacher *teacher = [Teacher new];
    teacher.teacherName = @"FlyElephant";
    teacher.age = 27;
    
    NSString *filePath = [NSHomeDirectory() stringByAppendingPathComponent:@"teacher.archiver"];
    BOOL success = [NSKeyedArchiver archiveRootObject:teacher toFile:filePath];
    if(success){
        NSLog(@"归档保存成功");
    }
}

- (IBAction)readAction:(UIButton *)sender {
    NSString *filePath = [NSHomeDirectory() stringByAppendingPathComponent:@"teacher.archiver"];
    Teacher *teacher = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
    NSLog(@"Teacher:%@---age:%ld",teacher.teacherName,teacher.age);
}



@end
