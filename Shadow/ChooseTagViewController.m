//
//  ChooseTagViewController.m
//  Shadow
//
//  Created by Test on 15/12/14.
//  Copyright (c) 2014 test. All rights reserved.
//

#import "ChooseTagViewController.h"
#import "MBProgressHUD.h"
#import "CellSelectCollectionViewCell.h"
#import "LandingViewController.h"
#import "ServiceCall.h"
#import "JSON.h"
#import "File.h"


#define IS_IPHONE5 (([[UIScreen mainScreen] bounds].size.height-568)?NO:YES)

@interface ChooseTagViewController ()<UICollectionViewDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) NSMutableArray *dataSource;
@property (strong, nonatomic) NSMutableArray *selectedTag;

@end

@implementation ChooseTagViewController
@synthesize strdate,strEmail,strTime,strVenue,strDescription,strAddress;
@synthesize TblTags,getImage,imgHidden;
@synthesize btnShare;

- (void)viewDidLoad {
    [super viewDidLoad];
    imgHidden.hidden=YES;
    ServiceCall *serviceCallObject = [[ServiceCall alloc] init];
    self.dataSource = [[NSMutableArray alloc] init];
    self.selectedTag = [[NSMutableArray alloc] init];
    self.dataSource = [serviceCallObject getWebData];
    // Do any additional setup after loading the view, typically from a nib.
    //  [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    NSString *nibName = @"CellSelectCollectionViewCell";
    [self.collectionView registerNib:[UINib nibWithNibName:nibName bundle:nil] forCellWithReuseIdentifier:@"CellSelectCollectionViewCell"];
    [self.collectionView reloadData];

    
    
    
    
    imgHidden.image =getImage;
     NSLog(@"%@",getImage);
    NSLog(@"%@",strAddress);
    NSLog(@"%@",strEmail);
    NSLog(@"%@",strTime);
    NSLog(@"%@",strVenue);
    NSLog(@"%@",strDescription);
    NSLog(@"%@",strAddress);
    [self Layout];
    nsUrlResponseData =[[NSMutableData alloc]init];
    arSelectedRows = [[NSMutableArray alloc] init];
   
   
    // Do any additional setup after loading the view from its nib.
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    //[self removeIndexPath:indexPath];
}

#pragma mark - UICollectionView Datasource

- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section {
    return [self.dataSource count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)cv cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CellSelectCollectionViewCell *cell = [cv dequeueReusableCellWithReuseIdentifier:@"CellSelectCollectionViewCell" forIndexPath:indexPath];
    NSDictionary *info = self.dataSource[indexPath.row];
    [cell.btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [cell.btn setTitle:info[@"tag_name"] forState:UIControlStateNormal];
    [cell.btn addTarget:self action:@selector(chooseTag:) forControlEvents:UIControlEventTouchDown];

    //    cell.backgroundColor = [self colorForNumber:self.numbers[indexPath.row]];
    return cell;
}

-(IBAction)chooseTag:(id)sender{
    UIButton *btn = (UIButton*)sender;
    [btn setSelected:(btn.selected) ? NO : YES];
    NSDictionary *info = self.dataSource[btn.tag];
    if(btn.selected)
    {
        if(![self.selectedTag containsObject:info])
            [self.selectedTag addObject:info];
    }else{
        if([self.selectedTag containsObject:info])
            [self.selectedTag removeObject:info];
    }
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetsForItemAtIndexPath:(NSIndexPath *)indexPath {
    return UIEdgeInsetsMake(2, 2, 2, 2);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    NSDictionary *info = self.dataSource[indexPath.row];
    return CGSizeMake([self getWidthofString:info[@"tag_name"]], 40);
}

-(CGFloat)getWidthofString:(NSString*)string1{
    CGFloat width = self.collectionView.frame.size.width;
    CGSize constrainedSize = CGSizeMake(self.collectionView.frame.size.width, 40);
    
    NSDictionary *attributesDictionary = [NSDictionary dictionaryWithObjectsAndKeys:
                                          [UIFont fontWithName:@"HelveticaNeue" size:25.0], NSFontAttributeName,
                                          nil];
    
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:string1 attributes:attributesDictionary];
    
    CGRect requiredHeight = [string boundingRectWithSize:constrainedSize options:NSStringDrawingUsesLineFragmentOrigin context:nil];
    width = requiredHeight.size.width +25;
    return width;
}

-(void)Layout{
     if(IS_IPHONE5){
         TblTags.frame =CGRectMake(0, 57, 320, 500);
     }
     else{
         
     }
}
-(IBAction)clickBack:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
    
}


