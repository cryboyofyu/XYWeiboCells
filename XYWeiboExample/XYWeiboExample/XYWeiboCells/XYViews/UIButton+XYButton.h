//
//  UIButton+XYButton.h
//  XYWeiboExample
//
//  Created by XY Lv on 16/12/12.
//  Copyright © 2016年 吕欣宇. All rights reserved.
//  github:https://github.com/cryboyofyu
//  博客:http://blog.csdn.net/cry__boy

#import <UIKit/UIKit.h>
#import "XYWeiboCONSTANT.h"
@interface UIButton (XYButton)

@property (nonatomic,strong)NSString * xy_btnBgImgName;

@end

@interface UIView (XYView)

@property (nonatomic,strong)NSNumber * xy_viewHeight;
@end

@interface NSString (XYString)
- (NSMutableString *)xy_dealTheMessage;

- (NSString *)xy_getDownloadImgPath;

@end

@interface NSData (XYData)

/**
 模仿SDWebImage原理,有就从本地取，否：走网络

 @param urlStr 图片地址

 @return image NSData类型
 */
+(NSData *)xy_getDataWithContentOfUrl:(NSString *)urlStr;

@end












































