//
//  XYCellFrame.m
//  XYWeiboExample
//
//  Created by XY Lv on 16/12/12.
//  Copyright © 2016年 吕欣宇. All rights reserved.
//  github:https://github.com/cryboyofyu
//  博客:http://blog.csdn.net/cry__boy

#import "XYCellFrame.h"
#import "XYCommon.h"
#import "XYCONSTANT.h"
#import "UIButton+XYButton.h"
@implementation XYCellFrame

- (void)setXy_cellItem:(XYCellItem *)xy_cellItem{
    _xy_cellItem = xy_cellItem;
    
    [self xy_layoutBgViewsFrame];
    [self xy_layoutBgFirstViewFrameWithItem:xy_cellItem];
    [self xy_layoutBgSecondViewFrameWithItem:xy_cellItem];
    [self xy_layoutBgThirdViewFrameWithItem:xy_cellItem];
}

- (void)xy_layoutBgViewsFrame{
    CGFloat cellBgViewX = xy_padding;
    CGFloat cellBgViewY = xy_padding;
    CGFloat cellBgViewW = xy_width - cellBgViewX *2;
    CGFloat cellBgViewH = xy_cellH;
    
    self.xy_cellBgImgViewF = CGRectMake(cellBgViewX, cellBgViewY, cellBgViewW, cellBgViewH);
    
    CGFloat bgViewFirstX = xy_padding;
    CGFloat bgViewFirstY = 0;
    CGFloat bgViewFirstW = cellBgViewW-xy_padding *2;
    CGFloat bgViewFirstH = xy_headImgViewH+xy_padding *4;
    
    self.xy_bgViewFirstF = CGRectMake(bgViewFirstX, bgViewFirstY, bgViewFirstW, bgViewFirstH);
    
    CGFloat bgViewSecondX = xy_padding;
    CGFloat bgViewSecondY = CGRectGetMaxY(self.xy_bgViewFirstF);
    CGFloat bgViewSecondW = bgViewFirstW;
    CGFloat bgViewSecondH = xy(32);
    
    self.xy_bgViewSecondF = CGRectMake(bgViewSecondX, bgViewSecondY, bgViewSecondW, bgViewSecondH);
    
    
    CGFloat bgViewThirdX = 0;
    CGFloat bgViewThirdY = CGRectGetMaxY(self.xy_bgViewSecondF)+xy_padding;
    CGFloat bgViewThirdW = cellBgViewW;
    CGFloat bgViewThirdH = xy(33);
    
    self.xy_bgViewThirdF = CGRectMake(bgViewThirdX, bgViewThirdY, bgViewThirdW, bgViewThirdH);
}

