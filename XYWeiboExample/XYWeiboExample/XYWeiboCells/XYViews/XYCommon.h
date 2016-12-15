//
//  XYCommon.h
//  XYWeiboExample
//
//  Created by XY Lv on 16/12/12.
//  Copyright © 2016年 吕欣宇. All rights reserved.
//  github:https://github.com/cryboyofyu
//  博客:http://blog.csdn.net/cry__boy

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,XYE_DetectorType){
    XYDetector_urlType,
    XYDetector_phoneType,
    
};


@interface XYCommon : NSObject

+ (CGSize)xy_sizeWithStr:(NSString *)str font:(UIFont *)font maxSize:(CGSize)maxSize;

+ (NSMutableDictionary *)xy_detectorStrWithStr:(NSString *)str withStrCheckType:(NSTextCheckingTypes)checkType;

@end



























