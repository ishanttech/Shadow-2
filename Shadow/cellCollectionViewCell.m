//
//  cellCollectionViewCell.m
//  iPhoneSample
//

#import "cellCollectionViewCell.h"

@implementation cellCollectionViewCell

- (void)awakeFromNib {
    // Initialization code
    UIImage *image = [UIImage imageNamed:@"tag_select_image.png"];
    UIEdgeInsets edgeInsets;
    edgeInsets.left = 10.0f;
    edgeInsets.top = 10.0f;
    edgeInsets.right = 50.0f; //Assume 5px will be the constant portion in your image
    edgeInsets.bottom = 10.0f;
    // image = [image resizableImageWithCapInsets:edgeInsets];
    UIImage *stretchableBackground = [image resizableImageWithCapInsets:UIEdgeInsetsMake(6, 6, 6, 37) resizingMode:UIImageResizingModeStretch];
    
    [self.btn setBackgroundImage:stretchableBackground forState:UIControlStateSelected];
    // Initialization code
    image = [UIImage imageNamed:@"box.png"];
    edgeInsets.left = 10.0f;
    edgeInsets.top = 10.0f;
    edgeInsets.right = 50.0f; //Assume 5px will be the constant portion in your image
    edgeInsets.bottom = 10.0f;
    stretchableBackground = [image resizableImageWithCapInsets:UIEdgeInsetsMake(6, 6, 6, 37) resizingMode:UIImageResizingModeStretch];
    [self.btn setBackgroundImage:stretchableBackground forState:UIControlStateNormal];
}


-(IBAction)selectCell:(id)sender{
  //  UIButton *btn = (UIButton*)sender;
       // [btn setSelected:(btn.selected) ? NO : YES];
}
@end
