//
//  XYTVController.h
//  XYWeiboExample
//
//  Created by XY Lv on 16/12/12.
//  Copyright © 2016年 吕欣宇. All rights reserved.
//  github:https://github.com/cryboyofyu
//  博客:http://blog.csdn.net/cry__boy

#import <UIKit/UIKit.h>

@protocol XYTVControllerDelegate <NSObject>

@optional
- (void)xy_cellSelectedDelegate:(id)sender withIndexPath:(NSIndexPath *)indexPath;

- (void)xy_tableViewCellHeadTap:(id)sender withObject:(id)object;

- (void)xy_tableViewCellPraiseTap:(id)sender withObject:(id)object;

- (void)xy_tableViewCellCommentTap:(id)sender withObject:(id)object;

- (void)xy_tableViewCellTranspondTap:(id)sender withObject:(id)object;

- (void)xy_tableViewCellTranspondedBgViewTap:(id)sender withObject:(id)object;

- (void)xy_tableViewCellArrowBtnClick:(id)sender withObject:(id)object;

- (void)xy_tableViewCellDeletedDelegate:(id)sender withIndexPath:(NSIndexPath *)indexPath;

@end

@interface XYTVController : UITableViewController
@property (nonatomic,strong)NSMutableArray * xy_dataMArr;
@property (nonatomic,strong)NSArray * xy_statusFrame;
@property (nonatomic,assign)BOOL xy_removeRefreshAndReload;
@property (nonatomic,assign)BOOL   xy_isEdit;
@property (nonatomic,assign)BOOL   xy_isShowHideArrow;//是否隐藏下拉箭头
@property (nonatomic,assign)NSInteger xy_numberOfLine;
@property (nonatomic,weak)id<XYTVControllerDelegate>xy_delegate;
@end



























