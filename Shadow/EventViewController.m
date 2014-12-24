//
//  EventViewController.m
//  Shadow
//
//  Created by Test on 05/12/14.
//  Copyright (c) 2014 test. All rights reserved.
//

#import "EventViewController.h"
#import "EventShareViewController.h"
#import "NewEventDetailViewController.h"

@interface EventViewController ()

@end

@implementation EventViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)clickEventDetail:(id)sender{
   NewEventDetailViewController *eventShare =[[NewEventDetailViewController alloc]initWithNibName:@"NewEventDetailViewController" bundle:nil];
    [self.navigationController pushViewController:eventShare animated:YES];
    
}
-(IBAction)clickMore:(id)sender{
    EventShareViewController *eventShare =[[EventShareViewController alloc]initWithNibName:@"EventShareViewController" bundle:nil];
    [self.navigationController pushViewController:eventShare animated:YES];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
