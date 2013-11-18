//
//  calculatorViewController.m
//  Calculator
//
//  Created by Chris Arquelada on 11/17/13.
//  Copyright (c) 2013 Chris Arquelada. All rights reserved.
//

#import "calculatorViewController.h"

@interface calculatorViewController ()
@property (nonatomic) BOOL userIsInTheMiddelOfEnteringANumber;
@end

@implementation calculatorViewController
@synthesize display = _display;
@synthesize userIsInTheMiddelOfEnteringANumber = _userIsInTheMiddelOfEnteringANumber;

- (IBAction)digitPressed:(UIButton *)sender {
    /*
    NSString *digit = [sender currentTitle];
    UILabel *myDisplay = self.display; //getting the pointer to UILabel
    //Get the current text of UILabel
    NSString *currentText = [myDisplay text];
    //Append text
    NSString *newText = [currentText stringByAppendingString:digit];
    [myDisplay setText:newText]; //push new text to display
     */
    
    NSString *digit = [sender currentTitle];
    if (self.userIsInTheMiddelOfEnteringANumber){
        self.display.text = [self.display.text stringByAppendingString:digit];
    }else{
    
        self.display.text = digit;
        self.userIsInTheMiddelOfEnteringANumber = YES;
    }
}

- (IBAction)operationPressed:(UIButton *)sender {
}

- (IBAction)enterPressed {
    
}


@end
