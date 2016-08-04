//
//  pushViewController.m
//  自定义转场动画
//
//  Created by 刘全水 on 16/8/3.
//  Copyright © 2016年 刘全水. All rights reserved.
//

#import "pushViewController.h"
#import "LiuqsAnimationPopTransition.h"

@interface pushViewController ()<UINavigationControllerDelegate>

@end

@implementation pushViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    self.navigationController.delegate = self;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self createBgView];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    
    return UIStatusBarStyleLightContent;
}

- (void)createBgView {
    
    UIImageView *bgView = [[UIImageView alloc]initWithFrame:self.view.bounds];
    
    self.navigationController.navigationBar.hidden = YES;
    
    bgView.image = [UIImage imageNamed:@"8.JPG"];
    
    [self.view addSubview:bgView];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC{
    if (operation == UINavigationControllerOperationPop) {
        
        LiuqsAnimationPopTransition *pingInvert = [[LiuqsAnimationPopTransition alloc]init];
        
        return pingInvert;
        
    }else{return nil;}
}



@end
