//
//  ViewController.m
//  testCode2
//
//  Created by S5-04 on 2015/02/03.
//  Copyright (c) 2015年 msd. All rights reserved.
//

#import "ViewController.h"
#import "CustomLabel.h"
#import "CustomImageView.h"

@interface ViewController (){
    UILabel *myLabel;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //alloc initは必須
    myLabel = [[UILabel alloc] init];
    //位置指定　必須
    myLabel.frame = CGRectMake(10, 40, 100, 20);
    //配置設定　必須
    [self.view addSubview:myLabel];//self.view=どこに　addSubview:myLabel=なにを
    //myLabel.text = @"Hello";
    myLabel.backgroundColor = [UIColor redColor];
    
    
    //CustomLabelで設定
    //alloc initは必須
    CustomLabel *myLabel2 = [[CustomLabel alloc] init];
    //位置指定　必須
    myLabel2.frame = CGRectMake(10, 80, 100, 20);
    //配置設定　必須
    [self.view addSubview:myLabel2];//self.view=どこに　addSubview:myLabel=なにを
    //myLabel2.text = @"Hello";
    myLabel2.backgroundColor = [UIColor redColor];
    
    //通常設定
    UIImageView *myImage = [[UIImageView alloc] init];
    myImage.frame = CGRectMake(10, 120, 75, 75);
    [self.view addSubview:myImage];
    myImage.backgroundColor = [UIColor grayColor];
    
    //CustomImageViewで設定
    CustomImageView *myImage2 = [[CustomImageView alloc] init];
    myImage2.frame = CGRectMake(90, 120, 75, 75);
    [self.view addSubview:myImage2];
    myImage2.backgroundColor = [UIColor grayColor];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
