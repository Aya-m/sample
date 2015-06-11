//
//  SecondViewController.m
//  testTable
//
//  Created by S5-04 on 1/20/15.
//  Copyright (c) 2015 msd. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController (){
    IBOutlet UILabel*testLabel01;
    IBOutlet UIImageView*resultView;
}

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSLog(@"受け取った文字は「%@」" ,self.getString);
    
    testLabel01.text = self.getString;
    
    
    if ([self.getString isEqualToString:@"もも"]){
        
        resultView.image = [UIImage imageNamed:@"00.png"];
    }
    
    else if ([self.getString isEqualToString:@"メロン"]){
        resultView.image = [UIImage imageNamed:@"01.png"];
    }
    
    else{
        resultView.image = [UIImage imageNamed:@"02.png"];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



//プッシュBackボタンメソッド
-(IBAction)doBack:(id)sender{
    
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}

@end
