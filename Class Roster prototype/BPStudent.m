//
//  BPStudent.m
//  Class Roster prototype
//
//  Created by Brad on 1/3/14.
//  Copyright (c) 2014 Brad. All rights reserved.
//

#import "BPStudent.h"

@interface BPStudent ()

@property UIImage *studentImage;

@end

@implementation BPStudent

-(BPStudent *)initWithFirstName:(NSString *)first LastName:(NSString *)last andImage:(UIImage *)image
{
    self = [super init];
    
    if (self)
        
    {
        self.firstName = first;
        self.lastName = last;
        self.image = image;
    }
    
    return self;
}


@end
