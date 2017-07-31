//
//  SKCardView.h
//  SKCardAnimation
//
//  Created by AY on 2017/7/31.
//  Copyright © 2017年 AlexanderYeah. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SKCardView : UIView



@property (nonatomic,assign)CGFloat btnWidth;


@property (nonatomic,assign)BOOL isSelected;

// view 的x  y   按钮的 w  count

- (instancetype)initSKCardViewWithFrame:(CGRect)frame WithX:(CGFloat)x y:(CGFloat)y btnWidth:(CGFloat)btnW btnCount:(NSInteger)count btnImgArr:(NSArray *)imgArr;



@end
