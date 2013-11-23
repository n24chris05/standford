//
//  FaceView.m
//  Happiness
//
//  Created by Chris Arquelada on 11/22/13.
//  Copyright (c) 2013 Chris Arquelada. All rights reserved.
//

#import "FaceView.h"


@implementation FaceView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)drawCircleAtPoint:(CGPoint)p withRadius:(CGFloat)radius inContext:(CGContextRef)context
{
    UIGraphicsPushContext(context); //call subroutine push context first
    CGContextBeginPath(context);
    CGContextAddArc(context, p.x, p.y, radius, 0, 2*M_PI, YES);
    CGContextStrokePath(context);
    
    UIGraphicsPopContext();//pop
}

#define DEFAULT_SCALE 0.90
- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext() ;
    
    CGPoint midPoint ; //get the midpoint
    midPoint.x = self.bounds.origin.x + self.bounds.size.width/2; //center
    midPoint.y = self.bounds.origin.y + self.bounds.size.height/2;
    
    //how big how i'm gonna make my face 90 %
    CGFloat  size = self.bounds.size.width /2;
    
    if (self.bounds.size.height < self.bounds.size.width) size = self.bounds.size.height /2;
    size *= DEFAULT_SCALE;
    
    //set linewidth and color
    CGContextSetLineWidth(context, 5.0);
    [[UIColor blueColor]setStroke];
    
    [self drawCircleAtPoint:midPoint withRadius:size inContext:context];
    //draw face (circle)
    
    
    //draw eyes (2 circles)
#define EYE_H 0.35
#define EYE_V 0.35
#define EYE_RADIUS 0.10
    
    CGPoint eyePoint;
    eyePoint.x = midPoint.x - size * EYE_H;
    eyePoint.y = midPoint.y - size * EYE_V;
    
    [self drawCircleAtPoint:eyePoint withRadius:size * EYE_RADIUS inContext:context];
    eyePoint.x +=size * EYE_H *2;
    [self drawCircleAtPoint:eyePoint withRadius:size * EYE_RADIUS inContext:context];
    

    //draw mouth
    
#define MOUTH_H 0.45
#define MOUTH_V 0.40
#define MOUTH_SMILE 0.25
    
    CGPoint mouthStart;
    mouthStart.x = midPoint.x - MOUTH_H *size;
    mouthStart.y = midPoint.y + MOUTH_V * size;
    CGPoint mouthEnd = mouthStart;
    mouthEnd.x += MOUTH_H *size * 2;
    CGPoint mouthCP1 = mouthStart;
    mouthCP1.x += MOUTH_H * size * 2/3;
    CGPoint mouthCP2 = mouthEnd;
    mouthCP2.x -=MOUTH_H * size * 2/3;
    
    
    float smile = 0;
    
    CGFloat smileOffSet = MOUTH_SMILE * size * smile;
    mouthCP1.y +=smileOffSet;
    mouthCP2.y +=smileOffSet;
    
    CGContextBeginPath(context);
    CGContextMoveToPoint(context, mouthStart.x, mouthStart.y);
    CGContextAddCurveToPoint(context, mouthCP1.x, mouthCP2.y, mouthCP2.x ,mouthCP2.y , mouthEnd.x, mouthEnd.y);
    CGContextStrokePath(context);
    

}


@end
