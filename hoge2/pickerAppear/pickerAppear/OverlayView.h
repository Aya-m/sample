//
//  OverlayView.h
//  pickerAppear
//
//  Created by S5-09 on 2015/03/02.
//  Copyright (c) 2015年 msd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OverlayView : UIView

@property(nonatomic, weak) id target;
@property(nonatomic, assign) SEL action;

@end