- (void)xy_layoutBgFirstViewFrameWithItem:(XYCellItem *)item{
    CGFloat headImgViewX = xy_padding;
    CGFloat headImgViewY = xy_padding*2;
    CGFloat headImgViewW = xy_headImgViewH;
    CGFloat headImgViewH = headImgViewW;
    self.xy_headImgViewF = CGRectMake(headImgViewX, headImgViewY, headImgViewW, headImgViewH);
    
    CGFloat userNameLabelX = xy_padding*2 + CGRectGetMaxX(self.xy_headImgViewF);
    CGFloat userNameLabelY = headImgViewY;
    CGFloat userNameLabelH = headImgViewH/2;
    CGSize  userNameLabelSize =[XYCommon xy_sizeWithStr:item.itemUserNameStr font:xy_userNameTextFont maxSize:CGSizeMake(xy_userNameLableW, userNameLabelH)];
    CGFloat userNameLabelW = userNameLabelSize.width;
    self.xy_userNameLabelF = CGRectMake(userNameLabelX, userNameLabelY, userNameLabelW, userNameLabelH);
    
    CGFloat sexImgViewX = CGRectGetMaxX(_xy_userNameLabelF)+xy_padding;
    CGFloat sexImgViewY = userNameLabelY +xy_padding;
    CGFloat sexImgViewW = xy(13);
    CGFloat sexImgViewH = sexImgViewW;
    self.xy_sexImgViewF = CGRectMake(sexImgViewX, sexImgViewY, sexImgViewW, sexImgViewH);
    
    CGFloat schoolNameLabelX = userNameLabelX;
    CGFloat schoolNameLabelY = CGRectGetMaxY(self.xy_userNameLabelF);
    CGFloat schoolNameLabelW = xy_userNameLableW;
    CGFloat schoolNameLabelH = self.xy_headImgViewF.size.height - self.xy_userNameLabelF.size.height;
    self.xy_schoolNameLabelF = CGRectMake(schoolNameLabelX, schoolNameLabelY, schoolNameLabelW, schoolNameLabelH);
    
    CGFloat publishTimeLabelW = xy_publisTimeLabelW;
    CGFloat publishTimeLabelH = schoolNameLabelH;
    CGFloat publishTimeLabelX = CGRectGetWidth(self.xy_bgViewFirstF) - publishTimeLabelW;
    CGFloat publishTimeLabelY = self.xy_schoolNameLabelF.origin.y;
    
    self.xy_publishTimeLabelF = CGRectMake(publishTimeLabelX, publishTimeLabelY, publishTimeLabelW, publishTimeLabelH);
    
    CGFloat pullDownArrowW = xy(22);
    CGFloat pullDownArrowH = xy(22);
    CGFloat pullDownArrowX = CGRectGetWidth(self.xy_bgViewFirstF) - pullDownArrowW - xy_padding;
    CGFloat pullDownArrowY = self.xy_userNameLabelF.origin.y - xy_padding;
    self.xy_pullDownArrowF = CGRectMake(pullDownArrowX, pullDownArrowY, pullDownArrowW, pullDownArrowH);
    
    CGFloat dynamicIdentityW = xy(34.5)*0.9;
    CGFloat dynamicIdentityH = xy(34)*0.9;
    CGFloat dynamicIdentityX;
    dynamicIdentityX = -xy_padding;
    
    CGFloat dynamicIdentityY = 0;
    
    _xy_dynamicIdentityImgViewF = CGRectMake(dynamicIdentityX, dynamicIdentityY, dynamicIdentityW, dynamicIdentityH);
    
    
    
}

