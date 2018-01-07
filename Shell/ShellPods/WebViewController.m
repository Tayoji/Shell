//
//  WebViewController.m
//  Shell
//
//  Created by 唐友建 on 2018/1/7.
//  Copyright © 2018年 唐友建. All rights reserved.
//

#import "WebViewController.h"
#import "ShellItem.h"
@interface WebViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:[ShellItem share].url]]];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)clickBut:(UIButton *)sender {
    switch (sender.tag) {
        case 200:
            [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:[ShellItem share].url]]];
            break;
        case 201:
            [self.webView reload];
            break;
        case 202:
            [self.webView goBack];
            break;
        case 203:
            [self.webView goForward];
            break;
        default:
            break;
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
