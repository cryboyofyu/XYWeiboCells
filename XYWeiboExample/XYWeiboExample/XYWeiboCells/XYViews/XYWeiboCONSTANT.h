//
//  XYCONSTANT.h
//  XYWeiboExample
//
//  Created by XY Lv on 16/12/12.
//  Copyright © 2016年 吕欣宇. All rights reserved.
//  github:https://github.com/cryboyofyu
//  博客:http://blog.csdn.net/cry__boy


#define xy_statement @"还给大家提供了美女哦～就冲这照片是不是就得给个赞~欣宇最帅~,github给个赞:https://github.com/cryboyofyu"
#define xy_width [UIScreen mainScreen].bounds.size.width
#define xy_height [UIScreen mainScreen].bounds.size.height
#define xy(number) ([UIScreen mainScreen].bounds.size.width/320.00f *(number))
#define xy_padding xy(5)

//HomeConfig
#define xy_grayColor [UIColor colorWithRed:0.95 green:0.95 blue:0.95 alpha:1.00]
#define xy_cellH xy(150)
#define xy_cellBgImgViewCornerRadius xy(5)
#define xy_defaultPhotoH (xy_width - xy_padding *6)/3
#define xy_fourPhotoH  xy_defaultPhotoH
#define xy_alonePhotoH xy_defaultPhotoH*2+xy_padding
#define xy_userNameLableW xy(150)
#define xy_userNameColor_official [UIColor redColor]
#define xy_transpondContentTextFont xy(13)
#define xy_messageListStatusBgViewH xy(70)
#define xy_messageListStatusContentLabelH xy(20)
#define xy_messageListStatusContentColor  lvUIColorFromRGB(999999)
#define xy_transpondContentColor [UIColor colorWithRed:153/255.00f green:153/255.00f blue:153/255.00f alpha:1.00]
#define xy_messageListStatusContentFont xy(12)
#define xy_schoolNameLabelW xy_userNameLableW
#define xy_userNameTextColor [UIColor colorWithRed:0.06 green:0.39 blue:0.60 alpha:1.00]
#define xy_userNameTextFont  [UIFont systemFontOfSize:xy(14)]
#define xy_schoolNameTextColor [UIColor colorWithRed:0.71 green:0.72 blue:0.72 alpha:1.00]
#define xy_schoolNameTextFont [UIFont systemFontOfSize:xy(12)]
#define xy_publisTimeLabelW xy(75)
#define xy_publisTimeTextColor xy_schoolNameTextColor
#define xy_publisTimeFont [UIFont systemFontOfSize:xy(10)]
#define xy_contentTextColor [UIColor colorWithRed:0.19 green:0.19 blue:0.20 alpha:1.00]
#define xy_contentFont [UIFont systemFontOfSize:xy(13.00f)]
#define xy_transpondBtnTitleColor xy_publisTimeTextColor
#define xy_transpondBtnTitleFont  [UIFont systemFontOfSize:xy(11.00f)]
#define xy_commentBtnTitleColor xy_publisTimeTextColor
#define xy_commentBtnTitleFont  xy_transpondBtnTitleFont
#define xy_praiseBtnTitleColor  xy_publisTimeTextColor
#define xy_praiseBtnTitleFont   xy_transpondBtnTitleFont
#define xy_lineImgViewW xy(0.5)
#define xy_sendPhotoEachCount 4
#define xy_sendStatusFont       xy(14)
#define xy_headerViewH          xy(60)+ xy_padding + xy_padding
#define xy_header_iconTitleFont xy(9)
#define xy_transparentColor  [UIColor colorWithRed:0.47 green:0.47 blue:0.48 alpha:0.5]
#define xy_homeCellHightLightColor [UIColor colorWithRed:0.36 green:0.65 blue:0.98 alpha:1.00]


#define xy_headImgViewH xy(45)
#define xy_transpondBgViewH xy(70)


