- (void)xy_layoutBgSecondViewFrameWithItem:(XYCellItem *)item{
    CGFloat contentLabelX = 0;
    CGFloat contentLabelY = 0;
    CGFloat contentLabelW = CGRectGetWidth(self.xy_bgViewSecondF);
    
    
    CGSize size = CGSizeMake(contentLabelW, CGFLOAT_MAX);
    //    NSMutableAttributedString * lvStr = [item.itemContentStr dealTheMessage];
    NSMutableAttributedString * lvStr = item.itemContentAttributedStr;
    
    NSMutableAttributedString * lvLimitStr;
    if(self.xy_numberOfLine>0){
        
        if(lvStr.length> _xy_numberOfLine *21){
            lvLimitStr = [[NSMutableAttributedString alloc]initWithAttributedString:[lvStr attributedSubstringFromRange:NSMakeRange(0, 105)]];
        }else{
            lvLimitStr = [[NSMutableAttributedString alloc]initWithAttributedString:lvStr];
        }
    }else{
        lvLimitStr = [[NSMutableAttributedString alloc]initWithAttributedString:lvStr];
    }
    
    YYTextLayout *layout = [YYTextLayout layoutWithContainerSize:size text:lvLimitStr];
    
    CGFloat contentLabelH = layout.textBoundingSize.height;
    self.xy_yyTextLayout = layout;
    self.xy_contentLabelF = CGRectMake(contentLabelX, contentLabelY, contentLabelW, contentLabelH);
    
    CGFloat photoBgViewX = 0;
    CGFloat photoBgViewY = CGRectGetMaxY(self.xy_contentLabelF) + xy_padding;
    CGFloat photoBgViewW = CGRectGetWidth(self.xy_bgViewSecondF);
    CGFloat photoBgViewH = xy_defaultPhotoH;
    
    if(item.itemPhotosMArr.count <1)
    {
        photoBgViewH = 0;
        photoBgViewY = CGRectGetMaxY(self.xy_contentLabelF);
    }
    if(item.itemPhotosMArr.count == 1){
        photoBgViewH = xy_alonePhotoH;
        
    }
    if(item.itemPhotosMArr.count>1&&item.itemPhotosMArr.count<3){
        photoBgViewH = xy_defaultPhotoH;
    }
    if(item.itemPhotosMArr.count == 4){
        photoBgViewH = xy_fourPhotoH*2+xy_padding;
        
    }
    if(item.itemPhotosMArr.count >4&&item.itemPhotosMArr.count <=6){
        photoBgViewH = xy_defaultPhotoH *2+xy_padding;
        
    }
    if(item.itemPhotosMArr.count >6&&item.itemPhotosMArr.count <=9){
        photoBgViewH = xy_defaultPhotoH *3+xy_padding*2;
        
    }
    self.xy_photoBgViewF = CGRectMake(photoBgViewX, photoBgViewY, photoBgViewW, photoBgViewH);
    
    CGFloat tanspondBgViewX = 0;
    CGFloat tanspondBgViewY = CGRectGetMaxY(self.xy_photoBgViewF) + xy_padding;
    CGFloat tanspondBgViewW = CGRectGetWidth(self.xy_bgViewSecondF);
    CGFloat tanspondBgViewH;
    if([item.itemIsTranspond isEqualToString:@"1"]){
        tanspondBgViewH  = xy_transpondBgViewH;
        
    }else{
        tanspondBgViewH = 0;
    }
    
    self.xy_transpondBgViewF = CGRectMake(tanspondBgViewX, tanspondBgViewY, tanspondBgViewW, tanspondBgViewH);
    
    CGFloat transpondIconPhotoImgViewX = 0;
    CGFloat transpondIconPhotoImgViewY = 0;
    CGFloat transpondIconPhotoImgViewW;
    transpondIconPhotoImgViewW = tanspondBgViewH;
    
    
    CGFloat transpondIconPhotoImgViewH = tanspondBgViewH;
    
    self.xy_transpondIconPhotoImgViewF = CGRectMake(transpondIconPhotoImgViewX, transpondIconPhotoImgViewY, transpondIconPhotoImgViewW, transpondIconPhotoImgViewH);
    
    CGFloat transpondIconUserNameLabelX = CGRectGetMaxX(self.xy_transpondIconPhotoImgViewF) + xy_padding;
    CGFloat transpondIconUserNameLabelY = xy_padding;
    CGFloat transpondIconUserNameLabelW = CGRectGetWidth(self.xy_transpondBgViewF) - transpondIconUserNameLabelX - xy_padding;
    CGFloat transpondIconUserNameLabelH;
    if([item.itemIsTranspond isEqualToString:@"1"]){
        transpondIconUserNameLabelH = xy(20);
    }else{
        transpondIconUserNameLabelH = 0;
    }
    
    
    
    self.xy_transpondIconUserNameLabelF = CGRectMake(transpondIconUserNameLabelX, transpondIconUserNameLabelY, transpondIconUserNameLabelW, transpondIconUserNameLabelH);
    
    
    CGFloat transpondIconContentLabelX = transpondIconUserNameLabelX;
    CGFloat transpondIconContentLabelY = CGRectGetMaxY(self.xy_transpondIconUserNameLabelF);
    CGFloat transpondIconContentLabelW = transpondIconUserNameLabelW;
    CGSize transpondSize = CGSizeMake(transpondIconContentLabelW, transpondIconUserNameLabelH *2);
    
    YYTextLayout *transpondLayout = [YYTextLayout layoutWithContainerSize:transpondSize text:[item.itemTranspondedContent xy_dealTheMessage]];
    
    
    CGFloat transpondIconContentLabelH = transpondLayout.textBoundingSize.height;
    //    CGFloat transpondIconContentLabelH = lvMessageListStatusContentLabelH*2;
    
    
    self.xy_transpondIconContentLabelF = CGRectMake(transpondIconContentLabelX, transpondIconContentLabelY, transpondIconContentLabelW, transpondIconContentLabelH);
    
    
    
    self.xy_bgViewSecondF = CGRectMake(self.xy_bgViewSecondF.origin.x, self.xy_bgViewSecondF.origin.y, self.xy_bgViewSecondF.size.width, CGRectGetMaxY(self.xy_transpondBgViewF));
    self.xy_bgViewThirdF = CGRectMake(self.xy_bgViewThirdF.origin.x, CGRectGetMaxY(self.xy_bgViewSecondF)+xy_padding,self.xy_bgViewThirdF.size.width, self.xy_bgViewThirdF.size.height);
    self.xy_cellHeight= CGRectGetMaxY(self.xy_bgViewThirdF) + xy_padding;
    
    NSDictionary * paraDic = @{@"headerH":[NSString stringWithFormat:@"%f",self.xy_cellHeight]};
    [[NSNotificationCenter defaultCenter] postNotificationName:@"headerH" object:nil userInfo:paraDic];
    
}

