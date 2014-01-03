//
//  BPViewController.m
//  Class Roster prototype
//
//  Created by Brad on 1/3/14.
//  Copyright (c) 2014 Brad. All rights reserved.
//

#import "BPViewController.h"
#import "BPCourse.h"
#import "BPStudent.h"
#import "BPStudentViewController.h"


@interface BPViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) BPCourse *course;


@end

@implementation BPViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Students";
    
    self.course = [[BPCourse alloc] init];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self.tableView reloadData];
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.course.students.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"studentCell" forIndexPath:indexPath];
    
    BPStudent *studentForCell = self.course.students[indexPath.row];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@ %@", studentForCell.firstName, studentForCell.lastName];
    cell.imageView.image = studentForCell.image;
    cell.imageView.layer.cornerRadius = 22;
    cell.imageView.layer.masksToBounds = YES;

    return cell;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"studentPressed"])
    {
        BPStudentViewController *destinationVC = segue.destinationViewController;
        
        NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
        
        BPStudent *studentInCell = self.course.students[indexPath.row];
        
        destinationVC.selectedStudent = studentInCell;
    }
}

@end
