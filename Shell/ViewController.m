//
//  ViewController.m
//  Shell
//
//  Created by 唐友建 on 2018/1/7.
//  Copyright © 2018年 唐友建. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)click:(UIButton *)button {
    for (NSInteger tag = 100; tag<104 ; tag ++) {
        UIButton * other = [self.view viewWithTag:tag];
        other.selected = button.tag == tag;
    }
    
}

@end
