//
//  CalculatorBrain.m
//  Calculator
//
//  Created by Chris Arquelada on 11/18/13.
//  Copyright (c) 2013 Chris Arquelada. All rights reserved.
//

#import "CalculatorBrain.h"
@interface CalculatorBrain ()
@property (nonatomic,strong)NSMutableArray *programStack;

@end
@implementation CalculatorBrain

@synthesize programStack = _programStack;

-(NSMutableArray *)programStack
{
    if (!_programStack)
        _programStack = [[NSMutableArray alloc]init];
    return _programStack;
}

-(void)pushOperand: (double)operand
{
    [self.programStack addObject:[NSNumber numberWithDouble:operand]];
}
-(double)popOperand
{
    NSNumber *operandObject = [self.operandStack lastObject];
    if (operandObject)[self.operandStack removeLastObject];
    return [operandObject doubleValue];
}
-(double)performOperation:(NSString *)operation
{
    [self.programStack addObject:operation];
    return [[CalculatorBrain runProgram:self.program]];
}
    double result = 0;
    
    if ([operation isEqualToString:@"+"]){
        result = [self popOperand] + [self popOperand];
    }else if ([@"*" isEqualToString:operation]){
        result = [self popOperand] *[self popOperand];
    }else if ([operation isEqualToString:@"-"]){
        result = [self popOperand] - [self popOperand];
        
    }else if ([operation isEqualToString:@"/"]){
    
    }
        [self pushOperand:result];
    return result;
}

@end
