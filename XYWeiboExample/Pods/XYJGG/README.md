# XYJGG
自定义图片九宫格（一句代码集成，简单，高效，简单点击回调，自动识别数据源三种格式：UIImage,NSString,URL）
／＊个人邮箱：892569921@qq.com
   个人博客：http://blog.csdn.net/cry__boy
   
   实现九宫格图片排列，一句代码集成，不懂得或者有问题可以email 哦
   1.使用方法
   需要有  ‘SDWebImage’这个库，如果项目中已经有了，不必再加，如果没有上就好，其他不用管。
   XYJGGView * xyJGGView = [[XYJGGView alloc]initWithFrame:CGRectMake(XY_Padding, 0, XY_Width - XY_Padding*2, 100) withXYPhotosDataMArr:xyPhotosDataMArr withXYPlaceholderImg:[UIImage imageNamed:@"girl2.jpg"] withBgView:xyCell.contentView withXYItemViewTapBlock:^(UIView *xyItemView, NSMutableArray *xyPhotosDataMArr) {
        //这里是点击图片的回调事件，返回了点击该图片的对象，和该图片所在的图片数据源数组
      NSLog(@"点击了第:%ld张图片,图片所在数据数组:%@",xyItemView.tag+1,xyPhotosDataMArr);
    }];
    2.调整图片大小
在 XYConstant.h 文件中分别定义了 一张图片，四张图片的，默认图片的样式，需要调整的时候直接改宏就好，如果需要更多样式，发邮件给我，小弟继续更新。
   欢迎大家提意见，一起交流学习，会根据大家的反馈及时更新。谢谢！
   如果小弟的一点点薄力可以给大家带来便利，小弟三生有幸！会再接再厉！您的支持就是我的动力！
   后续会添加 《自定义表情键盘》《类似微信朋友圈自定义图文混排》，感兴趣的要关注哦！
