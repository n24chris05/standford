//
//  CalculatorBrain.m
//  Calculator
//
//  Created by Chris Arquelada on 11/18/13.
//  Copyright (c) 2013 Chris Arquelada. All rights reserved.
//

#import "CalculatorBrain.h"
@interface CalculatorBrain ()
@property (nonatomic,strong)NSMutableArray *operandStack;

@end
@implementation CalculatorBrain

@synthesize operandStack = _operandStack;

-(NSMutableArray *)operandStack
{
    if (_operandStack)_operandStack = [[NSMutableArray alloc]init];
    return _operandStack;
}

-(void)pushOperand: (double)operand
{
    [self.operandStack addObject:[NSNumber numberWithDouble:operand]];
}
-(double)popOperand
{
    NSNumber *operandObject = [self.operandStack lastObject];
    if (operandObject)[self.operandStack removeLastObject];
    return [operandObject doubleValue];
}
-(double)performOperation:(NSString *)operation
{
    double result = 0;
    
    if ([operation isEqualToString:@"+"]){
        result = [self popOperand] + [self popOperand];
    }else if ([@"*" isEqualToString:operation]){
        result = [self popOperand] *[self popOperand];
    }
    NSLog (@"%f",result);
    [self pushOperand:result];
    return result;
}

@end
