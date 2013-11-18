//
//  calculatorViewController.m
//  Calculator
//
//  Created by Chris Arquelada on 11/17/13.
//  Copyright (c) 2013 Chris Arquelada. All rights reserved.
//

#import "calculatorViewController.h"
#import "CalculatorBrain.h"

@interface calculatorViewController ()
@property (nonatomic) BOOL userIsInTheMiddelOfEnteringANumber;
@property (nonatomic,strong)CalculatorBrain *brain;
@end

@implementation calculatorViewController
@synthesize display = _display;
@synthesize userIsInTheMiddelOfEnteringANumber = _userIsInTheMiddelOfEnteringANumber;
@synthesize brain = _brain;

-(CalculatorBrain *)brain
{
    if (!_brain) _brain = [[CalculatorBrain alloc]init];
    return _brain;
}
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

- (IBAction)enterPressed {
    
    [self.brain pushOperand:[self.display.text doubleValue]];
    self.userIsInTheMiddelOfEnteringANumber = NO;
}

- (IBAction)operationPressed:(UIButton *)sender
{
    if (self.userIsInTheMiddelOfEnteringANumber)[self enterPressed];
    double result = [self.brain performOperation:sender.currentTitle];
    NSString *resultString = [NSString stringWithFormat:@"%g",result];
    self.display.text = resultString;
}

@end
