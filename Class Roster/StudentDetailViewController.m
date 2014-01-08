//
//  StudentDetailViewController.m
//  Class Roster
//
//  Created by John Clem on 1/3/14.
//  Copyright (c) 2014 John Clem. All rights reserved.
//

#import "StudentDetailViewController.h"

@interface StudentDetailViewController () <UIImagePickerControllerDelegate, UINavigationControllerDelegate,UITextFieldDelegate>

@property (nonatomic, weak) IBOutlet UILabel *studentNameLabel;
@property (nonatomic, weak) IBOutlet UIButton *studentPhotoButton;
@property (weak, nonatomic) IBOutlet UITextField *twitterTextBox;
@property (weak, nonatomic) IBOutlet UITextField *gitTextBox;

@end

@implementation StudentDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (id)initWithStudent:(Student *)student
{
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        self.student = student;
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.twitterTextBox.delegate = self;
    self.gitTextBox.delegate = self;
    

    [_studentPhotoButton setUserInteractionEnabled:NO];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    if (_student) {
        [_studentNameLabel setText:_student.name];
        if (_student.twitter)
            self.twitterTextBox.text = _student.twitter;
        if (_student.github)
            self.gitTextBox.text = _student.github;
        if (_student.profilePicture) {
            [_studentPhotoButton setBackgroundImage:nil forState:UIControlStateNormal];
            [_studentPhotoButton setImage:_student.profilePicture forState:UIControlStateNormal];
            [_studentPhotoButton setUserInteractionEnabled:NO];
            [_studentPhotoButton.layer setMasksToBounds:YES];
            [_studentPhotoButton.layer setCornerRadius:128.f];
            [_studentPhotoButton setTitle:@"" forState:UIControlStateNormal];
        } else {
            [_studentPhotoButton setUserInteractionEnabled:YES];
        }
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Actions

- (IBAction)takeStudentPhoto:(id)sender
{
    UIImagePickerController *imagePickerVC = [[UIImagePickerController alloc] init];
    [imagePickerVC setDelegate:self];
    [imagePickerVC setSourceType:UIImagePickerControllerSourceTypeCamera];
    [imagePickerVC setAllowsEditing:YES];
    [self presentViewController:imagePickerVC animated:YES completion:nil];
}

#pragma mark - UIImagePickerControllerDelegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    NSLog(@"Finished Picking Photo: %@", info[UIImagePickerControllerEditedImage]);
    
    [picker dismissViewControllerAnimated:YES completion:^{
        _student.profilePicture = info[UIImagePickerControllerEditedImage];
        [_studentPhotoButton setBackgroundImage:nil forState:UIControlStateNormal];
        [_studentPhotoButton setImage:_student.profilePicture forState:UIControlStateNormal];
        [_studentPhotoButton setUserInteractionEnabled:NO];
        [_studentPhotoButton.layer setMasksToBounds:YES];
        [_studentPhotoButton.layer setCornerRadius:128.f];
        [_studentPhotoButton setTitle:@"" forState:UIControlStateNormal];
        
        NSData *pngData = UIImagePNGRepresentation(_student.profilePicture);
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES);
        NSString *documentsPath = [paths objectAtIndex:0];
        NSString *fileName = [NSString stringWithFormat:@"%@.png", _student.name];
        NSString *filePath = [documentsPath stringByAppendingString:fileName];
        [pngData writeToFile:filePath atomically:YES];
        
    }];
}

#pragma mark - UITextFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return NO;
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    NSInteger index = 0;
    
    NSPropertyListFormat format;
    NSString *errorDesc = nil;
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES);
    NSString *documentsPath = [paths objectAtIndex:0];
    NSString *filePath = [documentsPath stringByAppendingString:@"students.plist"];
    
    
    NSData *plistData = [[NSData alloc] initWithContentsOfFile:filePath];
    
    NSMutableArray *temp = (NSMutableArray *)[NSPropertyListSerialization propertyListFromData:plistData mutabilityOption:NSPropertyListMutableContainersAndLeaves format:&format errorDescription:&errorDesc];
    
    for (NSDictionary *studentDictionary in temp)
    {
        if ([[studentDictionary objectForKey:@"name"] isEqualToString:_student.name])
        {
            index = [temp indexOfObject:studentDictionary];
            NSLog(@"inside our loop: %ld", (long)index);
            break;
        }
    }
    
    [temp replaceObjectAtIndex:index withObject:@{@"name": _student.name, @"twitter" : self.twitterTextBox.text, @"github" : self.gitTextBox.text}];
   
    NSData *tempData = [NSPropertyListSerialization dataFromPropertyList:temp format:NSPropertyListXMLFormat_v1_0 errorDescription:&errorDesc];
    if (tempData)
    {
        [tempData writeToFile:filePath atomically:YES];
    }
}

@end
