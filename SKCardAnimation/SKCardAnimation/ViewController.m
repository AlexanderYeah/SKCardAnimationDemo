//
//  ViewController.m
//  SKCardAnimation
//
//  Created by AY on 2017/7/25.
//  Copyright © 2017年 AlexanderYeah. All rights reserved.
//

#import "ViewController.h"
#import "SKCardView.h"
#define kBtnW 60
@interface ViewController ()


@property (nonatomic,strong)UIButton *btn1;
@property (nonatomic,strong)UIButton *btn2;
@property (nonatomic,strong)UIButton *btn3;
@property (nonatomic,strong)UIButton *btn4;
@property (nonatomic,strong)UIButton *btn5;

@property (nonatomic,strong)UIButton *startBtn;

@property (nonatomic,assign)BOOL isSelected;

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	
	
//	NSArray *imgArr = @[@"1",@"2",@"3",@"4",@"5",@"上箭头",@"下箭头"];
//	
//	SKCardView * card = [[SKCardView alloc]initSKCardViewWithFrame:CGRectMake(20, 100, 50, 300) WithX:0 y:0 btnWidth:50 btnCount:6 btnImgArr:imgArr];
//	[self.view addSubview:card];
	[self createUI];
	
	
	
}

- (void)createUI{
	
	_btn1 = [[UIButton alloc]init];
	[_btn1 setBackgroundColor:kRandomColor];
	[_btn1 addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:_btn1];
	[_btn1 setBackgroundImage:[UIImage imageNamed:@"1"] forState:UIControlStateNormal];
	_btn1.layer.cornerRadius = kBtnW /2;
	_btn1.layer.masksToBounds = YES;
	_btn1.frame = CGRectMake(200, 100, kBtnW, kBtnW);
	
	
	_btn2 = [[UIButton alloc]init];
	[_btn2 setBackgroundColor:kRandomColor];
	[_btn2 addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:_btn2];
	[_btn2 setBackgroundImage:[UIImage imageNamed:@"2"] forState:UIControlStateNormal];
	_btn2.layer.cornerRadius = kBtnW /2;
	_btn2.layer.masksToBounds = YES;
	_btn2.frame = CGRectMake(200, 100, kBtnW, kBtnW);
	
	
	_btn3 = [[UIButton alloc]init];
	[_btn3 setBackgroundColor:kRandomColor];
	[_btn3 addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:_btn3];
	[_btn3 setBackgroundImage:[UIImage imageNamed:@"3"] forState:UIControlStateNormal];
		_btn3.layer.cornerRadius = kBtnW /2;
	_btn3.layer.masksToBounds = YES;
	_btn3.frame = CGRectMake(200, 160, kBtnW, kBtnW);
	
	
	_btn4 = [[UIButton alloc]init];
	[_btn4 setBackgroundColor:kRandomColor];
	[_btn4 addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:_btn4];
	[_btn4 setBackgroundImage:[UIImage imageNamed:@"4"] forState:UIControlStateNormal];
		_btn4.layer.cornerRadius = kBtnW /2;
	_btn4.layer.masksToBounds = YES;
	_btn4.frame = CGRectMake(200, 220, kBtnW, kBtnW);
	
	
	_btn5 = [[UIButton alloc]init];
	[_btn5 setBackgroundColor:kRandomColor];
	[_btn5 addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:_btn5];
	[_btn5 setBackgroundImage:[UIImage imageNamed:@"5"] forState:UIControlStateNormal];
		_btn5.layer.cornerRadius = kBtnW /2;
	_btn5.layer.masksToBounds = YES;
	_btn5.frame = CGRectMake(200, 280, kBtnW, kBtnW);
	
	
	_btn2.hidden = YES;
	_btn3.hidden = YES;
	_btn4.hidden = YES;
	_btn5.hidden = YES;
	
	
	_startBtn = [[UIButton alloc]init];

	[_startBtn addTarget:self action:@selector(startBtnClick:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:_startBtn];
	[_startBtn setBackgroundImage:[UIImage imageNamed:@"下箭头"] forState:UIControlStateNormal];
	_startBtn.frame = CGRectMake(200, 160 , kBtnW, kBtnW);
	_isSelected = NO;
	
	

}


- (void)btnClick:(UIButton *)btn{


	

}

- (void)startBtnClick:(UIButton *)startBtn
{
	
	_isSelected = !_isSelected;
	
	
	
	if (_isSelected) {
		[_startBtn setBackgroundImage:[UIImage imageNamed:@"下箭头"] forState:UIControlStateNormal];
	// 一旦点击 就动画
	// 1 修改btn 的锚点，让其 绕到X轴旋转
	_btn2.layer.anchorPoint = CGPointMake(1,1);
	_btn3.layer.anchorPoint = CGPointMake(1,1);
	_btn4.layer.anchorPoint = CGPointMake(1,1);
	_btn5.layer.anchorPoint = CGPointMake(1,1);
	// 2 修改锚点之后，会造成其frame 会变化,一定要返回原来的 x  和  y

	_btn2.frame = CGRectMake(200, 100, kBtnW, kBtnW);
	_btn3.frame = CGRectMake(200, 160, kBtnW, kBtnW);
	_btn4.frame = CGRectMake(200, 220, kBtnW, kBtnW);
	_btn5.frame = CGRectMake(200, 280, kBtnW, kBtnW);
	CATransform3D transform = CATransform3DIdentity;
	transform.m34 = 0.005;
	transform = CATransform3DRotate(transform, M_PI / 180 * 180,1, 0, 0);
	
	[UIView animateWithDuration:1.0f animations:^{
		_startBtn.frame = CGRectMake(200, 160 + 1 * kBtnW, kBtnW, kBtnW);
		_btn2.hidden = NO;
		[_btn2.layer setTransform:transform];
	} completion:^(BOOL finished) {
		
		
		_btn3.hidden = NO;
		[UIView animateWithDuration:1 animations:^{
			_startBtn.frame = CGRectMake(200, 160 + 2 * kBtnW, kBtnW, kBtnW);
			[_btn3.layer setTransform:transform];
		} completion:^(BOOL finished) {
			_btn4.hidden = NO;
			[UIView animateWithDuration:1 animations:^{
			_startBtn.frame = CGRectMake(200, 160 + 3 * kBtnW, kBtnW, kBtnW);
			[_btn4.layer setTransform:transform];
				} completion:^(BOOL finished) {
				_btn5.hidden = NO;
				[UIView animateWithDuration:1 animations:^{
				_startBtn.frame = CGRectMake(200, 160 + 4 * kBtnW, kBtnW, kBtnW);
				[_btn5.layer setTransform:transform];
				} completion:^(BOOL finished) {

				}];
			}];
		}];
	}];
	

	}else{
		// 收回
		
	[_startBtn setBackgroundImage:[UIImage imageNamed:@"上箭头"] forState:UIControlStateNormal];

	CATransform3D transform = CATransform3DIdentity;
	transform.m34 = 0.005;
	transform = CATransform3DRotate(transform, -M_PI / 180 * 90,1, 0, 0);
	

		
	[UIView animateWithDuration:1.0f animations:^{
		[_btn5.layer setTransform:transform];
		_startBtn.frame = CGRectMake(200, 160 + 3 * kBtnW, kBtnW, kBtnW);
	} completion:^(BOOL finished) {
		[UIView animateWithDuration:1.0f animations:^{
			[_btn4.layer setTransform:transform];
			_startBtn.frame = CGRectMake(200, 160 + 2 * kBtnW, kBtnW, kBtnW);
		} completion:^(BOOL finished) {
			[UIView animateWithDuration:1.0f animations:^{
				[_btn3.layer setTransform:transform];
				_startBtn.frame = CGRectMake(200, 160 + 1 * kBtnW, kBtnW, kBtnW);

			} completion:^(BOOL finished) {
				[UIView animateWithDuration:1.0f animations:^{
				[_btn2.layer setTransform:transform];
				_startBtn.frame = CGRectMake(200, 160 , kBtnW, kBtnW);


				} completion:^(BOOL finished) {
					
				}];
			}];
		}];
	}];
		
	

	
	
	}
	
	
	
	
	

}


- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}


@end
