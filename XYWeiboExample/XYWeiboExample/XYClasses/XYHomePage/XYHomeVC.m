//
//  XYHomeVC.m
//  XYWeiboExample
//
//  Created by XY Lv on 16/12/12.
//  Copyright © 2016年 吕欣宇. All rights reserved.
//  github:https://github.com/cryboyofyu
//  博客:http://blog.csdn.net/cry__boy

#import "XYHomeVC.h"
#import "XYWeiboCONSTANT.h"
#import "XYTVController.h"
#import "XYCellItem.h"
#import "XYTVCell.h"
@interface XYHomeVC ()<XYTVControllerDelegate>
{
    XYTVController * _xyTVController;
    NSMutableArray * _xyDataMArr;

}
@end

@implementation XYHomeVC


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"Github上点个赞！";
    self.view.backgroundColor = xy_grayColor;
    
    [self xy_initDataMArr];
    [self xy_layoutTableView];
}

- (void)xy_initDataMArr{
    _xyDataMArr = [[NSMutableArray alloc]init];
         for (int i=0;i<38;i++){
     XYCellItem * item = [[XYCellItem alloc]init];
     item.itemHeadImgStr = @"NewGirl2.jpeg";
     item.itemUserNameStr = @"欣宇";
     item.itemSchoolNameStr = @"北京林业大学";
     item.itemPublishTimeStr = @"1分钟前";
     item.itemTranspondStr = @"111";
     item.itemCommentStr = @"99";
     item.itemPraiseStr = @"13";
     item.itemContentAttributedStr = [[NSMutableAttributedString alloc]initWithString:@"感觉还不错的话，大家在Github上点个赞👍，谢谢！～吕欣宇～www.github.com/cryboyofyu"];

     item.itemPhotosMArr = [[NSMutableArray alloc]init];
     if(i%8==0){
         item.itemContentAttributedStr = [[NSMutableAttributedString alloc]initWithString:@"还给大家提供了美女哦～就冲这照片是不是得给个赞，大家在Github上点个赞👍，谢谢!github:https:www.github.com/cryboyofyu"];

     for(int i=0;i<1;i++){
         
     [item.itemPhotosMArr addObject:[UIImage imageNamed:@"NewGirl1.jpeg"]];
     }
     }
     if(i%8==1){
    item.itemContentAttributedStr = [[NSMutableAttributedString alloc]initWithString:xy_statement];

     for(int i=0;i<4;i++){
     [item.itemPhotosMArr addObject:[UIImage imageNamed:@"NewGirl3.jpg"]];
     }
     }
     if(i%8==2){
     for(int i=0;i<6;i++){
     [item.itemPhotosMArr addObject:[UIImage imageNamed:@"NewGirl4.jpg"]];
     }
     }
     if(i%8==3){
         item.itemContentAttributedStr = [[NSMutableAttributedString alloc]initWithString:@"～吕欣宇～伸出你的双手支持一下👍，https:www.github.com/cryboyofyu，给大家还提供了美女哦～你总说毕业摇摇无期，转眼就各奔东西,不舍得为你流一滴眼泪，眼泪的珍贵你可知道"];
     for(int i=0;i<8;i++){
     [item.itemPhotosMArr addObject:[UIImage imageNamed:@"NewGirl5.jpg"]];
     }
     }
    if(i%8==4){
     item.itemContentAttributedStr = [[NSMutableAttributedString alloc]initWithString:@"～吕欣宇～伸出你的双手支持一下👍，https:www.github.com/cryboyofyu，还支持图文混排哦，还有自定义表情键盘，表情是动态的哦，自己可以随意添加。"];
                 for(int i=0;i<8;i++){
                     [item.itemPhotosMArr addObject:[UIImage imageNamed:@"NewGirl5.jpg"]];
                 }
             }
     [_xyDataMArr addObject:item];
    }
     
    
}

- (void)xy_layoutTableView{
    _xyTVController = [[XYTVController alloc]init];
    _xyTVController.xy_dataMArr = _xyDataMArr;
    _xyTVController.view.frame = CGRectMake(0,64, xy_width, xy_height - 64);
    _xyTVController.xy_delegate = self;
    _xyTVController.xy_numberOfLine = 5;
    _xyTVController.tableView.backgroundColor = xy_grayColor;
    [self.view addSubview:_xyTVController.tableView];
}

#pragma mark-lv ---------------------代理位置------------------------------
- (void)xy_cellSelectedDelegate:(id)sender withIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"\n进入了详情页\n");
}

- (void)xy_tableViewCellHeadTap:(id)sender withObject:(id)object{
    NSLog(@"\n进入了个人页\n");
}

- (void)xy_tableViewCellPraiseTap:(id)sender withObject:(id)object{
    
    [[self class] cancelPreviousPerformRequestsWithTarget:self selector:@selector(xy_praiseButtonClick:) object:object];
    [self performSelector:@selector(xy_praiseButtonClick:) withObject:object afterDelay:0.3];
}

- (void)xy_praiseButtonClick:(id)sender{
    
    XYTVCell * cell = sender;
    XYCellFrame * frame;
    
    frame = [_xyTVController.xy_statusFrame objectAtIndex:cell.tag];
    
    [self xy_requestPraiseWithDynamicId:[NSString stringWithFormat:@"%@",frame.xy_cellItem.itemId] withCell:cell];
    
}

- (void)xy_tableViewCellCommentTap:(id)sender withObject:(id)object
{
    NSLog(@"\n进入详情页\n");

}

- (void)xy_tableViewCellTranspondTap:(id)sender withObject:(id)object{
    NSLog(@"\n转发事件触发了\n");
    XYTVCell * cell = object;
    
//    LVSendStatusVC  * lvSendStatusVC = [[LVSendStatusVC alloc]init];
//    lvSendStatusVC.hidesBottomBarWhenPushed = YES;
//    lvSendStatusVC.lvTitle = @"转发";
//    lvSendStatusVC.textViewBgViewH = kLV(85);
//    lvSendStatusVC.isShowNewsBgView = YES;
//    lvSendStatusVC.lvItem = cell.lvNewsFrame.lvNewsItem;
//    if(_categoryView.lvSelectedTag !=1){
//        [self.navigationController pushViewController:lvSendStatusVC animated:YES];
//        
//    }else{
//        [LVHUD showCustomHUDWithBgView:self.view withTitle:@"暂未开通此功能!"];
//    }
}

- (void)xy_tableViewCellTranspondedBgViewTap:(id)sender withObject:(id)object{
    NSLog(@"\n转发事件触发了\n");
}

- (void)lvTableViewCellArrowBtnClick:(id)sender withObject:(id)object{
    XYTVCell * cell = object;
//    _selectedDynamicId = cell.lvNewsFrame.lvNewsItem.itemId;
//    [_lvMoreActionSheet showInView:self.view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark-xy--------------------------点击事件位置------------------------------
- (void)xy_requestPraiseWithDynamicId:(NSString *)dynamicId withCell:(XYTVCell*)cell{
    
    cell.xy_praiseBtn.selected = YES;
    NSInteger  praiseValue = [cell.xy_praiseBtn.currentTitle integerValue];
    praiseValue ++;
    [cell.xy_praiseBtn setTitle:[NSString stringWithFormat:@"%ld",(long)praiseValue] forState:UIControlStateNormal];

    XYCellFrame * xyFrame = [_xyTVController.xy_statusFrame objectAtIndex:cell.tag];

    xyFrame.xy_cellItem.itemPraiseStr = [NSString stringWithFormat:@"%ld",(long)praiseValue];
    xyFrame.xy_cellItem.itemIsPraisedByMe = @"1";

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





















