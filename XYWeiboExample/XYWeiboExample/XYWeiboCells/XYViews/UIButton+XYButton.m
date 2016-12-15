//
//  UIButton+XYButton.m
//  XYWeiboExample
//
//  Created by XY Lv on 16/12/12.
//  Copyright © 2016年 吕欣宇. All rights reserved.
//  github:https://github.com/cryboyofyu
//  博客:http://blog.csdn.net/cry__boy

#import "UIButton+XYButton.h"
#import <objc/runtime.h>
#import "YYText.h"
#import "YYImage.h"
#import "SDWebImageManager.h"
@implementation UIButton (XYButton)

- (id)xy_btnBgImgName{
    id object = objc_getAssociatedObject(self, @"xy");
    return object;
}

- (void)setXy_btnBgImgName:(NSString *)xy_btnBgImgName{
    
    objc_setAssociatedObject(self,@"xy",xy_btnBgImgName,OBJC_ASSOCIATION_COPY_NONATOMIC);
}

@end

@implementation UIView(XYView)

- (id)xy_viewHeight{
    
    id object = objc_getAssociatedObject(self, @"viewHeight");
    return object;
}

- (void)setXy_viewHeight:(NSNumber *)xy_viewHeight{
    
    [self willChangeValueForKey:@"viewHeight"];
    objc_setAssociatedObject(self, @"viewHeight", xy_viewHeight, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self didChangeValueForKey:@"viewHeight"];
}

@end

@implementation NSString(XYString)

- (NSMutableAttributedString *)xy_dealTheMessage
{
    NSDictionary * emotionDic = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"emotionImage" ofType:@"plist"]];
    NSMutableAttributedString * attriStr = [[NSMutableAttributedString alloc]initWithString:self];
    attriStr.yy_font = xy_contentFont;
    attriStr.yy_lineSpacing = 2;
    NSString *pattern = @"\\[[0-9a-zA-Z\\u4e00-\\u9fa5]+\\]";
    NSRegularExpression * regular = [[NSRegularExpression alloc]initWithPattern:pattern options:NSRegularExpressionCaseInsensitive error:nil];
    NSArray * arr = [regular matchesInString:attriStr.string options:NSMatchingReportProgress range:NSMakeRange(0, attriStr.string.length)];
    NSMutableArray * imgArr = [NSMutableArray arrayWithCapacity:0];
    NSMutableArray * rangeArr = [NSMutableArray arrayWithCapacity:0];
    
    for(NSTextCheckingResult * result in arr){
        NSString * matchStr = [attriStr.string substringWithRange:result.range];
        
        if([[emotionDic allKeys] containsObject:matchStr] ){
            NSString * imageName = [emotionDic objectForKey:matchStr];
            NSString * path = [[NSBundle mainBundle] pathForResource:[imageName componentsSeparatedByString:@"."][0] ofType:[imageName componentsSeparatedByString:@"."][1]];
            NSLog(@"xy_取出的图片地址是:%@",path);
            NSData * data = [NSData dataWithContentsOfFile:path];
            YYImage * img = [YYImage imageWithData:data scale:2];
            img.preloadAllAnimatedImageFrames = YES;
            YYAnimatedImageView * imgView= [[YYAnimatedImageView alloc]initWithFrame:CGRectMake(0, 0, 30, 30)];
            //判断是否是彩条    应该算一下：取出的图片多大设置多大
            if([matchStr rangeOfString:@"[pt"].location !=NSNotFound){
                imgView.frame = CGRectMake(0, 0, 200, 30);
            }
            imgView.image = img;
            NSMutableAttributedString * attachment = [NSMutableAttributedString yy_attachmentStringWithContent:imgView contentMode:UIViewContentModeCenter attachmentSize:imgView.frame.size alignToFont:[UIFont systemFontOfSize:16] alignment:YYTextVerticalAlignmentCenter];
            [imgArr insertObject:attachment atIndex:0];
            [rangeArr insertObject:result atIndex:0];
        }else{
            //网络取
            NSData * imgData = [NSData xy_getDataWithContentOfUrl:@"http:www.lvxinyu.com"];
            YYImage * img = [YYImage imageWithData:imgData scale:2];
            img.preloadAllAnimatedImageFrames = YES;
            YYAnimatedImageView * imgView = [[YYAnimatedImageView alloc]initWithFrame:CGRectMake(0, 0, img.size.width, img.size.height)];
            imgView.image = img;
            NSMutableAttributedString * attachment = [NSMutableAttributedString yy_attachmentStringWithContent:imgView contentMode:UIViewContentModeCenter attachmentSize:imgView.frame.size alignToFont:[UIFont systemFontOfSize:16] alignment:YYTextVerticalAlignmentCenter];
            [imgArr insertObject:attachment atIndex:0];
            [rangeArr insertObject:result atIndex:0];
            
        }
    }
    int i=0;
    for(NSTextCheckingResult * result in rangeArr){
        NSMutableAttributedString * attachemnt = [imgArr objectAtIndex:i];
        [attriStr replaceCharactersInRange:result.range withAttributedString:attachemnt];
        i++;
    }
    
    return attriStr;
}

- (NSString *)xy_getDownloadImgPath{
    NSString * path = [NSHomeDirectory() stringByAppendingString:[NSString stringWithFormat:@"/Documents/%@",self]];
    return path;
}

@end

@implementation NSData(XYData)

+ (NSData *)xy_getDataWithContentOfUrl:(NSString *)urlStr{
    NSString * path = [urlStr xy_getDownloadImgPath];
    NSData * imgData;
    if([NSData dataWithContentsOfFile:path]){
        imgData = [NSData dataWithContentsOfFile:path];
    }else{
        imgData = [NSData dataWithContentsOfURL:[NSURL URLWithString:urlStr]];
        [imgData writeToFile:path atomically:YES];
    }
    
    return imgData;
}

@end






























