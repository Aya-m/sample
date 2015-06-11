//
//  OverlayView.m
//  pickerAppear
//
//  Created by S5-09 on 2015/03/02.
//  Copyright (c) 2015年 msd. All rights reserved.
//

#import "OverlayView.h"

@implementation OverlayView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.target performSelector:self.action withObject:self afterDelay:0.0f];
}


@end
