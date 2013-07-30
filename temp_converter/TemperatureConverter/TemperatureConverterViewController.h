//
//  TemperatureConverterViewController.h
//  TemperatureConverter
//
//  Created by Y.CORP.YAHOO.COM\siddmoha on 7/29/13.
//  Copyright (c) 2013 Y.CORP.YAHOO.COM\siddmoha. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TemperatureConverterViewController : UIViewController <UITextFieldDelegate>

@property (nonatomic, strong) IBOutlet UITextField *celciusTextField;
@property (nonatomic, strong) IBOutlet UITextField *fahrenheitTextField;
@property (nonatomic, strong) IBOutlet UIButton *convertButtonField;
@property (nonatomic) BOOL selectedField;

- (IBAction)onDoneButton;
@end
