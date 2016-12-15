//
//  XYCellFrame.h
//  XYWeiboExample
//
//  Created by XY Lv on 16/12/12.
//  Copyright © 2016年 吕欣宇. All rights reserved.
//  github:https://github.com/cryboyofyu
//  博客:http://blog.csdn.net/cry__boy

#import <Foundation/Foundation.h>
#import "XYCellItem.h"
#import "YYTextLayout.h"
@interface XYCellFrame : NSObject

@property (nonatomic,assign)CGRect xy_cellBgImgViewF;

@property (nonatomic,assign)CGRect xy_bgViewFirstF;
@property (nonatomic,assign)CGRect xy_bgViewSecondF;
@property (nonatomic,assign)CGRect xy_bgViewThirdF;

@property (nonatomic,assign)CGRect xy_headImgViewF;
@property (nonatomic,assign)CGRect xy_userNameLabelF;//用户名
@property (nonatomic,assign)CGRect xy_sexImgViewF;
@property (nonatomic,assign)CGRect xy_schoolNameLabelF;
@property (nonatomic,assign)CGRect xy_publishTimeLabelF;//发布时间
@property (nonatomic,assign)CGRect xy_dynamicIdentityImgViewF;
@property (nonatomic,assign)CGRect xy_pullDownArrowF;//下拉箭头

@property (nonatomic,assign)CGRect xy_contentLabelF;
@property (nonatomic,assign)CGRect xy_photoBgViewF;

@property (nonatomic,assign)CGRect  xy_transpondBgViewF;
@property (nonatomic,assign)CGRect  xy_transpondIconPhotoImgViewF;
@property (nonatomic,assign)CGRect  xy_transpondIconUserNameLabelF;
@property (nonatomic,assign)CGRect  xy_transpondIconContentLabelF;


@property (nonatomic,assign)CGRect xy_lineImgViewF;
@property (nonatomic,assign)CGRect xy_transpondBtnF;
@property (nonatomic,assign)CGRect xy_commentBtnF;
@property (nonatomic,assign)CGRect xy_praiseBtnF;
@property (nonatomic,assign)CGRect xy_dottedLineImgViewF1;
@property (nonatomic,assign)CGRect xy_dottedLineImgViewF2;


@property (nonatomic,assign)CGFloat xy_cellHeight;
@property (nonatomic,strong)XYCellItem * xy_cellItem;

@property (nonatomic,strong)YYTextLayout * xy_yyTextLayout;
@property (nonatomic,assign)NSInteger      xy_numberOfLine;

@end































