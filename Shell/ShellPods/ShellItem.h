//
//  ShellItem.h
//  Shell
//
//  Created by 唐友建 on 2018/1/7.
//  Copyright © 2018年 唐友建. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ShellItem : NSObject
@property (nonatomic,copy)NSString * url;
@property (nonatomic,assign)BOOL open;
+(instancetype)share;
@end
