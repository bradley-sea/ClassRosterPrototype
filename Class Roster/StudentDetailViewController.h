//
//  StudentDetailViewController.h
//  Class Roster
//
//  Created by John Clem on 1/3/14.
//  Copyright (c) 2014 John Clem. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Student.h"

@interface StudentDetailViewController : UIViewController

- (id)initWithStudent:(Student *)student;

@property (nonatomic, weak) Student *student;


@end
