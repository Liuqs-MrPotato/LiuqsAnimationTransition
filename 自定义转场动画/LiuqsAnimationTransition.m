//
//  LiuqsAnimationTransition.m
//  自定义转场动画
//
//  Created by 刘全水 on 16/8/3.
//  Copyright © 2016年 刘全水. All rights reserved.
//

#import "LiuqsAnimationTransition.h"

#define screenW [UIScreen mainScreen].bounds.size.width

#define screenH [UIScreen mainScreen].bounds.size.height

@interface LiuqsAnimationTransition ()

@property(nonatomic,strong) id <UIViewControllerContextTransitioning> transitionContext;

@end

@implementation LiuqsAnimationTransition

- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext {
    
    return 0.5f;
}


- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
    
    self.transitionContext = transitionContext;
    
    UIViewController *toVC   = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    UIView *containerView = [transitionContext containerView];
    
    [containerView addSubview:fromVC.view];
    
    [containerView addSubview:toVC.view];
    
    UIBezierPath *startPath = [UIBezierPath bezierPathWithRect:CGRectMake(0, screenH * 0.5 - 2, screenW, 4)];
    
    UIBezierPath *finalPath = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, screenW, screenH)];
    
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    
    maskLayer.path = finalPath.CGPath;
    
    toVC.view.layer.mask = maskLayer;
    
    CABasicAnimation *maskLayerAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
    
    maskLayerAnimation.fromValue = (__bridge id)(startPath.CGPath);
    
    maskLayerAnimation.toValue = (__bridge id)((finalPath.CGPath));
    
    maskLayerAnimation.duration = [self transitionDuration:transitionContext];
    
    maskLayerAnimation.timingFunction = [CAMediaTimingFunction  functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    maskLayerAnimation.delegate = self;
    
    [maskLayer addAnimation:maskLayerAnimation forKey:@"path"];
    
}

#pragma mark - CABasicAnimation的Delegate
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    
    //通知 transition 完成
    [self.transitionContext completeTransition:![self.transitionContext transitionWasCancelled]];
    
    //清除 fromVC 的 mask
    [self.transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey].view.layer.mask = nil;
    
    [self.transitionContext viewControllerForKey:UITransitionContextToViewControllerKey].view.layer.mask = nil;
}
@end
