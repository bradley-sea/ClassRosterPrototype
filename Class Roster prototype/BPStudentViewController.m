//
//  BPStudentViewController.m
//  Class Roster prototype
//
//  Created by Brad on 1/3/14.
//  Copyright (c) 2014 Brad. All rights reserved.
//

#import "BPStudentViewController.h"

@interface BPStudentViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *studentImage;

@end

@implementation BPStudentViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated
{
    self.title = self.selectedStudent.firstName;
    
    [super viewWillAppear:animated];
    self.studentImage.layer.cornerRadius = 25;
    self.studentImage.layer.masksToBounds = YES;

    self.studentImage.image = self.selectedStudent.image;
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
