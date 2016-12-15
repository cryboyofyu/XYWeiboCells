//
//  XYTVCell.h
//  XYWeiboExample
//
//  Created by XY Lv on 16/12/12.
//  Copyright © 2016年 吕欣宇. All rights reserved.
//  github:https://github.com/cryboyofyu
//  博客:http://blog.csdn.net/cry__boy

#import <UIKit/UIKit.h>
#import "XYCellFrame.h"
#import "YYLabel.h"
#import "YYText.h"

@protocol XYCellTouchMethodsDelegate <NSObject>

- (void)xy_homePhotoTapDelegate:(id)sender withObject:(id)object;
- (void)xy_headTapDelegate:(id)sender withObject:(id)object;
- (void)xy_transpondBtnClickDelegate:(id)sender withObject:(id)object;
- (void)xy_commentBtnClickDelegate:(id)sender withObject:(id)object;
- (void)xy_praiseBtnClickDelegate:(id)sender withObject:(id)object;
- (void)xy_transpondedBgViewTapDelegate:(id)sender withObject:(id)object;
- (void)xy_pullDownArrowBtnClickDelegate:(id)sender withObject:(id)object;

@end

@interface XYTVCell : UITableViewCell
@property (nonatomic,weak)id<XYCellTouchMethodsDelegate>xy_cellDelegate;

@property (nonatomic,strong)UIImageView * xy_cellBgImgView;

@property (nonatomic,strong)UIView * xy_bgViewFirst;
@property (nonatomic,strong)UIView * xy_bgViewSecond;
@property (nonatomic,strong)UIView * xy_bgViewThird;

@property (nonatomic,strong)UIImageView * xy_headImgView;
@property (nonatomic,strong)UILabel * xy_userNameLabel;//用户名
@property (nonatomic,strong)UIImageView * xy_sexImgView;
@property (nonatomic,strong)UILabel * xy_schoolNameLabel;
@property (nonatomic,strong)UILabel * xy_publishTimeLabel;//发布时间
@property (nonatomic,strong)UIButton * xy_pullDownArrowBtn;
@property (nonatomic,strong)UIImageView * xy_dynamicIdentityImgView;//动态标识

@property (nonatomic,strong)YYLabel * xy_contentLabel;
@property (nonatomic,strong)UIView * xy_photoBgView;

@property (nonatomic,strong)UIView * xy_transpondBgView;
@property (nonatomic,strong)UIImageView * xy_transpondIconPhotoImgView;
@property (nonatomic,strong)UILabel * xy_transpondIconUserNameLabel;
@property (nonatomic,strong)YYLabel * xy_transpondIconContentLabel;

@property (nonatomic,strong)UIImageView * xy_lineImgView;
@property (nonatomic,strong)UIButton * xy_transpondBtn;
@property (nonatomic,strong)UIButton * xy_commentBtn;
@property (nonatomic,strong)UIButton * xy_praiseBtn;
@property (nonatomic,strong)UIImageView * xy_dottedLineImgView1;
@property (nonatomic,strong)UIImageView * xy_dottedLineImgView2;

@property (nonatomic,strong)XYCellFrame * xy_cellFrame;
@property (nonatomic,assign)BOOL xy_isShowColor;
@property (nonatomic,assign)NSInteger xy_textNumberOfLine;
@property (nonatomic,assign)BOOL xy_isHidePullDownBtn;

@end
