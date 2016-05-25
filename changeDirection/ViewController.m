//
//  ViewController.m
//  changeDirection
//
//  Created by Xia_Q on 16/5/25.
//  Copyright © 2016年 X. All rights reserved.
//

#import "ViewController.h"
@interface ViewController ()
{
    UIButton *btn;
    BOOL a;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    a=1;
    CGRect rect=[UIScreen mainScreen].bounds;
    btn=[UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame =CGRectMake(0, 0, rect.size.width, 160);
    [btn addTarget:self action:@selector(btnTouch) forControlEvents:UIControlEventTouchUpInside];
    [btn setTitle:@"转屏" forState:UIControlStateNormal];
    btn.backgroundColor=[UIColor redColor];
    [self.view addSubview:btn];

}

-(void)btnTouch{
    
    if (a) {
        a=!a;
        CGFloat height = [[UIScreen mainScreen] bounds].size.width; //屏幕的宽作为高
        CGFloat width = [[UIScreen mainScreen] bounds].size.height; //屏幕的高作为宽
        CGRect frame = CGRectMake((height - width) / 2, (width - height) / 2, width, height);
        [UIView animateWithDuration:0.3f animations:^{
            btn.frame = frame;
            [self.view setTransform:CGAffineTransformMakeRotation(M_PI_2)];
            [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationFade];
        } completion:^(BOOL finished) {
        }];
    }else{
        a=!a;
        [UIView animateWithDuration:0.3f animations:^{
            
            [self.view setTransform:CGAffineTransformIdentity];
            CGRect rect=[UIScreen mainScreen].bounds;
            btn.frame =CGRectMake(0, 0, rect.size.width, 160);
            [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationFade];
        } completion:^(BOOL finished) {
            
        }];

    }
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
