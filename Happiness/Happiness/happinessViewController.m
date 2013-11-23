//
//  happinessViewController.m
//  Happiness
//
//  Created by Chris Arquelada on 11/22/13.
//  Copyright (c) 2013 Chris Arquelada. All rights reserved.
//

#import "happinessViewController.h"
#import "FaceView.h"
@interface happinessViewController ()
@property (nonatomic, weak)IBOutlet FaceView *faceview;

@end
@implementation happinessViewController

@synthesize happiness = _happiness;
@synthesize faceview = _faceview;


-(void)setHappiness:(int)happiness
{
    _happiness = happiness;
    [self.faceview setNeedsDisplay];
}

//support autoRotation



@end