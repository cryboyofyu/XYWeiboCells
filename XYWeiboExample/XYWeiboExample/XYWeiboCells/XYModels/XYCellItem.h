//
//  XYCellItem.h
//  XYWeiboExample
//
//  Created by XY Lv on 16/12/12.
//  Copyright © 2016年 吕欣宇. All rights reserved.
//  github:https://github.com/cryboyofyu
//  博客:http://blog.csdn.net/cry__boy

#import <Foundation/Foundation.h>

@interface XYCellItem : NSObject

@property (nonatomic,strong)NSString * itemId;
@property (nonatomic,strong)NSString * itemHeadImgStr;
@property (nonatomic,strong)NSString * itemUserId;
@property (nonatomic,strong)NSString * itemUserNameStr;
@property (nonatomic,strong)NSString * itemUserSex;
@property (nonatomic,strong)NSString * itemSchoolNameStr;
@property (nonatomic,strong)NSString * itemPublishTimeStr;
@property (nonatomic,strong)NSString * itemDynamicType;//1:热门

@property (nonatomic,strong)NSMutableAttributedString * itemContentAttributedStr;
@property (nonatomic,strong)NSMutableArray * itemPhotosMArr;
@property (nonatomic,strong)NSString *  itemPhotosStr;
@property (nonatomic,strong)NSMutableArray * itemOriginPhotosMArr;
@property (nonatomic,strong)NSString *  itemOriginPhotosStr;

@property (nonatomic,strong)NSString * itemTranspondStr;
@property (nonatomic,strong)NSString * itemCommentStr;
@property (nonatomic,strong)NSString * itemPraiseStr;

@property (nonatomic,strong)NSString * itemMessage;
@property (nonatomic,strong)NSString * itemSuccess;
@property (nonatomic,strong)NSString * itemIsTranspond;
@property (nonatomic,strong)NSString * itemIsPraisedByMe;
@property (nonatomic,strong)NSString * itemUserIdentity;//用户身份0:普通1:官方

@property (nonatomic,strong)NSString * itemTranspondedIconPhoto;
@property (nonatomic,strong)NSString * itemTranspondedUserName;
@property (nonatomic,strong)NSString * itemTranspondedUserId;
@property (nonatomic,strong)NSString * itemTranspondedContent;
@property (nonatomic,strong)NSString * itemTranspondedDynamicId;
@property (nonatomic,strong)NSString * itemTranspondedUserPortrait;
@property (nonatomic,strong)NSString * itemTranspondedUserIdentity;

@end
