//
//  PossessionIndicatorUIView.m
//  CCGTracker
//
//  Created by Greg Heidorn on 4/25/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "PossessionIndicatorView.h"


@implementation PossessionIndicatorView


- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        // Initialization code
    }
    return self;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	NSLog(@"touchesBegan");
}


- (void)drawRect:(CGRect)rect {
    // Drawing code
}


- (void)dealloc {
    [super dealloc];
}


@end
