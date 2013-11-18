//
//  calculatorViewController.m
//  Calculator
//
//  Created by Chris Arquelada on 11/17/13.
//  Copyright (c) 2013 Chris Arquelada. All rights reserved.
//

#import "calculatorViewController.h"

@interface calculatorViewController ()

@end

@implementation calculatorViewController
@synthesize display = _display;

- (IBAction)digitPressed:(UIButton *)sender {
    NSString *myString = [sender currentTitle];
    NSLog (@"%@",myString);
}

@end
