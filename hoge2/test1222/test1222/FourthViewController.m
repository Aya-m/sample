//
//  FourthViewController.m
//  test1222
//
//  Created by S5-04 on 2014/12/22.
//  Copyright (c) 2014年 msd. All rights reserved.
//

#import "FourthViewController.h"

@interface FourthViewController ()

@end

@implementation FourthViewController

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

//Nextボタンメソッド
//@"好きに名前つける"　storyboardのアトリビュートインスペクターSegueで同じ名前つける。
-(IBAction)doNext:(id)sender{
    [self performSegueWithIdentifier:@"toFifth" sender:self];
}

@end
