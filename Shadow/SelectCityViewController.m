//
//  SelectCityViewController.m
//  Shadow
//
//  Created by Test on 05/12/14.
//  Copyright (c) 2014 test. All rights reserved.
//

#import "SelectCityViewController.h"
#import "MBProgressHUD.h"
#import "cellCollectionViewCell.h"
#import "LandingViewController.h"
//#import "ServiceCall.h"
#import "GetCityServices.h"
#import "JSON.h"
#import "File.h"

@interface SelectCityViewController ()<UICollectionViewDelegate,UISearchBarDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) NSMutableArray *dataSource;
@property (strong, nonatomic) NSMutableArray *filterDataSource;
@property (strong, nonatomic) NSMutableArray *selectedCity;

@end

@implementation SelectCityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    GetCityServices *getCityServiceCallObject = [[GetCityServices alloc] init];
    self.dataSource = [[NSMutableArray alloc] init];
    self.filterDataSource = [[NSMutableArray alloc] init];
    self.selectedCity = [[NSMutableArray alloc] init];
    self.dataSource = [getCityServiceCallObject getWebData];
    self.filterDataSource = [getCityServiceCallObject getWebData];

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
    return [self.filterDataSource count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)cv cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    cellCollectionViewCell *cell = [cv dequeueReusableCellWithReuseIdentifier:@"cellCollectionViewCell" forIndexPath:indexPath];
    NSDictionary *info = self.filterDataSource[indexPath.row];
    [cell.btn setTitle:info[@"city_name"] forState:UIControlStateNormal];
    [cell.btn addTarget:self action:@selector(citySelected:) forControlEvents:UIControlEventTouchDown];
    [cell.btn setTag:indexPath.row];
    return cell;
}

-(IBAction)citySelected:(id)sender{
    UIButton *btn = (UIButton*)sender;
    [btn setSelected:(btn.selected) ? NO : YES];
    NSDictionary *info = self.filterDataSource[btn.tag];
    if(btn.selected)
    {
        if(![self.selectedCity containsObject:info])
           [self.selectedCity addObject:info];
    }else{
        if([self.selectedCity containsObject:info])
            [self.selectedCity removeObject:info];
    }
}
//- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
//{
//    // Add inset to the collection view if there are not enough cells to fill the width.
//    CGFloat cellSpacing = ((UICollectionViewFlowLayout *) collectionViewLayout).minimumLineSpacing;
//    CGFloat cellWidth = ((UICollectionViewFlowLayout *) collectionViewLayout).itemSize.width;
//    NSInteger cellCount = [collectionView numberOfItemsInSection:section];
//    CGFloat inset = (collectionView.bounds.size.width - (cellCount * (cellWidth + cellSpacing))) * 0.5;
//    inset = MAX(inset, 0.0);
//    return UIEdgeInsetsMake(0.0, inset, 0.0, 0.0);
//}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetsForItemAtIndexPath:(NSIndexPath *)indexPath {
    return UIEdgeInsetsMake(2, 2, 2, 2);
}

/*-(void)setData{
 for (int j = 00; j <=100; j++) {
 NSDictionary *dic = [[NSMutableDictionary alloc] init];
 if(j%2 == 0)
 [self.dataSource addObject:@"SACHIN"];
 else if (j%3 == 0)
 [self.dataSource addObject:@"JAI PRAKASH YADAV"];
 else if (j%5 == 0)
 [self.dataSource addObject:@"SHRI KRISHNA SHRAMNAM NAMAHE"];
 else if (j%7 ==0)
 [self.dataSource addObject:@"RASHDRIVING"];
 else
 [self.dataSource addObject:@"YASH"];
 }
 }*/

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    NSDictionary *info = self.filterDataSource[indexPath.row];
    return CGSizeMake([self getWidthofString:info[@"city_name"]], 40);
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

-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    [self getFilterDataForSearchString:searchText];
}

-(void)getFilterDataForSearchString:(NSString *)searchString{
    if(searchString.length>0){
        NSPredicate *predicate = [NSPredicate predicateWithFormat:
                                  [NSString stringWithFormat:@"SELF.city_name CONTAINS[cd] '%@'",searchString]];
        
         NSArray *res = [self.dataSource filteredArrayUsingPredicate:predicate];
        self.filterDataSource = (NSMutableArray*)res;
    }else
    self.filterDataSource = self.dataSource;
    [self.collectionView reloadData];
}

@end
