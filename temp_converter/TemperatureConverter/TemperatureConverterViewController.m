//
//  TemperatureConverterViewController.m
//  TemperatureConverter
//
//  Created by Y.CORP.YAHOO.COM\siddmoha on 7/29/13.
//  Copyright (c) 2013 Y.CORP.YAHOO.COM\siddmoha. All rights reserved.
//

#import "TemperatureConverterViewController.h"

@interface TemperatureConverterViewController ()

- (void)updateValues;

@end

@implementation TemperatureConverterViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Temperature";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.fahrenheitTextField.delegate = self;
    self.celciusTextField.delegate = self;
    [self.convertButtonField addTarget:self action:@selector(updateValues) forControlEvents:UIControlEventValueChanged];
    self.selectedField = YES;
    [self updateValues];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITextField delegate
- (BOOL) textFieldShouldBeginEditing:(UITextField *)textField {
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:(UIBarButtonSystemItemDone) target:(self) action:@selector(onDoneButton)];
    
    if (self.fahrenheitTextField == textField) {
        self.selectedField = YES;
    }
    else if (self.celciusTextField == textField) {
        self.selectedField = NO;
    }
    
    return YES;
}

- (BOOL) textFieldShouldEndEditing:(UITextField *)textField {
    self.navigationItem.rightBarButtonItem = nil;

    if (self.fahrenheitTextField == textField) {
        self.selectedField = YES;
    }
    else if (self.celciusTextField == textField) {
        self.selectedField = NO;
    }
    [self updateValues];
    
    return YES;
}

#pragma mark - Private methods

- (void) onDoneButton {
    [self.view endEditing:YES];
    [self updateValues];
}

- (void) updateValues {
    float fahrenheit = [self.fahrenheitTextField.text floatValue];
    float celcius = [self.celciusTextField.text floatValue];
    
    if (self.selectedField) {
        celcius = (fahrenheit - 32) * 5.0/9.0;
    }
    else {
        fahrenheit = (9.0 * celcius)/5.0 + 32.0;
    }
    
    self.fahrenheitTextField.text = [NSString stringWithFormat:@"%0.2f", fahrenheit ];
    self.celciusTextField.text = [NSString stringWithFormat:@"%0.2f", celcius ];
    
}



@end
