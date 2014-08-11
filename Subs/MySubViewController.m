//
//  MySubViewController.m
//  Subs
//
//  Created by Paul Bunting on 8/11/14.
//  Copyright (c) 2014 boohoobahhumbug. All rights reserved.
//

#import "MySubViewController.h"

@interface MySubViewController ()

@end

@implementation MySubViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (UIButton*) simpleButtonWithLabel:(NSString*)label {
    UIButton* button = [[UIButton alloc] init];
    button.translatesAutoresizingMaskIntoConstraints = NO;
    [button setTitle:label forState:UIControlStateNormal];
    
    return button;
}

- (UIView*) simpleTextFieldWithLabel:(NSString*)label {
    UIView* view = [[UIView alloc] init];
    view.translatesAutoresizingMaskIntoConstraints = NO;
    view.backgroundColor = [UIColor greenColor];
    
    UILabel* labelComponent = [[UILabel alloc] init];
    labelComponent.translatesAutoresizingMaskIntoConstraints = NO;
    labelComponent.text = label;
    [view addSubview:labelComponent];
    
    UITextField* fieldComponent = [[UITextField alloc] init];
    fieldComponent.translatesAutoresizingMaskIntoConstraints = NO;
    fieldComponent.backgroundColor = [UIColor whiteColor];
    [view addSubview:fieldComponent];

    NSDictionary *viewsDictionary = NSDictionaryOfVariableBindings(labelComponent, fieldComponent);
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-20-[labelComponent]-12-[fieldComponent(>=100)]-20-|" options:NSLayoutFormatAlignAllBaseline|NSLayoutFormatDirectionLeadingToTrailing metrics:nil views:viewsDictionary]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[labelComponent]-20-|" options:0 metrics:nil views:viewsDictionary]];

    return view;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor redColor];
    
    UIView* firstRow = [self simpleTextFieldWithLabel:@"Given Names"];
    [self.view addSubview:firstRow];

    UIView* secondRow = [self simpleTextFieldWithLabel:@"Family Names"];
    [self.view addSubview:secondRow];
//    UIView* secondRow = [[UIView alloc] init];
//    secondRow.translatesAutoresizingMaskIntoConstraints = NO;
//    secondRow.backgroundColor = [UIColor darkGrayColor];
//    [self.view addSubview:secondRow];

    UIButton* okButton = [self simpleButtonWithLabel:@"OK"];
    [self.view addSubview:okButton];

    UIButton* cancelButton = [self simpleButtonWithLabel:@"Cancel"];
    [self.view addSubview:cancelButton];

    NSDictionary *viewsDictionary = NSDictionaryOfVariableBindings(okButton, cancelButton, firstRow, secondRow);
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-20-[firstRow]-20-|" options:0 metrics:nil views:viewsDictionary]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-20-[secondRow]-20-|" options:0 metrics:nil views:viewsDictionary]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-20-[okButton]-12-[cancelButton(==okButton)]-20-|" options:NSLayoutFormatAlignAllBaseline|NSLayoutFormatDirectionLeadingToTrailing metrics:nil views:viewsDictionary]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[firstRow]-12-[secondRow(==firstRow)]-12-[okButton]-20-|" options:0 metrics:nil views:viewsDictionary]];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
