//
//  BPCourse.m
//  Class Roster prototype
//
//  Created by Brad on 1/3/14.
//  Copyright (c) 2014 Brad. All rights reserved.
//

#import "BPCourse.h"
#import "BPStudent.h"

@implementation BPCourse

-(BPCourse *)init
{
    self = [super init];
    
    if (self)
    {
        [self createStudents];
    }
    
    return self;
    
}

-(void)createStudents
{
    BPStudent *student1 = [[BPStudent alloc] initWithFirstName:@"Brad" LastName:@"Johnson" andImage:[UIImage imageNamed:@"Brad"]];
    
    BPStudent *student2 = [[BPStudent alloc] initWithFirstName:@"Mike" LastName:@"Strand" andImage:[UIImage imageNamed:@"Mike"]];
    
    BPStudent *student3 = [[BPStudent alloc] initWithFirstName:@"Danny" LastName:@"Cushing" andImage:[UIImage imageNamed:@"Danny"]];
    
    BPStudent *student4 = [[BPStudent alloc] initWithFirstName:@"Megha" LastName:@"Gulati" andImage:[UIImage imageNamed:@"Megha"]];

    BPStudent *student5 = [[BPStudent alloc] initWithFirstName:@"Will" LastName:@"Kamp" andImage:[UIImage imageNamed:@"Will"]];
    
    BPStudent *student6 = [[BPStudent alloc] initWithFirstName:@"Jason" LastName:@"Koceja" andImage:[UIImage imageNamed:@"Jason"]];
    
    self.students = @[student1, student2, student3, student4,student5,student6];
}

@end
