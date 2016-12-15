//
//  XYTVCell.m
//  XYWeiboExample
//
//  Created by XY Lv on 16/12/12.
//  Copyright © 2016年 吕欣宇. All rights reserved.
//  github:https://github.com/cryboyofyu
//  博客:http://blog.csdn.net/cry__boy

#import "XYTVCell.h"
#import "XYCONSTANT.h"
#import "UIImageView+WebCache.h"
#import "XYJGGView.h"
#import "XYCommon.h"
#import "UIButton+XYButton.h"
@implementation XYTVCell
{
    UIImageView * _xyPhotoImgView;
}


/**
 

 @param style    重写init方法
 @param reuseIdentifier xy

 @return  xy
 */
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if(self){
        [self xy_initCellStyle];
        [self  xy_initSubViews];
        
        [self xy_addAllTouchMethod];
        
    }
    return self;
}

- (void)setXy_cellFrame:(XYCellFrame *)xy_cellFrame{
    _xy_cellFrame = xy_cellFrame;
    [self xy_setBgSubViewsFrame];
    [self xy_setBgSubViewsStyle];
    
    [self xy_setBgSubViewsData];
    
    if(self.xy_isShowColor){
        [self xy_setBgSubViewsColor];
    }
}

- (void)xy_initCellStyle{
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.backgroundColor = xy_grayColor;
    
    
}

- (void)xy_initSubViews{
    self.xy_cellBgImgView = [[UIImageView alloc]init];
    [self addSubview:self.xy_cellBgImgView];
    self.xy_cellBgImgView.backgroundColor = [UIColor whiteColor];
    
    
    self.xy_bgViewFirst = [[UIView alloc]init];
    [self.xy_cellBgImgView addSubview:self.xy_bgViewFirst];
    
    self.xy_bgViewSecond = [[UIView alloc]init];
    [self.xy_cellBgImgView addSubview:self.xy_bgViewSecond];
    
    self.xy_bgViewThird = [[UIView alloc]init];
    [self.xy_cellBgImgView addSubview:self.xy_bgViewThird];
    
    [self xy_initBgViewFirstSubViews];
    [self xy_initBgViewSecondSubViews];
    [self xy_initBgViewThirdSubViews];
    
}

- (void)xy_initBgViewFirstSubViews{
    self.xy_headImgView = [[UIImageView alloc]init];
    [self.xy_bgViewFirst addSubview:self.xy_headImgView];
    self.xy_headImgView.contentMode = UIViewContentModeScaleAspectFill;
    self.xy_headImgView.layer.masksToBounds = YES;
    
    self.xy_userNameLabel = [[UILabel alloc]init];
    [self.xy_bgViewFirst addSubview:self.xy_userNameLabel];
    
    self.xy_sexImgView = [[UIImageView alloc]init];
    [self.xy_bgViewFirst addSubview:self.xy_sexImgView];
    
    self.xy_schoolNameLabel = [[UILabel alloc]init];
    [self.xy_bgViewFirst addSubview:self.xy_schoolNameLabel];
    
    _xy_dynamicIdentityImgView = [[UIImageView alloc]init];
    [_xy_bgViewFirst addSubview:_xy_dynamicIdentityImgView];
    _xy_dynamicIdentityImgView.hidden = YES;
    [_xy_dynamicIdentityImgView setImage:[UIImage imageNamed:@"LV_hot"]];
    self.xy_publishTimeLabel = [[UILabel alloc]init];
    [self.xy_bgViewFirst addSubview:self.xy_publishTimeLabel];
    
    self.xy_pullDownArrowBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.xy_bgViewFirst addSubview:self.xy_pullDownArrowBtn];
    [self.xy_pullDownArrowBtn setImage:[UIImage imageNamed:@"pull_down"] forState:UIControlStateNormal];
    [self.xy_pullDownArrowBtn addTarget:self action:@selector(xy_pullDownArrowBtnClick:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)xy_initBgViewSecondSubViews{
    self.xy_contentLabel = [[YYLabel alloc]init];
    [self.xy_bgViewSecond addSubview:self.xy_contentLabel];
    _xy_contentLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    
    self.xy_photoBgView = [[UIView alloc]init];
    [self.xy_bgViewSecond addSubview:self.xy_photoBgView];
    
    [self xy_layoutTranspondBgView];
    
    
}

- (void)xy_initBgViewThirdSubViews{
    self.xy_lineImgView = [[UIImageView alloc]init];
    [self.xy_bgViewThird addSubview:self.xy_lineImgView];
    
    self.xy_transpondBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.xy_bgViewThird addSubview:self.xy_transpondBtn];
    
    self.xy_commentBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.xy_bgViewThird addSubview:self.xy_commentBtn];
    
    
    self.xy_praiseBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.xy_bgViewThird addSubview:self.xy_praiseBtn];
    
    
    
    self.xy_dottedLineImgView1 = [[UIImageView alloc]init];
    [self.xy_bgViewThird addSubview:self.xy_dottedLineImgView1];
    [self.xy_dottedLineImgView1 setImage:[UIImage imageNamed:@"DottedLine"]];
    self.xy_dottedLineImgView2 = [[UIImageView alloc]init];
    [self.xy_bgViewThird addSubview:self.xy_dottedLineImgView2];
    [self.xy_dottedLineImgView2 setImage:[UIImage imageNamed:@"DottedLine"]];
    
    
}

