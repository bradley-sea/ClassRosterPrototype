//
//  Student.h
//  Class Roster
//
//  Created by John Clem on 1/3/14.
//  Copyright (c) 2014 John Clem. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Student : NSObject

- (instancetype) initWithName:(NSString *)name;

@property (nonatomic) NSString *name;
@property (nonatomic) NSString *twitter;
@property (nonatomic) NSString *github;
@property (nonatomic) UIImage *profilePicture;

@end