-(IBAction)clickShare:(id)sender{
     [btnShare setEnabled: NO];
    
    [self saveUploadImage];
    
}
-(void)saveUploadImage{
    
    [self.activityIndicatorView startAnimating];
    
    
     NSLog(@"%@",strTime);
   
    NSData *imageData = UIImageJPEGRepresentation(imgHidden.image, 0.3f);
    NSLog(@"%@",imageData);
    
    // NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:@"http://society-app.com/api/voucher/voucherAdd?"]];
    
    NSString *urlString =[NSString stringWithFormat:@"http://techwatts.com/shadowapp/api/post/event_post"]; // URL of upload script.
    NSLog(@"%@",urlString);
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:urlString]];
    [request setHTTPMethod:@"POST"];
    NSString *boundary = @"---------------------------14737809831466499882746641449";
    NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@", boundary];
    [request addValue:contentType forHTTPHeaderField:@"Content-Type"];
    
    NSMutableData *body = [NSMutableData data];
    NSLog(@"%@",body);
    
    
    //  parameter imageData
    [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[@"Content-Disposition: form-data; name=\"file\"; filename=\"test.jpg\"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[@"Content-Type: application/octet-stream\r\n\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[NSData dataWithData:imageData]];
    [body appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
    
    // user id
    //  parameter mobilenumber
    [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"user_id\"\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[@"29" dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
    
    
    
    
    //  Post Title
    [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"post_title\"\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[strAddress dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
    
    
    //  Date
   [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"Date\"\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[strdate dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
   // [body appendData:[[NSString stringWithFormat:@"--%@--\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    
    
    // Time
    [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"event_time\"\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[@"123456" dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
   // [body appendData:[[NSString stringWithFormat:@"--%@--\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    
    
    // Venue
    [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"Venue\"\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[strVenue dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
    //[body appendData:[[NSString stringWithFormat:@"--%@--\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    
    // Choose Tag
    [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"tag\"\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[@"Music" dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
    //[body appendData:[[NSString stringWithFormat:@"--%@--\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    
    
    // Choose description
    [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"description\"\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[strDescription dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
    //[body appendData:[[NSString stringWithFormat:@"--%@--\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];*/
    
    
    [request setHTTPBody:body];
    NSError *error;
    NSData *returnData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil     error:&error];
    if (returnData)
    {
        [self.activityIndicatorView stopAnimating];
        //[HUD hide:YES];
        NSString *str=[[NSString alloc] initWithData:returnData encoding:NSUTF8StringEncoding];
        NSLog(@"Resp string: %@",str);
         allData = [str JSONValue];
        NSLog(@"%@",allData);
        NSString *getMessage = [allData valueForKey:@"message"];
        NSLog(@"%@",getMessage);
        [btnShare setEnabled: YES];
        if([getMessage isEqualToString:@"Invalid parameters"]){
            // NSString *getmessage=[NSString stringWithFormat:@"You have earned %@ point",getPoint];
            UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"SHADOW"
                                                              message:getMessage
                                                             delegate:nil
                                                    cancelButtonTitle:@"OK"
                                                    otherButtonTitles:nil];
            
            [message show];
           
            
            
        }
        else{
            
           // getData =[allData valueForKey:@"data"];
           // NSLog(@"%@",getData);
           // NSString *getPoint =[getData valueForKey:@"point"];
           // NSLog(@"%@",getPoint);
            
            //  NSInteger getvalue= [amoutField.text integerValue] * 10;
          //  NSString *getmessage=[NSString stringWithFormat:@"You have earned %@ point",getPoint];
            UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"SHADOW"
                                                              message:@"SuccessFully Added Your Post"
                                                             delegate:nil
                                                    cancelButtonTitle:@"OK"
                                                    otherButtonTitles:nil];
            
            [message show];
            LandingViewController *landing =[[LandingViewController alloc]initWithNibName:@"LandingViewController" bundle:nil];
            [self.navigationController pushViewController:landing animated:YES];
        }
        //}
    }
    else
    {
        NSLog(@"Error: %@", error);
    }

}




@end