- (void)xy_layoutTranspondBgView{
    self.xy_transpondBgView = [[UIView alloc]init];
    [self.xy_bgViewSecond addSubview:self.xy_transpondBgView];
    self.xy_transpondBgView.backgroundColor = xy_grayColor;
    
    [self xy_layoutNewsTranspondSubViews];
    
}

- (void)xy_layoutNewsTranspondSubViews{
    
    self.xy_transpondIconPhotoImgView = [[UIImageView alloc]init];
    
    [self.xy_transpondBgView addSubview:self.xy_transpondIconPhotoImgView];
    
    self.xy_transpondIconPhotoImgView.userInteractionEnabled = YES;
    
    self.xy_transpondIconUserNameLabel = [[UILabel alloc]init];
    [self.xy_transpondBgView addSubview:self.xy_transpondIconUserNameLabel];
    
    self.xy_transpondIconContentLabel = [[YYLabel alloc]init];
    [self.xy_transpondBgView addSubview:self.xy_transpondIconContentLabel];
    
    self.xy_contentLabel.textColor = xy_schoolNameTextColor;
    self.xy_contentLabel.font = [UIFont systemFontOfSize:xy_messageListStatusContentFont];
}

- (void)xy_setBgSubViewsStyle{
    self.xy_cellBgImgView.userInteractionEnabled = YES;
    self.xy_cellBgImgView.layer.cornerRadius = xy_cellBgImgViewCornerRadius;
    [self xy_setBgViewFirstStyle];
    [self xy_setBgViewSecondStyle];
    [self xy_setBgViewThirdStyle];
}

- (void)xy_setBgViewFirstStyle{
    self.xy_headImgView.layer.cornerRadius = CGRectGetWidth(self.xy_headImgView.frame)/2;
    self.xy_headImgView.layer.masksToBounds = YES;
    self.xy_headImgView.userInteractionEnabled = YES;
    
    self.xy_userNameLabel.textColor = xy_userNameTextColor;
    self.xy_userNameLabel.font = xy_userNameTextFont;
    
    self.xy_schoolNameLabel.textColor = xy_schoolNameTextColor;
    self.xy_schoolNameLabel.font = xy_schoolNameTextFont;
    
    self.xy_publishTimeLabel.textColor = xy_publisTimeTextColor;
    self.xy_publishTimeLabel.font = xy_publisTimeFont;
    self.xy_publishTimeLabel.textAlignment = NSTextAlignmentRight;
    
    
}

- (void)xy_setBgViewSecondStyle{
    self.xy_contentLabel.textColor = xy_contentTextColor;
    self.xy_contentLabel.font = xy_contentFont;
    //后加
    //    self.contentLabel.editable = NO;
    //    self.contentLabel.scrollEnabled = NO;
    //    self.contentLabel.dataDetectorTypes =  UIDataDetectorTypeLink;
    
    self.xy_contentLabel.numberOfLines = 0;
    self.xy_contentLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    
    self.xy_transpondIconContentLabel.numberOfLines = 1;
    self.xy_transpondIconContentLabel.lineBreakMode = NSLineBreakByTruncatingTail;
}

