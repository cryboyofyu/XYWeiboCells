//
//  XYJGGView.h
//  XYCustomJGGExample
//
//  Created by XY Lv on 16/12/6.
//  Copyright © 2016年 吕欣宇. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XYJGGView : UIView

//声明点击图片block
typedef void(^xyItemViewTapBlock)(UIView * xyItemView,NSMutableArray * xyPhotosDataMArr);
//初始化视图
- (instancetype)initWithFrame:(CGRect)xy_frame withXYPhotosDataMArr:(NSMutableArray *)xy_PhotosDataMArr withXYPlaceholderImg:(UIImage *)xy_placeholderImg withBgView:(UIView *)xy_bgView withXYItemViewTapBlock:(xyItemViewTapBlock)xy_itemViewTapBlock;

@property (nonatomic,copy)xyItemViewTapBlock xy_itemViewTapBlock;
//图片数据源（格式：uiimage,nsstring,url三种格式）
@property (nonatomic,strong)NSMutableArray * xy_PhotosDataMArr;
//获取该九宫格的高度
@property (nonatomic,assign)CGFloat xy_itemViewH;




@end




























