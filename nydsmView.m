//
//  nydsmView.m
//  nydsm
//
//  Created by suraj kesavan on 11/03/16.
//  Copyright © 2016 suraj kesavan. All rights reserved.
//

#import "nydsmView.h"
#import "circle.h"

@implementation nydsmView

- (instancetype)initWithFrame:(NSRect)frame isPreview:(BOOL)isPreview
{
    self = [super initWithFrame:frame isPreview:isPreview];
    if (self) {
        [self setAnimationTimeInterval:1/30.0];
    }
    return self;
}

- (void)startAnimation
{
    [super startAnimation];
}

- (void)stopAnimation
{
    [super stopAnimation];
}

- (void)drawRect:(NSRect)rect
{
    [super drawRect:rect];
}

- (void)animateOneFrame
{
    NSBezierPath *path;
    NSRect rect;
    NSSize size;
    NSColor *color;
    float red, green, blue, alpha;
    int shapeType;
    
    size = [self bounds].size;
    rect.size = NSMakeSize(SSRandomFloatBetween(size.width/100.0, size.width/100.0), SSRandomFloatBetween(size.height/100.0, size.height/100.0));
    rect.origin = SSRandomPointForSizeWithinRect(rect.size, [self bounds]);
    shapeType = SSRandomIntBetween(0, 2);
    
    float startAngle, endAngle, radius;
    NSPoint point;
    startAngle = SSRandomFloatBetween(0.0, 360.0);
    endAngle = SSRandomFloatBetween(startAngle, 360.0 + startAngle);
    radius = rect.size.width <= rect.size.height ? rect.size.width/2 : rect.size.height/2;
    point = NSMakePoint(rect.origin.x + rect.size.width/2 , rect.origin.y + rect.size.height/2);
    path = [NSBezierPath bezierPath];
    [path appendBezierPathWithArcWithCenter:point radius:radius startAngle:startAngle endAngle:endAngle clockwise:SSRandomIntBetween(0, 1)];
    
    red = SSRandomFloatBetween(0.0, 255.0)/255.0;
    green = SSRandomFloatBetween(0.0, 255.0)/255.0;
    blue = SSRandomFloatBetween(0.0, 255.0)/255.0;
    alpha = SSRandomFloatBetween(0.0, 255.0)/255.0;
    
    color = [NSColor colorWithCalibratedRed:red green:green blue:blue alpha:alpha];
    [color set];
    [path stroke];
   
    return;
}

- (BOOL)hasConfigureSheet
{
    return NO;
}

- (NSWindow*)configureSheet
{
    return nil;
}

@end
