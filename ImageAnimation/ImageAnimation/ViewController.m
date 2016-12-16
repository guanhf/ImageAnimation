//
//  ViewController.m
//  ImageAnimation
//
//  Created by Admin on 2016/12/16.
//  Copyright © 2016年 Admin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<CAAnimationDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *testImageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    CAKeyframeAnimation *theAnimation = [CAKeyframeAnimation animation];
    
//    CATransform3DMakeRotation(CGFloat angle, CGFloat x, CGFloat y, CGFloat z); 第一个参数是旋转角度，后面三个参数形成一个围绕其旋转的向量，起点位置由UIView的center属性标识。
    theAnimation.values = [NSArray arrayWithObjects:
                           [NSValue valueWithCATransform3D:CATransform3DMakeRotation(0, 0, 0.5, 0)],
                           [NSValue valueWithCATransform3D:CATransform3DMakeRotation(3.13, 0, 0.5, 0)],
                           [NSValue valueWithCATransform3D:CATransform3DMakeRotation(6.26, 0, 0.5, 0)],
                           nil];
    

    theAnimation.cumulative = YES;
    //    每个帧的时间=总duration/(values.count - 1)
    // 间隔时间 频率
    theAnimation.duration = 5;
    // 重复次数
    theAnimation.repeatCount = 100;
    
 
    // 取消反弹// 告诉在动画结束的时候不要移除
    theAnimation.removedOnCompletion = NO;
    // 始终保持最新的效果
    theAnimation.fillMode = kCAFillModeForwards;
   
    theAnimation.delegate = self;
    
    _testImageView.layer.zPosition = 50;
    [_testImageView.layer addAnimation:theAnimation forKey:@"transform"];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
