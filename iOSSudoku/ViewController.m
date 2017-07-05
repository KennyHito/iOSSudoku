//
//  ViewController.m
//  iOSSudoku
//
//  Created by Apple on 2017/7/5.
//  Copyright © 2017年 KennyHito. All rights reserved.
//

#import "ViewController.h"
#import "CLLockVC.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

//设置密码
- (IBAction)setUpBtn:(UIButton *)sender {
    BOOL hasPwd = [CLLockVC hasPwd];
    hasPwd = NO;
    if(hasPwd){
        NSLog(@"已经设置过密码了，你可以验证或者修改密码");
    }else{
        [CLLockVC showSettingLockVCInVC:self successBlock:^(CLLockVC *lockVC, NSString *pwd) {
            NSLog(@"密码设置成功");
            [lockVC dismiss:1.0f];
        }];
    }
}

//验证密码
- (IBAction)checkBtn:(UIButton *)sender {
    BOOL hasPwd = [CLLockVC hasPwd];
    
    if(!hasPwd){
        
        NSLog(@"你还没有设置密码，请先设置密码");
    }else {
        
        [CLLockVC showVerifyLockVCInVC:self forgetPwdBlock:^{
            NSLog(@"忘记密码");
        } successBlock:^(CLLockVC *lockVC, NSString *pwd) {
            NSLog(@"密码正确");
            [lockVC dismiss:1.0f];
        }];
    }
}

//修改密码
- (IBAction)replaceBtn:(UIButton *)sender {
    BOOL hasPwd = [CLLockVC hasPwd];
    
    if(!hasPwd){
        
        NSLog(@"你还没有设置密码，请先设置密码");
        
    }else {
        
        [CLLockVC showModifyLockVCInVC:self successBlock:^(CLLockVC *lockVC, NSString *pwd) {
            
            [lockVC dismiss:.5f];
        }];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
