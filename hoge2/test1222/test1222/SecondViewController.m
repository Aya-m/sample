//
//  SecondViewController.m
//  test1222
//
//  Created by S5-04 on 2014/12/22.
//  Copyright (c) 2014年 msd. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController (){
    IBOutlet UITextField*enterTextField;
    IBOutlet UISegmentedControl*chiceSeg;
    NSArray *secondArray;
    IBOutlet UILabel*myLabel;
}

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    enterTextField.delegate = (id)self;
    
    secondArray = [[NSArray alloc] init];
    secondArray = @[@"英国",@"米国",@"日本"];
    NSLog(@"%@",secondArray[2]);
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
//@"好きに名前つける"　storyboardのアトリビュートインスペクターSegueで同じ名前つける
-(IBAction)doNext:(id)sender{
    
    NSString*st = [[NSString alloc] init];
    st = enterTextField.text;
    NSLog(@"何故なら%@",st);
    
    [self performSegueWithIdentifier:@"toThird" sender:self];
}

-(BOOL)textFieldShouldReturn:(UITextField*)textField{
    [enterTextField resignFirstResponder];
    return YES;
}

-(IBAction)doChice:(UISegmentedControl*)sender{
    NSLog(@"seg %ld", sender.selectedSegmentIndex);
    NSLog(@"行きたい国は%@",secondArray [sender.selectedSegmentIndex]);
    myLabel.text=@"いいね！";
}

@end
