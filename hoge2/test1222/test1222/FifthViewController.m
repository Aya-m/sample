//
//  FifthViewController.m
//  test1222
//
//  Created by S5-04 on 2014/12/22.
//  Copyright (c) 2014年 msd. All rights reserved.
//

#import "FifthViewController.h"

@interface FifthViewController ()

@end

@implementation FifthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

@end
