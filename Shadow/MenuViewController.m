//
//  MenuViewController.m
//  Shadow
//
//  Created by Test on 06/12/14.
//  Copyright (c) 2014 test. All rights reserved.
//

#import "MenuViewController.h"
#import "ProfileViewController.h"

@interface MenuViewController ()

@end

@implementation MenuViewController
@synthesize imgFirstArrow,imgSecondArrow;
@synthesize btnLogout;
@synthesize lblLogout,imgLogoutIcon;

- (void)viewDidLoad {
    [super viewDidLoad];
    btnLogout.hidden=YES;
    lblLogout.hidden=YES;
    imgLogoutIcon.hidden=YES;
    settingItem =[[NSArray alloc]initWithObjects:@"Notification Will Show on 1 hour",@"Notification Will Show on 2 hour",@"Notification Will Show on 6 hour",@"Notification Will Show on 12 hour",@"Notification Will Show on 24 hour",@"Notification Will Show on 36 hour",@"Notification Will Show on 1 Week",nil];

    imgSecondArrow.hidden=YES;
    imgFirstArrow.hidden=NO;
    tag=1;
    // Do any additional setup after loading the view from its nib.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(tag==1){
       return 10;
    }
    else{
        return [settingItem count];
    }
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *MyIdentifier = @"MyIdentifier";
    
    
    long indexValue =indexPath.row;
    NSLog(@"%ld",indexValue);
    
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellSelectionStyleNone
                                      reuseIdentifier:MyIdentifier];
    }
    if(tag==1){
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
     cell.backgroundColor = [UIColor clearColor];
    UIImageView *backgroundImage = [[UIImageView alloc]
                                    initWithFrame:CGRectMake(150, 10, 15, 15)];
    
    backgroundImage.image=[UIImage imageNamed:@"right_icon.png"];
    [cell.contentView addSubview:backgroundImage];
    
    UILabel *timeLbl = [[UILabel alloc] initWithFrame:CGRectMake(170,7,220,20)];
    timeLbl.font = [UIFont fontWithName:@"HelveticaNeun" size:12];
    timeLbl.tag=102;
    timeLbl.textColor =  [UIColor colorWithRed:180/255.0 green:213/255.0 blue:64/255.0 alpha:1];
    timeLbl.backgroundColor = [UIColor clearColor];
    timeLbl.numberOfLines =0;
    timeLbl.text=@"35 min ago";
    [cell.contentView addSubview:timeLbl];
    
    UILabel *categoryNameLbl = [[UILabel alloc] initWithFrame:CGRectMake(10,5,220,20)];
    categoryNameLbl.font = [UIFont fontWithName:@"HelveticaNeun" size:12];
    categoryNameLbl.tag=102;
    categoryNameLbl.textColor = [UIColor whiteColor];
    categoryNameLbl.backgroundColor = [UIColor clearColor];
    categoryNameLbl.numberOfLines =0;
    categoryNameLbl.text=@"@RobinBlack";
    [cell.contentView addSubview:categoryNameLbl];
    
    UILabel *descriptionLbl = [[UILabel alloc] initWithFrame:CGRectMake(10,30,220,35)];
    descriptionLbl.font = [UIFont fontWithName:@"Helvetica" size:13];
    descriptionLbl.tag=102;
    descriptionLbl.textColor = [UIColor whiteColor];
    descriptionLbl.backgroundColor = [UIColor clearColor];
    descriptionLbl.numberOfLines =0;
    descriptionLbl.text=@"Mentioned you in a Comment";
    [cell.contentView addSubview:descriptionLbl];
    }
    else{
        cell.backgroundColor = [UIColor clearColor];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;

        UILabel *settingtypeLbl = [[UILabel alloc] initWithFrame:CGRectMake(10,20,220,35)];
        settingtypeLbl.font = [UIFont fontWithName:@"Helvetica" size:13];
        settingtypeLbl.tag=102;
        settingtypeLbl.textColor = [UIColor whiteColor];
        settingtypeLbl.backgroundColor = [UIColor clearColor];
        settingtypeLbl.numberOfLines =0;
        settingtypeLbl.text=[settingItem objectAtIndex:indexPath.row];;
        [cell.contentView addSubview:settingtypeLbl];
        
        UIButton *shareButton = [UIButton buttonWithType:UIButtonTypeCustom];
        shareButton.frame = CGRectMake(210, 20,35 ,25);
        
        shareButton.backgroundColor = [UIColor clearColor];
        [shareButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        UIImage *shareImageNormal = [UIImage imageNamed:@"off.png"];
        UIImage *shareableButtonImageNormal = [shareImageNormal stretchableImageWithLeftCapWidth:12 topCapHeight:0];
        shareButton.tag=indexPath.row;
        [shareButton setBackgroundImage:shareableButtonImageNormal forState:UIControlStateNormal];
        [shareButton addTarget:self action:@selector(clickShare:) forControlEvents:UIControlEventTouchUpInside];
        [cell.contentView addSubview:shareButton];
        
        
    }
    
    return cell;
}
- (void)clickShare:(UIButton *)sender
{
    NSLog(@"%@",sender);
    
    if (!checked) {
        [sender setImage:[UIImage imageNamed:@"On.png"] forState:UIControlStateNormal];
        checked = YES;
        
        
    }
    
    else if (checked) {
        
        [sender setImage:[UIImage imageNamed:@"off.png"] forState:UIControlStateNormal];
        checked = NO;
    }
    
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 80;
    
}

-(IBAction)clickBack:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
    
    
}
-(IBAction)clickUserProfile:(id)sender{
    ProfileViewController *signin =[[ProfileViewController alloc]initWithNibName:@"ProfileViewController" bundle:nil];
    [self.navigationController pushViewController:signin animated:YES];
    
}
-(IBAction)clickSetting:(id)sender{
    tag=2;
    imgSecondArrow.hidden=NO;
    imgFirstArrow.hidden=YES;
    btnLogout.hidden=NO;
    lblLogout.hidden=NO;
    imgLogoutIcon.hidden=NO;

    [_tblNotification reloadData];
    
}
-(IBAction)clickNotification:(id)sender{
    tag=1;
    imgSecondArrow.hidden=YES;
    imgFirstArrow.hidden=NO;
    btnLogout.hidden=YES;
    lblLogout.hidden=YES;
    imgLogoutIcon.hidden=YES;

    [_tblNotification reloadData];

    
}
-(IBAction)clickLogout:(id)sender{
    [self.navigationController popToRootViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
