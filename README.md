# XYWeiboCells
自定义类似微博界面（图文混排，优化流畅性，高度封装）
===
<br>个人邮箱：892569921@qq.com [我的CSDN](http://blog.csdn.net/cry__boy):http://blog.csdn.net/cry__boy <br/>
<br>添加方法：cocoapods<br/>
<br>pod ‘XYWeiboCells’<br/> 
---
<br>1.方法：<br/>
```objective-c
 _xyTVController = [[XYTVController alloc]init]; 

_xyTVController.xy_dataMArr = _xyDataMArr;

 _xyTVController.view.frame = CGRectMake(0,64, xy_width, xy_height - 64); 

_xyTVController.xy_delegate = self; _xyTVController.xy_numberOfLine = 5; 

_xyTVController.tableView.backgroundColor = xy_grayColor;    [

self.view addSubview:_xyTVController.tableView];    

遵守协议：《XYTVControllerDelegate》 
```

<br>2.对接接口：（头像，cell，图片放大，点赞，转发，评论）<br/>

 <br>#pragma mark-lv ---------------------代理位置------------------------------<br/>
```objective-c
(void)xy_cellSelectedDelegate:(id)sender withIndexPath:(NSIndexPath *)indexPath{ NSLog(@"\n进入了详情页\n"); }

(void)xy_tableViewCellHeadTap:(id)sender withObject:(id)object{ NSLog(@"\n进入了个人页\n"); }

(void)xy_tableViewCellPraiseTap:(id)sender withObject:(id)object{

[[self class] cancelPreviousPerformRequestsWithTarget:self selector:@selector(xy_praiseButtonClick:) object:object]; [self performSelector:@selector(xy_praiseButtonClick:) withObject:object afterDelay:0.3]; }

(void)xy_praiseButtonClick:(id)sender{

XYTVCell * cell = sender; XYCellFrame * frame;

frame = [_xyTVController.xy_statusFrame objectAtIndex:cell.tag];

[self xy_requestPraiseWithDynamicId:[NSString stringWithFormat:@"%@",frame.xy_cellItem.itemId] withCell:cell];

}

(void)xy_tableViewCellCommentTap:(id)sender withObject:(id)object { NSLog(@"\n进入详情页\n");
}

(void)xy_tableViewCellTranspondTap:(id)sender withObject:(id)object{ NSLog(@"\n转发事件触发了\n"); XYTVCell * cell = object;
 LVSendStatusVC * lvSendStatusVC = [[LVSendStatusVC alloc]init]; 

 lvSendStatusVC.hidesBottomBarWhenPushed = YES; 

lvSendStatusVC.lvTitle = @"转发"; 

 lvSendStatusVC.textViewBgViewH = kLV(85); 

 lvSendStatusVC.isShowNewsBgView = YES; 

 lvSendStatusVC.lvItem = cell.lvNewsFrame.lvNewsItem; 

 if(_categoryView.lvSelectedTag !=1){

  [self.navigationController pushViewController:lvSendStatusVC animated:YES]; //
 }else{ // [LVHUD showCustomHUDWithBgView:self.view withTitle:@"暂未开通此功能!"]; // } }

(void)xy_tableViewCellTranspondedBgViewTap:(id)sender withObject:(id)object{ NSLog(@"\n转发事件触发了\n"); }

(void)lvTableViewCellArrowBtnClick:(id)sender withObject:(id)object{ XYTVCell * cell = object; // _selectedDynamicId = cell.lvNewsFrame.lvNewsItem.itemId; // [_lvMoreActionSheet showInView:self.view]; }

(void)didReceiveMemoryWarning { [super didReceiveMemoryWarning]; // Dispose of any resources that can be recreated. }

pragma mark-xy--------------------------点击事件位置------------------------------

(void)xy_requestPraiseWithDynamicId:(NSString )dynamicId withCell:(XYTVCell)cell{

cell.xy_praiseBtn.selected = YES; NSInteger praiseValue = [cell.xy_praiseBtn.currentTitle integerValue];

XYCellFrame * xyFrame = [_xyTVController.xy_statusFrame objectAtIndex:cell.tag];

xyFrame.xy_cellItem.itemPraiseStr = [NSString stringWithFormat:@"%ld",(long)praiseValue]; xyFrame.xy_cellItem.itemIsPraisedByMe = @"1";

 praiseValue ++; [cell.xy_praiseBtn setTitle:[NSString stringWithFormat:@"%ld",(long)praiseValue] forState:UIControlStateNormal];

} 
```
---
<br>**欢迎大家提意见，一起交流学习，会根据大家的反馈及时更新。谢谢！**<br/>
<br>**如果小弟的一点点薄力可以给大家带来便利，小弟三生有幸！会再接再厉！您的支持就是我的动力！**<br/>
<br>**还有《自定义表情键盘》《自定义九宫格》，感兴趣的要关注哦！**<br/>
