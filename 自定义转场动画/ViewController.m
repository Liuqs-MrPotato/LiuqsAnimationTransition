//
//  ViewController.m
//  自定义转场动画
//
//  Created by 刘全水 on 16/8/3.
//  Copyright © 2016年 刘全水. All rights reserved.
//

#import "ViewController.h"
#import "pushViewController.h"
#import "LiuqsAnimationTransition.h"

@interface ViewController ()<UINavigationControllerDelegate>

@end

@implementation ViewController

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
    
    bgView.image = [UIImage imageNamed:@"4.JPG"];
    
    [self.view addSubview:bgView];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

    pushViewController *pushVC = [[pushViewController alloc]init];
    
    [self.navigationController pushViewController:pushVC animated:YES];
}

#pragma mark - UINavigationControllerDelegate

- (id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC {
    
    if (operation == UINavigationControllerOperationPush) {//判断是否是push，是就替换自定义的转场
        
        LiuqsAnimationTransition *ping = [[LiuqsAnimationTransition alloc]init];
        
        return ping;
        
    }else {return nil;}
}


@end
