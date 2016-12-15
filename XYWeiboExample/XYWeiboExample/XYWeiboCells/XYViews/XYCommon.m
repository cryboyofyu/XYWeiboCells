//
//  XYCommon.m
//  XYWeiboExample
//
//  Created by XY Lv on 16/12/12.
//  Copyright © 2016年 吕欣宇. All rights reserved.
//  github:https://github.com/cryboyofyu
//  博客:http://blog.csdn.net/cry__boy

#import "XYCommon.h"

@implementation XYCommon

+ (CGSize)xy_sizeWithStr:(NSString *)str font:(UIFont *)font maxSize:(CGSize)maxSize{
    NSDictionary * xyDict = @{NSFontAttributeName:font};
    CGSize size = [str boundingRectWithSize:maxSize options:NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:xyDict context:nil].size;
    
    return size;
}

+ (NSMutableDictionary *)xy_detectorStrWithStr:(NSString *)str withStrCheckType:(NSTextCheckingTypes)checkType{
    NSError * xyError = nil;
    NSDataDetector * xyDataDetector = [NSDataDetector dataDetectorWithTypes:checkType error:&xyError];
    __block NSMutableDictionary * xyDic = [[NSMutableDictionary alloc]init];
    [xyDataDetector enumerateMatchesInString:str options:kNilOptions range:NSMakeRange(0, str.length) usingBlock:^(NSTextCheckingResult * _Nullable result, NSMatchingFlags flags, BOOL * _Nonnull stop) {
        NSRange xyRange = NSMakeRange(0, 0);
        if(result.URL){
            xyRange = result.range;
            [xyDic setObject:NSStringFromRange(xyRange) forKey:@"xy_range"];
            [xyDic setObject:result.URL forKey:@"xy_url"];
            [xyDic setObject:[NSNumber numberWithInteger:XYDetector_urlType] forKey:@"xy_type"];
        }else if(result.phoneNumber){
            xyRange = result.range;
            [xyDic setObject:NSStringFromRange(xyRange) forKey:@"xy_range"];
            [xyDic setObject:result.phoneNumber forKey:@"xy_phoneNum"];
            [xyDic setObject:[NSNumber numberWithInteger:XYDetector_phoneType] forKey:@"xy_type"];
        }
    }];
    return xyDic;
}


@end







