- (void)xy_layoutBgThirdViewFrameWithItem:(XYCellItem *)item{
    CGFloat lineImgViewX = 0;
    CGFloat lineImgViewY = 0;
    CGFloat lineImgViewW = self.xy_cellBgImgViewF.size.width;
    CGFloat lineImgViewH = xy_lineImgViewW;
    self.xy_lineImgViewF = CGRectMake(lineImgViewX, lineImgViewY, lineImgViewW, lineImgViewH);
    
    CGFloat transpondBtnX = 0;
    CGFloat transpondBtnY = 0;
    CGFloat transpondBtnW = CGRectGetWidth(self.xy_cellBgImgViewF)/3;
    CGFloat transpondBtnH = xy(34);
    self.xy_transpondBtnF = CGRectMake(transpondBtnX, transpondBtnY, transpondBtnW, transpondBtnH);
    
    CGFloat dottedLineImgView1W = xy_lineImgViewW;
    CGFloat dottedLineImgView1H = transpondBtnH;
    CGFloat dottedLineImgView1X = CGRectGetMaxX(self.xy_transpondBtnF) - dottedLineImgView1W/2;
    CGFloat dottedLineImgView1Y = 0;
    self.xy_dottedLineImgViewF1 = CGRectMake(dottedLineImgView1X, dottedLineImgView1Y, dottedLineImgView1W, dottedLineImgView1H);
    
    CGFloat commentBtnX =CGRectGetMaxX(self.xy_transpondBtnF);
    CGFloat commentBtnY = 0;
    CGFloat commentBtnW = CGRectGetWidth(self.xy_cellBgImgViewF)/3;
    CGFloat commentBtnH = xy(34);
    self.xy_commentBtnF = CGRectMake(commentBtnX, commentBtnY, commentBtnW, commentBtnH);
    
    CGFloat dottedLineImgView2W = xy_lineImgViewW;
    CGFloat dottedLineImgView2H = transpondBtnH;
    CGFloat dottedLineImgView2X = CGRectGetMaxX(self.xy_commentBtnF) - dottedLineImgView2W/4;
    CGFloat dottedLineImgView2Y = 0;
    self.xy_dottedLineImgViewF2 = CGRectMake(dottedLineImgView2X, dottedLineImgView2Y, dottedLineImgView2W, dottedLineImgView2H);
    
    CGFloat praiseBtnX = CGRectGetMaxX(self.xy_commentBtnF);
    CGFloat praiseBtnY = 0;
    CGFloat praiseBtnW = CGRectGetWidth(self.xy_cellBgImgViewF)/3;
    CGFloat praiseBtnH = xy(34);
    self.xy_praiseBtnF = CGRectMake(praiseBtnX, praiseBtnY, praiseBtnW, praiseBtnH);
    
    self.xy_cellBgImgViewF = CGRectMake(self.xy_cellBgImgViewF.origin.x, self.xy_cellBgImgViewF.origin.y, self.xy_cellBgImgViewF.size.width, CGRectGetMaxY(self.xy_bgViewThirdF));
    
    self.xy_cellHeight= CGRectGetMaxY(self.xy_cellBgImgViewF);
    
}

@end
