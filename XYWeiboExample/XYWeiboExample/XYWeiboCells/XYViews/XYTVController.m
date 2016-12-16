//
//  XYTVController.m
//  XYWeiboExample
//
//  Created by XY Lv on 16/12/12.
//  Copyright © 2016年 吕欣宇. All rights reserved.
//  github:https://github.com/cryboyofyu
//  博客:http://blog.csdn.net/cry__boy

#import "XYTVController.h"
#import "XYTVCell.h"
#import "XYWeiboCONSTANT.h"
#import "IDMPhoto.h"
#import "IDMPhotoBrowser.h"
@interface XYTVController ()<XYCellTouchMethodsDelegate>

@end

@implementation XYTVController
- (id)init{
    self = [super init];
    if(self){
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.tableView.backgroundColor = xy_grayColor;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _xy_dataMArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * identifer = @"xy_cell";
    XYTVCell * cell = [tableView dequeueReusableCellWithIdentifier:identifer];
    if(cell == nil){
        cell = [[XYTVCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifer];
    }
    cell.xy_cellDelegate = self;
    cell.tag = indexPath.row;
    cell.xy_isHidePullDownBtn = _xy_isShowHideArrow;
    cell.xy_isShowColor = NO;
    cell.xy_textNumberOfLine = _xy_numberOfLine;
    
    if(self.xy_statusFrame.count>0){
        cell.xy_cellFrame = self.xy_statusFrame[indexPath.row];
    }
    NSLog(@"%@",xy_statement);
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(self.xy_statusFrame.count >0){
        XYCellFrame * frame = self.xy_statusFrame[indexPath.row];
        
        return frame.xy_cellHeight;
    }
    return 100;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"cell被点击了");
    
    if([self.xy_delegate respondsToSelector:@selector(xy_cellSelectedDelegate:withIndexPath:)]){
        [self.xy_delegate xy_cellSelectedDelegate:tableView withIndexPath:indexPath];
    }
    
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return  self.xy_isEdit;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"commitEditingStyle");
    XYTVCell * cell = [tableView cellForRowAtIndexPath:indexPath];
    if(editingStyle == UITableViewCellEditingStyleDelete){
        
        if([self.xy_delegate respondsToSelector:@selector(xy_tableViewCellDeletedDelegate:withIndexPath:)]){
            [self.xy_delegate xy_tableViewCellDeletedDelegate:cell withIndexPath:indexPath];
        }
        [self.xy_dataMArr removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

- (NSArray *)xy_statusFrame{
    if(_xy_statusFrame == nil ||_xy_statusFrame.count != self.xy_dataMArr.count || _xy_statusFrame.count == 1){
        NSMutableArray * models = [NSMutableArray arrayWithCapacity:100];
        for (XYCellItem * item in _xy_dataMArr){
            XYCellFrame * frame = [[XYCellFrame alloc]init];
            frame.xy_numberOfLine = _xy_numberOfLine;
            [frame setXy_cellItem:item];
            [models addObject:frame];
        }
        self.xy_statusFrame = [models copy];
    }
    return _xy_statusFrame;
}

#pragma mark-lv -------------------------代理位置---------------------------------------
- (void)xy_homePhotoTapDelegate:(id)sender withObject:(id)object{
    UIView * view = (UIView *)sender;
    XYTVCell * cell = (XYTVCell *)object;
    XYCellItem * item = [_xy_dataMArr objectAtIndex:cell.tag];
    NSMutableArray * photoMArr = [[NSMutableArray alloc]init];
    for(id img in item.itemPhotosMArr){
        IDMPhoto * xy_photo;
        if([img isKindOfClass:[NSURL class]]){
             xy_photo= [IDMPhoto photoWithURL:img];

            
        }else if([img isKindOfClass:[NSString class]]){
            xy_photo = [IDMPhoto photoWithURL:[NSURL URLWithString:img]];
            
        }else if([img isKindOfClass:[UIImage class]]){
            xy_photo = [IDMPhoto photoWithImage:img];
            
        }
        
        [photoMArr addObject:xy_photo];
    }
    IDMPhotoBrowser * photoBrowser = [[IDMPhotoBrowser alloc]initWithPhotos:photoMArr animatedFromView:view];
    photoBrowser.displayToolbar = NO;
    photoBrowser.displayDoneButton = NO;
    photoBrowser.autoHideInterface = NO;
    [photoBrowser setInitialPageIndex:view.tag];
    if(photoMArr.count>0){
        [self presentViewController:photoBrowser animated:YES completion:nil];
        
    }
}

- (void)xy_headTapDelegate:(id)sender withObject:(id)object{
    NSLog(@"头像被点击了");
    
    if([self.xy_delegate respondsToSelector:@selector(lvTableViewCellHeadTap:withObject:)]){
        [self.xy_delegate xy_tableViewCellHeadTap:sender withObject:object];
    }
    
}

- (void)xy_transpondBtnClickDelegate:(id)sender withObject:(id)object{
    NSLog(@"转发按钮被点击了");
    if([self.xy_delegate respondsToSelector:@selector(lvTableViewCellTranspondTap:withObject:)]){
        [self.xy_delegate xy_tableViewCellTranspondTap:sender withObject:object];
    }
}

- (void)xy_commentBtnClickDelegate:(id)sender withObject:(id)object{
    NSLog(@"评论按钮被点击了");
    if([self.xy_delegate respondsToSelector:@selector(lvTableViewCellCommentTap:withObject:)]){
        [self.xy_delegate xy_tableViewCellCommentTap:sender withObject:object];
    }
}

- (void)xy_praiseBtnClickDelegate:(id)sender withObject:(id)object{
    NSLog(@"点赞按钮被点击了");
    
    if([self.xy_delegate respondsToSelector:@selector(xy_tableViewCellPraiseTap:withObject:)]){
        [self.xy_delegate xy_tableViewCellPraiseTap:sender withObject:object];
    }
}

- (void)xy_transpondedBgViewTapDelegate:(id)sender withObject:(id)object{
    
    if([self.xy_delegate respondsToSelector:@selector(xy_tableViewCellTranspondedBgViewTap:withObject:)]){
        [self.xy_delegate xy_tableViewCellTranspondedBgViewTap:sender withObject:object];
    }
}

- (void)xy_scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset{
    NSLog(@"targetContentOffset");
    
}

- (void)xy_pullDownArrowBtnClickDelegate:(id)sender withObject:(id)object{
    if([_xy_delegate respondsToSelector:@selector(xy_tableViewCellArrowBtnClick:withObject:)]){
        [self.xy_delegate xy_tableViewCellArrowBtnClick:sender withObject:object];
    }
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
