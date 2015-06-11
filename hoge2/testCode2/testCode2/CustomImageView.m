//
//  CustomImageView.m
//  testCode2
//
//  Created by S5-04 on 2015/02/03.
//  Copyright (c) 2015年 msd. All rights reserved.
//

#import "CustomImageView.h"

@implementation CustomImageView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

/*オーバーライド 継承される*/
- (id)init {
    self = [super init];
    if (self != nil) {
        
        
        //GestureRecognizerクラス（タップ検知）
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doTap:)];
        //inputImageView(対象)にジェスチャーセット
        [self addGestureRecognizer:tap];
        //inputImageView(対象)のアクションを許可
        self.userInteractionEnabled = YES;
        
        
//        int i = arc4random()%3;
//        if (i==0) {
//          self.image = [UIImage imageNamed:@"mole_def.png"];
//        }
//        else if (i==1) {
//            self.image = [UIImage imageNamed:@"mole_hit.png"];
//        }
//        else if (i==2) {
//            self.image = [UIImage imageNamed:@"mole_miss.png"];
//        }
        
    }
    
    [self performSelector:@selector(test) withObject:self afterDelay:1.0];
    
    return self;
}

-(IBAction)doTap:(id)sender{
    NSLog(@"タップしたよ");
    
     self.image = [UIImage imageNamed:@"mole_hit.png"];
}

-(void)test{
    NSLog(@"test");
    
    [self performSelector:@selector(test) withObject:self afterDelay:1.0];
    
    int i = arc4random()%3;
    if (i==0) {
        self.image = [UIImage imageNamed:@"mole_def.png"];
    }
    else if (i==1) {
        self.image = [UIImage imageNamed:@"mole_none.png"];
    }
    else if (i==2) {
        self.image = [UIImage imageNamed:@"mole_miss.png"];
    }

}

@end
