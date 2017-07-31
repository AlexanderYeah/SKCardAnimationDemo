//
//  SKCardView.m
//  SKCardAnimation
//
//  Created by AY on 2017/7/31.
//  Copyright © 2017年 AlexanderYeah. All rights reserved.
//

#import "SKCardView.h"

@implementation SKCardView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initSKCardViewWithFrame:(CGRect)frame WithX:(CGFloat)x y:(CGFloat)y btnWidth:(CGFloat)btnW btnCount:(NSInteger)count btnImgArr:(NSArray *)imgArr

{
	if (self = [super initWithFrame:frame]) {
		
	
	for (int i = 0; i < imgArr.count - 1; i ++) {
		UIButton * btn1 = [[UIButton alloc]init];

		btn1.tag = 1000 + i;
		[self addSubview:btn1];
		btn1.layer.cornerRadius = btnW /2;
		btn1.layer.masksToBounds = YES;
		[btn1 setBackgroundImage:[UIImage imageNamed:imgArr[i]] forState:UIControlStateNormal];
		btn1.frame = CGRectMake(frame.origin.x, frame.origin.y + btnW * i, btnW, btnW);
		
		if (i != 0) {
		btn1.hidden = YES;
		}
		
		if (i == imgArr.count - 2) {

			_isSelected = NO;
			btn1.hidden = NO;
			[btn1 addTarget:self action:@selector(btnChangeClick:) forControlEvents:UIControlEventTouchUpInside];
			btn1.frame = CGRectMake(frame.origin.x, frame.origin.y + btnW , btnW, btnW);

			return self;
		}
		[btn1 addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
	}
		
	
		
	}
	return self;
}


- (void)btnClick:(UIButton *)btn{
	

}

- (void)btnChangeClick:(UIButton *)startBtn{

	NSLog(@"111");
	
	_isSelected = !_isSelected;
	
	UIButton *btn2 = [self viewWithTag:1000 + 1];
	UIButton *btn3 = [self viewWithTag:1000 + 2];
	UIButton *btn4 = [self viewWithTag:1000 + 3];
	UIButton *btn5 = [self viewWithTag:1000 + 4];
	
	if (_isSelected) {
	// 一旦点击 就动画
	// 1 修改btn 的锚点，让其 绕到X轴旋转
	btn2.layer.anchorPoint = CGPointMake(1,1);
	btn3.layer.anchorPoint = CGPointMake(1,1);
	btn4.layer.anchorPoint = CGPointMake(1,1);
	btn5.layer.anchorPoint = CGPointMake(1,1);
	// 2 修改锚点之后，会造成其frame 会变化,一定要返回原来的 x  和  y

	btn2.frame = CGRectMake(0, _btnWidth * 2, _btnWidth, _btnWidth);
	btn3.frame = CGRectMake(0, _btnWidth * 3, _btnWidth, _btnWidth);
	btn4.frame = CGRectMake(0, _btnWidth * 4, _btnWidth, _btnWidth);
	btn5.frame = CGRectMake(0, _btnWidth * 5, _btnWidth, _btnWidth);
	CATransform3D transform = CATransform3DIdentity;
	transform.m34 = 0.005;
	transform = CATransform3DRotate(transform, M_PI / 180 * 180,1, 0, 0);
	
	[UIView animateWithDuration:1.0f animations:^{
		startBtn.frame = CGRectMake(0, _btnWidth * 2, _btnWidth, _btnWidth);
		btn2.hidden = NO;
		[btn2.layer setTransform:transform];
	} completion:^(BOOL finished) {
		
		
//		btn3.hidden = NO;
//		[UIView animateWithDuration:1 animations:^{
//			startBtn.frame = CGRectMake(0, _btnWidth * 3, _btnWidth, _btnWidth);
//			[btn3.layer setTransform:transform];
//		} completion:^(BOOL finished) {
//			btn4.hidden = NO;
//			[UIView animateWithDuration:1 animations:^{
//			startBtn.frame = CGRectMake(0, _btnWidth * 4, _btnWidth, _btnWidth);
//			[btn4.layer setTransform:transform];
//				} completion:^(BOOL finished) {
//				btn5.hidden = NO;
//				[UIView animateWithDuration:1 animations:^{
//				startBtn.frame = CGRectMake(0, _btnWidth * 5, _btnWidth, _btnWidth);
//				[btn5.layer setTransform:transform];
//				} completion:^(BOOL finished) {
//
//				}];
//			}];
//		}];
	}];
	

	}else{
	
	
	}

	
	
}


@end
