# SKCardAnimationDemo
一个简单的下拉的动画
```  
		_btn1.layer.anchorPoint = CGPointMake(0,1);
	_btn1.frame = CGRectMake(200, 300, 60, 60);
	
	CATransform3D transform = CATransform3DIdentity;
	transform.m34 = 0.005;
	transform = CATransform3DRotate(transform,  M_PI / 180  * 180, 1, 0, 0);
		[UIView animateWithDuration:2.0f animations:^{
			[_btn1.layer setTransform:transform];

		}];

```  

  
   
   
![image](https://github.com/AlexanderYeah/SKCardAnimationDemo/blob/master/SKCardAnimation/card.gif)