- (void)xy_setBgViewThirdStyle{
    [self.xy_transpondBtn setImage:[UIImage imageNamed:@"Transpond"] forState:UIControlStateNormal];
    [self.xy_transpondBtn setTitleColor:xy_transpondBtnTitleColor forState:UIControlStateNormal];
    self.xy_transpondBtn.titleLabel.font = xy_transpondBtnTitleFont;
    self.xy_transpondBtn.imageEdgeInsets = UIEdgeInsetsMake(0, -xy(15), 0, 0);
    self.xy_transpondBtn.titleEdgeInsets = UIEdgeInsetsMake(0, xy(15), 0, 0);
    
    [self.xy_commentBtn setImage:[UIImage imageNamed:@"Comment"] forState:UIControlStateNormal];
    [self.xy_commentBtn setTitleColor:xy_commentBtnTitleColor forState:UIControlStateNormal];
    self.xy_commentBtn.titleLabel.font = xy_commentBtnTitleFont;
    self.xy_commentBtn.imageEdgeInsets = UIEdgeInsetsMake(0, xy(5), 0, 0);
    self.xy_commentBtn.titleEdgeInsets = UIEdgeInsetsMake(0, xy(15), 0, 0);
    
    [self.xy_praiseBtn setImage:[UIImage imageNamed:@"Praise"] forState:UIControlStateNormal];
    [self.xy_praiseBtn setImage:[UIImage imageNamed:@"praise_selected"] forState:UIControlStateSelected];
    [self.xy_praiseBtn setTitleColor:xy_praiseBtnTitleColor forState:UIControlStateNormal];
    self.xy_praiseBtn.titleLabel.font = xy_praiseBtnTitleFont;
    self.xy_praiseBtn.imageEdgeInsets = UIEdgeInsetsMake(0, xy(5), 0, 0);
    self.xy_praiseBtn.titleEdgeInsets = UIEdgeInsetsMake(0, xy(15), 0, 0);
    
}

- (void)xy_setBgSubViewsFrame{
    self.xy_cellBgImgView.frame = self.xy_cellFrame.xy_cellBgImgViewF;
    self.xy_bgViewFirst.frame = self.xy_cellFrame.xy_bgViewFirstF;
    self.xy_bgViewSecond.frame = self.xy_cellFrame.xy_bgViewSecondF;
    self.xy_bgViewThird.frame = self.xy_cellFrame.xy_bgViewThirdF;
    
    [self xy_setBgViewFirstSubViewsFrame];
    [self xy_setBgViewSecondSubViewsFrame];
    [self xy_setBgViewThirdSubViewsFrame];
}

- (void)xy_setBgViewFirstSubViewsFrame{
    
    self.xy_headImgView.frame = self.xy_cellFrame.xy_headImgViewF;
    self.xy_userNameLabel.frame = self.xy_cellFrame.xy_userNameLabelF;
    self.xy_sexImgView.frame = self.xy_cellFrame.xy_sexImgViewF;
    self.xy_schoolNameLabel.frame = self.xy_cellFrame.xy_schoolNameLabelF;
    self.xy_publishTimeLabel.frame = self.xy_cellFrame.xy_publishTimeLabelF;
    self.xy_pullDownArrowBtn.frame = self.xy_cellFrame.xy_pullDownArrowF;
    self.xy_dynamicIdentityImgView.frame = self.xy_cellFrame.xy_dynamicIdentityImgViewF;
}

- (void)xy_setBgViewSecondSubViewsFrame{
    
    self.xy_contentLabel.frame = self.xy_cellFrame.xy_yyTextLayout.textBoundingRect;
    self.xy_contentLabel.textLayout = self.xy_cellFrame.xy_yyTextLayout;
    
    self.xy_photoBgView.frame = self.xy_cellFrame.xy_photoBgViewF;
    
    self.xy_transpondBgView.frame = self.xy_cellFrame.xy_transpondBgViewF;
    self.xy_transpondIconPhotoImgView.frame = self.xy_cellFrame.xy_transpondIconPhotoImgViewF;
    self.xy_transpondIconUserNameLabel.frame = self.xy_cellFrame.xy_transpondIconUserNameLabelF;
    self.xy_transpondIconContentLabel.frame = self.xy_cellFrame.xy_transpondIconContentLabelF;
    
}

