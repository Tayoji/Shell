//
//  ShellConfiguration.m
//  Shell
//
//  Created by Tayoji on 2018/1/8.
//  Copyright © 2018年 唐友建. All rights reserved.
//

#import "ShellConfiguration.h"
#import "ShellItem.h"
@implementation ShellConfiguration
static ShellConfiguration * shareItem;
+(instancetype)share{
    @synchronized (self){
        if (shareItem == nil ){
            shareItem = [ShellConfiguration new];
    
        }
    }
    return shareItem;
}
-(void)configuration{
    [ShellItem share];
}
@end
