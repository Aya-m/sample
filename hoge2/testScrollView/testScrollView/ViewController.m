//
//  ViewController.m
//  testScrollView
//
//  Created by S5-04 on 2015/02/03.
//  Copyright (c) 2015年 msd. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    IBOutlet UIScrollView *myScrollView;
    
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    myScrollView.contentSize = CGSizeMake(960, 568);//960=320*3
    myScrollView.pagingEnabled = YES;
    
    for (int i=0; i<5; i++) {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.frame = CGRectMake(i*320, 0, 320, 568);
        [myScrollView addSubview:imageView];
    }
    myScrollView.contentSize = CGSizeMake(320*5, 568);
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