- (void)xy_setBgViewThirdSubViewsFrame{
    self.xy_lineImgView.frame = self.xy_cellFrame.xy_lineImgViewF;
    self.xy_transpondBtn.frame = self.xy_cellFrame.xy_transpondBtnF;
    self.xy_dottedLineImgView1.frame = self.xy_cellFrame.xy_dottedLineImgViewF1;
    self.xy_commentBtn.frame = self.xy_cellFrame.xy_commentBtnF;
    self.xy_dottedLineImgView2.frame = self.xy_cellFrame.xy_dottedLineImgViewF2;
    self.xy_praiseBtn.frame = self.xy_cellFrame.xy_praiseBtnF;
}

- (void)xy_setBgSubViewsColor{
    self.xy_cellBgImgView.backgroundColor = [UIColor orangeColor];
    self.xy_bgViewFirst.backgroundColor = [UIColor blueColor];
    self.xy_bgViewSecond.backgroundColor = [UIColor grayColor];
    self.xy_bgViewThird.backgroundColor = [UIColor whiteColor];
    
    [self xy_setBgViewFirstColor];
    [self xy_setBgViewSecondColor];
    [self xy_setBgViewThirdColor];
}

- (void)xy_setBgViewFirstColor{
    self.xy_headImgView.backgroundColor = [UIColor brownColor];
    self.xy_userNameLabel.backgroundColor = [UIColor yellowColor];
    self.xy_schoolNameLabel.backgroundColor = [UIColor whiteColor];
    self.xy_publishTimeLabel.backgroundColor = [UIColor blackColor];
}

- (void)xy_setBgViewSecondColor{
    self.xy_photoBgView.backgroundColor = [UIColor redColor];
}

- (void)xy_setBgViewThirdColor{
    self.xy_transpondBtn.backgroundColor = [UIColor grayColor];
    self.xy_commentBtn.backgroundColor = [UIColor blueColor];
    self.xy_praiseBtn.backgroundColor = [UIColor brownColor];
}

- (void)xy_setBgSubViewsData{
    
    XYCellItem * item = _xy_cellFrame.xy_cellItem;
    
    [self xy_setBgViewFirstDataWithXYCellItem:item];
    [self xy_setBgViewSecondDataWithXYCellItem:item];
    [self xy_setBgViewThirdDataWithXYCellItem:item];
}

- (void)xy_setBgViewFirstDataWithXYCellItem:(XYCellItem *)item{
    [self.xy_headImgView sd_setImageWithURL:[NSURL URLWithString:item.itemHeadImgStr] placeholderImage:[UIImage imageNamed:item.itemHeadImgStr]];
    
    self.xy_userNameLabel.text = item.itemUserNameStr;
    
    if([item.itemUserSex isEqualToString:@"0"]){
        _xy_sexImgView.hidden = NO;
        [_xy_sexImgView setImage:[UIImage imageNamed:@"LVIcon_man"]];
        
    }else if([item.itemUserSex isEqualToString:@"1"]){
        _xy_sexImgView.hidden = NO;
        [_xy_sexImgView setImage:[UIImage imageNamed:@"LVIcon_woman"]];
        
    }else{
        _xy_sexImgView.hidden = YES;
    }
    
    if([item.itemUserIdentity isEqualToString:@"1"]){
        _xy_userNameLabel.textColor = xy_userNameColor_official;
    }
    
    
    self.xy_schoolNameLabel.text = item.itemSchoolNameStr;
    self.xy_publishTimeLabel.text = @"1秒前";
    if(item.itemPublishTimeStr.length>0){
        self.xy_publishTimeLabel.text = item.itemPublishTimeStr;
        
    }
    
    if([item.itemDynamicType isEqualToString:@"1"]){
        _xy_dynamicIdentityImgView.hidden = NO;
        //        _pullDownArrowBtn.hidden = YES;
    }else{
        _xy_dynamicIdentityImgView.hidden = YES;
        _xy_pullDownArrowBtn.hidden = _xy_isHidePullDownBtn;
        
    }
    
    
}

