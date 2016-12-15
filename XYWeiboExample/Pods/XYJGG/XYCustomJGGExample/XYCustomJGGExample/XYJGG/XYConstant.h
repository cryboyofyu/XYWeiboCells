//
//  XYConstant.h
//  XYCustomJGGExample
//
//  Created by XY Lv on 16/12/6.
//  Copyright © 2016年 吕欣宇. All rights reserved.
//

#define XY_Width [UIScreen mainScreen].bounds.size.width
#define XY_Height [UIScreen mainScreen].bounds.size.height
#define XY(number) ([UIScreen mainScreen].bounds.size.width/320.00f *(number))
#define XY_Padding XY(5)
#define XY_DefaultPhotoH (XY_Width - XY_Padding *6)/3
#define XY_FourPhotoH  XY_DefaultPhotoH
#define XY_AlonePhotoH XY_DefaultPhotoH*2+XY_Padding
