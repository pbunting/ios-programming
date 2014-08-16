//
//  OHTViewController.m
//  popover
//
//  Created by Paul Bunting on 12/08/2014.
//  Copyright (c) 2014 100 Trees. All rights reserved.
//

#import "OHTPopoverViewController.h"
#import "MySubViewController.h"

@interface OHTPopoverViewController ()

@property (nonatomic, strong)UIPopoverController* popover;
@property (nonatomic, strong)MySubViewController* controller;

@end

@implementation OHTPopoverViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)launchAction:(id)sender {
    _controller = [[MySubViewController alloc] init];
    
    if (_popover) {
        [_popover dismissPopoverAnimated:YES];
        _popover = nil;
    } else {
        _popover = [[UIPopoverController alloc] initWithContentViewController:_controller];
    
        [_popover setPopoverContentSize:CGSizeMake(300, 300)];
        [_popover presentPopoverFromRect:CGRectMake(10, 10, 300, 300) inView:self.view permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    }
}

@end
