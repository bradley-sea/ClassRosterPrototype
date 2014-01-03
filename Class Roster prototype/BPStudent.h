//
//  BPStudent.h
//  Class Roster prototype
//
//  Created by Brad on 1/3/14.
//  Copyright (c) 2014 Brad. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BPStudent : NSObject

@property (strong,nonatomic)  NSString *firstName;
@property (strong,nonatomic) NSString *lastName;
@property (strong,nonatomic) UIImage *image;



-(BPStudent *)initWithFirstName:(NSString *)firstName LastName:(NSString *)lastName andImage:(UIImage *)image;


@end