- (void)xy_setBgViewSecondDataWithXYCellItem:(XYCellItem *)item{
    
    NSMutableAttributedString * mutableAttributedStr = item.itemContentAttributedStr;
    
    NSString * xyStr = [mutableAttributedStr string];
    NSMutableDictionary * lvDic =  [XYCommon xy_detectorStrWithStr:xyStr withStrCheckType:(NSTextCheckingTypeLink|NSTextCheckingTypePhoneNumber)];
    
    if(lvDic.count>0){
        NSRange lvRange = NSRangeFromString([lvDic objectForKey:@"xy_range"]);
        NSString * type = [NSString stringWithFormat:@"%@",[lvDic objectForKey:@"xy_type"]];
        if(lvRange.length>4){
            [mutableAttributedStr yy_setTextHighlightRange:lvRange color:xy_homeCellHightLightColor backgroundColor:xy_grayColor tapAction:^(UIView * _Nonnull containerView, NSAttributedString * _Nonnull text, NSRange range, CGRect rect) {
                if([type isEqualToString:@"1"]){
                    
                    NSString * phoneNum = [lvDic objectForKey:@"xy_phoneNum"];
                    
                    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:phoneNum] options:@{} completionHandler:^(BOOL success) {
                        NSLog(@"欣宇最帅～大家Github给赞哦");

                    }];
                }else{
                    NSLog(@"你点击了链接喽:%@",[text string]);
                    
                    NSURL * linkUrl = [lvDic objectForKey:@"xy_url"];
                    
                    [[UIApplication sharedApplication] openURL:linkUrl options:@{} completionHandler:^(BOOL success) {
                        NSLog(@"欣宇最帅～大家Github给赞哦");
                    }];

                }
                
            }];
            
        }
        
    }
    
    self.xy_contentLabel.attributedText = mutableAttributedStr;
    
    
    if(_xy_textNumberOfLine>0){
        _xy_contentLabel.numberOfLines = _xy_textNumberOfLine;
        
    }else{
        _xy_contentLabel.numberOfLines = 0;
        
    }
    
    
    XYJGGView * xylayoutPhotos = [[XYJGGView alloc]initWithFrame:CGRectMake(0, 0, self.xy_photoBgView.bounds.size.width, self.xy_photoBgView.bounds.size.height) withXYPhotosDataMArr:[NSMutableArray arrayWithArray:item.itemPhotosMArr] withXYPlaceholderImg:nil withBgView:self.xy_photoBgView withXYItemViewTapBlock:^(UIView *xyItemView, NSMutableArray *xyPhotosDataMArr) {
        NSLog(@"图片被点击了，第%ld张，图片数组为:%@",xyItemView.tag,xyPhotosDataMArr);
        if([self.xy_cellDelegate respondsToSelector:@selector(xy_homePhotoTapDelegate:withObject:)]){
            [self.xy_cellDelegate xy_homePhotoTapDelegate:xyItemView withObject:self];
        }
    }];
//    xylayoutPhotos.backgroundColor = xy_grayColor;
    
    self.xy_transpondBgView.tag = self.tag;
    NSString * xy_iconPhtotStr;
    if(item.itemTranspondedIconPhoto.length >0){
        xy_iconPhtotStr =  item.itemTranspondedIconPhoto;
    }else{
        xy_iconPhtotStr = item.itemTranspondedUserPortrait;
        
    }
    [self.xy_transpondIconPhotoImgView sd_setImageWithURL:[NSURL URLWithString:xy_iconPhtotStr] placeholderImage:nil];
    self.xy_transpondIconUserNameLabel.text = item.itemTranspondedUserName;
    if([item.itemTranspondedUserIdentity isEqualToString:@"1"]){
        _xy_transpondIconUserNameLabel.textColor = xy_userNameColor_official;
    }
    NSMutableAttributedString * xy_transpondContentStr = [item.itemTranspondedContent xy_dealTheMessage];
    xy_transpondContentStr.yy_font = [UIFont systemFontOfSize:xy_messageListStatusContentFont];
    xy_transpondContentStr.yy_color = xy_transpondContentColor;
    self.xy_transpondIconContentLabel.attributedText = xy_transpondContentStr;
    
    if([item.itemTranspondedDynamicId isEqualToString:@"0"]){
        self.xy_transpondBgView.userInteractionEnabled = NO;
    }else{
        self.xy_transpondBgView.userInteractionEnabled = YES;
        
    }
    
    
}

