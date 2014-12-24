//
//  UniversityViewController.m
//  Shadow
//
//  Created by Test on 05/12/14.
//  Copyright (c) 2014 test. All rights reserved.
//

#import "UniversityViewController.h"
#import "MBProgressHUD.h"
#import "cellCollectionViewCell.h"
#import "LandingViewController.h"
#import "ServiceCall.h"
#import "JSON.h"
#import "File.h"

@interface UniversityViewController ()<UICollectionViewDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) NSMutableArray *dataSource;
@property (strong, nonatomic) NSMutableArray *selectedCell;

@end

@implementation UniversityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   // imgHidden.hidden=YES;
    ServiceCall *serviceCallObject = [[ServiceCall alloc] init];
    self.dataSource = [[NSMutableArray alloc] init];
    self.selectedCell = [[NSMutableArray alloc] init];

    self.dataSource = [serviceCallObject getWebData];
    // Do any additional setup after loading the view, typically from a nib.
    //  [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    NSString *nibName = @"cellCollectionViewCell";
    [self.collectionView registerNib:[UINib nibWithNibName:nibName bundle:nil] forCellWithReuseIdentifier:@"cellCollectionViewCell"];
    [self.collectionView reloadData];
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
    cellCollectionViewCell *cell = [cv dequeueReusableCellWithReuseIdentifier:@"cellCollectionViewCell" forIndexPath:indexPath];
    NSDictionary *info = self.dataSource[indexPath.row];
    [cell.btn setTitle:info[@"tag_name"] forState:UIControlStateNormal];
    [cell.btn addTarget:self action:@selector(citySelected:) forControlEvents:UIControlEventTouchDown];
    [cell.btn setTag:indexPath.row];
    //    cell.backgroundColor = [self colorForNumber:self.numbers[indexPath.row]];
    return cell;
}



- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetsForItemAtIndexPath:(NSIndexPath *)indexPath {
    return UIEdgeInsetsMake(2, 2, 2, 2);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    NSDictionary *info = self.dataSource[indexPath.row];
    return CGSizeMake([self getWidthofString:info[@"tag_name"]], 40);
}

-(IBAction)citySelected:(id)sender{
    UIButton *btn = (UIButton*)sender;
    [btn setSelected:(btn.selected) ? NO : YES];
    NSDictionary *info = self.dataSource[btn.tag];
    if(btn.selected)
    {
        if(![self.selectedCell containsObject:info])
            [self.selectedCell addObject:info];
    }else{
        if([self.selectedCell containsObject:info])
            [self.selectedCell removeObject:info];
    }
}

-(CGFloat)getWidthofString:(NSString*)string1{
    CGFloat width = self.collectionView.frame.size.width;
    CGSize constrainedSize = CGSizeMake(self.collectionView.frame.size.width, 40);
    
    NSDictionary *attributesDictionary = [NSDictionary dictionaryWithObjectsAndKeys:
                                          [UIFont fontWithName:@"HelveticaNeue" size:25.0], NSFontAttributeName,
                                          nil];
    
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:string1 attributes:attributesDictionary];
    
    CGRect requiredHeight = [string boundingRectWithSize:constrainedSize options:NSStringDrawingUsesLineFragmentOrigin context:nil];
    width = requiredHeight.size.width +20;
    return width;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)clickBack:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}


@end
