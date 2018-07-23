//
//  Y_ImgTitlButton.h
//  Y_ImageTitleButton
//
//  Created by Yue on 2016/7/18.
//  Copyright © 2016年 Yue. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef enum {
    ImageTopTitleBottom,        //图上字下
    TitleTopImageBottom,        //图下字上
    ImageLeftTitleRight,        //图左字右
    TitleLeftImageRight,        //图右字左
    
    ImageLeftTitleRightLeft,    //图左字右 字靠右
    ImageLeftTitleRightCenter,  //图左字右 字居中
    
    TitleLeftImageRightCenter,  //图右字左 字居中
    TitleLeftImageRightLeft,    //图右字左 图靠左
    
    FitTitleLeftImageRight,     //图右字左适应
}ButtonStyle;

typedef void (^ButtonAction)(UIButton *sender);

/**
 button所使用的图片大小尽可能不要超过按钮的宽高
 */
@interface Y_ImgTitlButton : UIButton

@property (nonatomic, assign) UIEdgeInsets margin;
@property (nonatomic, assign) CGSize padding;
@property (nonatomic, assign) CGSize imageSize;
@property (nonatomic, assign) ButtonStyle style;

/**
 根据 button的类型 创建
 @param style button类型
 @return Button
 */
- (instancetype)initWithStyle:(ButtonStyle)style;

/**
 根据 button的类型 和 外边距 创建 button
 @param style button类型
 @param margin 外边距 (titleLabel 和 imageView 整体的外边距)
 @return Button
 */
- (instancetype)initWithStyle:(ButtonStyle)style margin:(UIEdgeInsets)margin;

/**
 根据 button的类型 和 外边距 及 内边距 创建 button
 @param style button类型
 @param margin 外边距 (titleLabel 和 imageView 整体的外边距)
 @param padding 内边距 (titleLabel 和 imageView 之间的距离)
 @return Button
 */
- (instancetype)initWithStyle:(ButtonStyle)style margin:(UIEdgeInsets)margin padding:(CGSize)padding;

/**
 按钮点击事件(TouchUpInside) 的 Action
 @param action 点击事件
 */
- (void)setClickAction:(ButtonAction)action;

@end
