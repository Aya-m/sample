//
//  ViewController.m
//  pickerAppear
//
//  Created by S5-09 on 2015/03/02.
//  Copyright (c) 2015年 msd. All rights reserved.
//

#import "ViewController.h"
//#import "OverlayView.h"

#define TEXT_FIELDS_COUNT       2
#define GENDER_FIELD_TAG        1
#define AREA_FIELD_TAG          2

@interface ViewController ()<
UIPickerViewDelegate,
UIPickerViewDataSource,
UITextFieldDelegate
>

@property(nonatomic, retain) UIToolbar *keyboardToolbar;

@property(nonatomic, strong) UITextField *genderTextField;
@property(nonatomic, retain) UIPickerView *genderPickerView;

@property(nonatomic, strong) UITextField *areaTextField;
@property(nonatomic, retain) UIPickerView *areaPickerView;

@property(nonatomic, strong) NSString *gender;
@property(nonatomic, strong) NSString *area;

@property(nonatomic, strong) NSArray *genderList;
@property(nonatomic, strong) NSArray *areaList;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    self.genderList = @[@[@"1", @"男性"],
                        @[@"2", @"女性"]];
    
    self.areaList = @[@[@"1", @"北海道"],
                      @[@"2", @"東北"],
                      @[@"3", @"関東・信越"],
                      @[@"4", @"東海・北陸・近畿"],
                      @[@"5", @"中国・四国"],
                      @[@"6", @"九州"],
                      @[@"7", @"沖縄"]];
    
    // Gender TextField
    self.genderTextField = [[UITextField alloc] initWithFrame:CGRectMake(0,
                                                                         100,
                                                                         self.view.bounds.size.width,
                                                                         40)];
    self.genderTextField.delegate = self;
    self.genderTextField.tag = GENDER_FIELD_TAG;
    self.genderTextField.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.genderTextField];
    
    // Area TextField
    self.areaTextField = [[UITextField alloc] initWithFrame:CGRectMake(0,
                                                                       150,
                                                                       self.view.bounds.size.width,
                                                                       40)];
    self.areaTextField.delegate = self;
    self.areaTextField.tag = AREA_FIELD_TAG;
    self.areaTextField.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.areaTextField];
    
    // Gender picker
    self.genderPickerView = [[UIPickerView alloc] init];
    self.genderPickerView.delegate = self;
    self.genderPickerView.tag = GENDER_FIELD_TAG;
    self.genderPickerView.showsSelectionIndicator = YES;
    
    // Area picker
    self.areaPickerView = [[UIPickerView alloc] init];
    self.areaPickerView.delegate = self;
    self.areaPickerView.tag = AREA_FIELD_TAG;
    self.areaPickerView.showsSelectionIndicator = YES;
    
    // Keyboard toolbar
    self.keyboardToolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 38.0f)];
    self.keyboardToolbar.barStyle = UIBarStyleBlackTranslucent;
    
    UIBarButtonItem *spaceBarItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                                                                  target:nil
                                                                                  action:nil];
    
    UIBarButtonItem *doneBarItem = [[UIBarButtonItem alloc] initWithTitle:@"決定"
                                                                    style:UIBarButtonItemStyleDone
                                                                   target:self
                                                                   action:@selector(resignKeyboard:)];
    [self.keyboardToolbar setItems:@[spaceBarItem, doneBarItem]];
    
    self.genderTextField.inputAccessoryView = self.keyboardToolbar;
    self.genderTextField.inputView = self.genderPickerView;
    self.areaTextField.inputAccessoryView = self.keyboardToolbar;
    self.areaTextField.inputView = self.areaPickerView;
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)resignKeyboard:(id)sender
{
    id firstResponder = [self getFirstResponder];
    if ([firstResponder isKindOfClass:[UITextField class]]) {
        [firstResponder resignFirstResponder];
    }
}

- (id)getFirstResponder
{
    NSUInteger index = 0;
    while (index <= TEXT_FIELDS_COUNT) {
        UITextField *textField = (UITextField *)[self.view viewWithTag:index];
        if ([textField isFirstResponder]) {
            return textField;
        }
        index++;
    }
    return NO;
}

- (void)checkSpecialFields:(NSUInteger)tag
{
    if (tag == GENDER_FIELD_TAG && [self.genderTextField.text isEqualToString:@""]) {
        [self setGenderData];
    } else if (tag == AREA_FIELD_TAG && [self.areaTextField.text isEqualToString:@""]) {
        [self setAreaData];
    }
}

- (void)setGenderData
{
    NSInteger row = [self.genderPickerView selectedRowInComponent:0];
    self.genderTextField.text = self.genderList[row][1];
    self.gender = self.genderList[row][0];
}

- (void)setAreaData
{
    NSInteger row = [self.areaPickerView selectedRowInComponent:0];
    self.areaTextField.text = self.areaList[row][1];
    self.area = self.areaList[row][0];
}


#pragma mark - UITextFieldDelegate

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    NSUInteger tag = [textField tag];
    [self checkSpecialFields:tag];
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSUInteger tag = [textField tag];
    if (tag == GENDER_FIELD_TAG || tag == AREA_FIELD_TAG) {
        return NO;
    }
    return YES;
}


#pragma mark - UIPickerViewDataSource

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    NSUInteger tag = [pickerView tag];
    if (tag == GENDER_FIELD_TAG) {
        return self.genderList.count;
    } else if (tag == AREA_FIELD_TAG) {
        return self.areaList.count;
    }
    return 0;
}

#pragma mark - UIPickerViewDelegate

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    NSUInteger tag = [pickerView tag];
    if (tag == GENDER_FIELD_TAG) {
        return self.genderList[row][1];
    } else if (tag == AREA_FIELD_TAG) {
        return self.areaList[row][1];
    }
    return @"";
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    NSUInteger tag = [pickerView tag];
    if (tag == GENDER_FIELD_TAG) {
        [self setGenderData];
    } else if (tag == AREA_FIELD_TAG) {
        [self setAreaData];
    }
}


@end
