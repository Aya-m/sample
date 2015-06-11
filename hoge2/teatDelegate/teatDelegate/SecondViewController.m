//
//  SecondViewController.m
//  teatDelegate
//
//  Created by S5-04 on 2015/02/09.
//  Copyright (c) 2015年 msd. All rights reserved.
//

#import "SecondViewController.h"
#import "CustomImageView.h"

@interface SecondViewController ()<CustomImageViewDelegate>{

}

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    CustomImageView *ImageView = [[CustomImageView alloc] init];
    ImageView.frame = CGRectMake(50, 50, 100, 100);
    [self.view addSubview:ImageView];
    ImageView.backgroundColor = [UIColor blueColor];
    ImageView.delegate = self;
    ImageView.tag = 99;//tagの番号設定できる
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


//Backボタンメソッド Close Modal view
-(IBAction)doBack:(id)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}

//ImageViewをタップして、tagのプロパティ(数字)を検知する　何も設定しなければ0番になっている
-(void)isTapView:(int)tag;{
    　NSLog(@"Tagは%d", tag);
}

@end
