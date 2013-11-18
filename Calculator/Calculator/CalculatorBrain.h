//
//  CalculatorBrain.h
//  Calculator
//
//  Created by Chris Arquelada on 11/18/13.
//  Copyright (c) 2013 Chris Arquelada. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalculatorBrain : NSObject

-(void)pushOperand: (double)operand;
-(double)performOperation:(NSString *)operation;


@end
