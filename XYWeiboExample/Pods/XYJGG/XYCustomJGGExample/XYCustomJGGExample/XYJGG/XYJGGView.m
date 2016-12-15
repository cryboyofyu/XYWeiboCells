//
//  XYJGGView.m
//  XYCustomJGGExample
//
//  Created by XY Lv on 16/12/6.
//  Copyright © 2016年 吕欣宇. All rights reserved.
//

#import "XYJGGView.h"
#import "XYConstant.h"
#import "UIImageView+WebCache.h"
@implementation XYJGGView

- (instancetype)initWithFrame:(CGRect)xy_frame withXYPhotosDataMArr:(NSMutableArray *)xy_PhotosDataMArr withXYPlaceholderImg:(UIImage *)xy_placeholderImg withBgView:(UIView *)xy_bgView withXYItemViewTapBlock:(xyItemViewTapBlock)xy_itemViewTapBlock{
    for(UIView * view in xy_bgView.subviews){
        if([view isKindOfClass:[self class]]){
            [view removeFromSuperview];
        }
    }
    
    self = [super initWithFrame:xy_frame];
    if(self){
        self.xy_PhotosDataMArr = [NSMutableArray arrayWithArray:xy_PhotosDataMArr];
        self.xy_itemViewTapBlock = xy_itemViewTapBlock;
        CGFloat xy_itemX;
        CGFloat xy_itemY;
        CGFloat xy_itemW = 0;
        int     xy_count = 1;
        CGFloat xy_itemViewH = xy_frame.size.height;
        if(xy_PhotosDataMArr.count>0){
            if((xy_PhotosDataMArr.count>1&&xy_PhotosDataMArr.count<4)||(xy_PhotosDataMArr.count>4&&xy_PhotosDataMArr.count<10)){
                xy_itemW = XY_DefaultPhotoH;
                xy_count = 3;
            }else if(xy_PhotosDataMArr.count == 4){
                xy_itemW = XY_FourPhotoH;
                xy_count = 2;
            }else if(xy_PhotosDataMArr.count == 1){
                xy_itemW = XY_AlonePhotoH;
                xy_count = 1;
            }
        }

        for(int i=0;i<xy_PhotosDataMArr.count;i++){
            UIImageView * imgView = [[UIImageView alloc]init];
            imgView.contentMode = UIViewContentModeScaleAspectFill;
            imgView.layer.masksToBounds = YES;
            xy_itemX = (xy_itemW + XY_Padding)*(i%xy_count);
            xy_itemY = (xy_itemW + XY_Padding)*(i/xy_count);
            imgView.frame = CGRectMake(xy_itemX, xy_itemY, xy_itemW, xy_itemW);
            imgView.tag = i;
            if(i==(xy_PhotosDataMArr.count-1)){
                xy_itemViewH = xy_itemY + xy_itemW + XY_Padding*2;
                self.xy_itemViewH = xy_itemViewH;
                CGRect itemViewFrame = CGRectMake(xy_frame.origin.x, xy_frame.origin.y, xy_frame.size.width, xy_itemViewH);
                self.frame = itemViewFrame;
                
            }
            [self addSubview:imgView];
            imgView.userInteractionEnabled = YES;
            UITapGestureRecognizer * imgTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(xyItemViewTap:)];
            [imgView addGestureRecognizer:imgTap];
            if([xy_PhotosDataMArr[i] isKindOfClass:[NSURL class]]){
                [imgView sd_setImageWithURL:xy_PhotosDataMArr[i] placeholderImage:xy_placeholderImg];

            }else if([xy_PhotosDataMArr[i] isKindOfClass:[NSString class]]){
             [imgView sd_setImageWithURL:[NSURL URLWithString:xy_PhotosDataMArr[i]] placeholderImage:xy_placeholderImg];
                
            }else if([xy_PhotosDataMArr[i] isKindOfClass:[UIImage class]]){
                [imgView setImage:xy_PhotosDataMArr[i]];

            }
            
        }
        
    }
    
    [xy_bgView addSubview:self];
    return self;
}

- (void)xyItemViewTap:(UITapGestureRecognizer *)xySender{
    
    if(self.xy_itemViewTapBlock){
        self.xy_itemViewTapBlock(xySender.view,_xy_PhotosDataMArr);
    }
    
}



@end












