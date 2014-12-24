//
//  NewEventDetailViewController.m
//  Shadow
//
//  Created by Test on 10/12/14.
//  Copyright (c) 2014 test. All rights reserved.
//

#import "NewEventDetailViewController.h"

@interface NewEventDetailViewController ()

@end

@implementation NewEventDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)clickBack:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