- (void)xy_setBgViewThirdDataWithXYCellItem:(XYCellItem *)item{
    [self.xy_lineImgView setImage:[UIImage imageNamed:@"SegmentLine"]];
    [self.xy_transpondBtn setTitle:@"转发" forState:UIControlStateNormal];
    if([item.itemTranspondStr integerValue]>0){
        [self.xy_transpondBtn setTitle:item.itemTranspondStr forState:UIControlStateNormal];
        
    }
    
    [self.xy_commentBtn setTitle:@"评论" forState:UIControlStateNormal];
    if([item.itemCommentStr integerValue]>0){
        [self.xy_commentBtn setTitle:item.itemCommentStr forState:UIControlStateNormal];
        
    }
    [self.xy_praiseBtn setTitle:@"赞" forState:UIControlStateNormal];
    if([item.itemPraiseStr integerValue]>0){
        [self.xy_praiseBtn setTitle:item.itemPraiseStr forState:UIControlStateNormal];
        
    }
    if([item.itemIsPraisedByMe isEqualToString:@"1"]){
        self.xy_praiseBtn.selected = YES;
    }else{
        self.xy_praiseBtn.selected = NO;
    }
}

- (void)xy_addAllTouchMethod{
    UITapGestureRecognizer * headTap =[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(headTap:)];
    [self.xy_headImgView addGestureRecognizer:headTap];
    
    [self.xy_transpondBtn addTarget:self action:@selector(xy_transpondBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.xy_commentBtn addTarget:self action:@selector(xy_commentBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.xy_praiseBtn addTarget:self action:@selector(xy_praiseBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    UITapGestureRecognizer * xy_transpondedBgViewTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(xy_transpondedBgViewTap:)];
    [self.xy_transpondBgView addGestureRecognizer:xy_transpondedBgViewTap];
    
}

#pragma mark-lv ----------------响应事件位置-----------------------------------------
- (void)xy_imgTap:(UITapGestureRecognizer * )sender{
    
    if([self.xy_cellDelegate respondsToSelector:@selector(xy_homePhotoTapDelegate:withObject:)]){
        [self.xy_cellDelegate xy_homePhotoTapDelegate:sender.view withObject:self];
    }
}

- (void)xy_headTap:(UITapGestureRecognizer *)sender{
    if([self.xy_cellDelegate respondsToSelector:@selector(xy_headTapDelegate:withObject:)]){
        [self.xy_cellDelegate xy_headTapDelegate:sender withObject:self];
    }
}

- (void)xy_transpondBtnClick:(UIButton *)sender{
    if([self.xy_cellDelegate respondsToSelector:@selector(xy_transpondBtnClickDelegate:withObject:)]){
        [self.xy_cellDelegate xy_transpondBtnClickDelegate:sender withObject:self];
    }
    
}

- (void)xy_commentBtnClick:(UIButton *)sender{
    if([self.xy_cellDelegate respondsToSelector:@selector(xy_transpondBtnClickDelegate:withObject:)]){
        [self.xy_cellDelegate xy_transpondBtnClickDelegate:sender withObject:self];
    }
}

- (void)xy_praiseBtnClick:(UIButton *)sender{
    if([self.xy_cellDelegate respondsToSelector:@selector(xy_praiseBtnClickDelegate:withObject:)]){
        [self.xy_cellDelegate xy_praiseBtnClickDelegate:sender withObject:self];
    }
}

- (void)xy_transpondedBgViewTap:(UITapGestureRecognizer *)sender{
    
    if([self.xy_cellDelegate respondsToSelector:@selector(xy_transpondedBgViewTapDelegate:withObject:)]){
        [self.xy_cellDelegate xy_transpondedBgViewTapDelegate:sender withObject:self];
    }
}

- (void)xy_pullDownArrowBtnClick:(UIButton * )sender{
    
    if([self.xy_cellDelegate respondsToSelector:@selector(xy_pullDownArrowBtnClickDelegate:withObject:)]){
        [self.xy_cellDelegate xy_pullDownArrowBtnClickDelegate:sender withObject:self];
    }
    
}


@end









































