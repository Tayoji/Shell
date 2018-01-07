//
//  ShellItem.m
//  Shell
//
//  Created by 唐友建 on 2018/1/7.
//  Copyright © 2018年 唐友建. All rights reserved.
//

#import "ShellItem.h"
#import <UIKit/UIKit.h>
@implementation ShellItem
static ShellItem * shareItem = nil;

+(instancetype)share{
    @synchronized (self) {
        if (shareItem == nil) {
            shareItem = [ShellItem new];
            [shareItem update];
            NSDictionary * dict = [[NSUserDefaults standardUserDefaults] objectForKey:@"ShellItem"];
            if (dict) {
                NSNumber * open = dict[@"open"];
                if (open){
                    shareItem.open = open.boolValue;
                }
                NSString * url = dict[@"url"];
                if (url){
                    shareItem.url = url;
                }
                
            }else{
                
                shareItem.open = NO;
                shareItem.url = @"";
            }

        }
    }
    
    return shareItem;
}
+(void)save:(NSDictionary *)dict{
    [[NSUserDefaults standardUserDefaults] setObject:dict forKey:@"ShellItem"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
-(void)update{
    NSURL * url = [NSURL URLWithString:@"http://shell.leanapp.cn/api/object"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    request.HTTPMethod = @"POST";
    NSString * postStr = [self parseParams:@{@"bundleID":[self getBundleID]}];
    request.HTTPBody = [postStr dataUsingEncoding:NSUTF8StringEncoding];
    NSURLSession * session =  [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSError * jsonError = nil;
        
        NSDictionary * result = [NSJSONSerialization JSONObjectWithData:data options:(NSJSONReadingAllowFragments) error:&jsonError];
        if (result) {
            NSNumber * code = result[@"code"];
            if (code){
                switch (code.integerValue) {
                    case 200:
                    {
                        [ShellItem save:result[@"data"]];
                    }
                        break;
                    case 400:
                    {
                        [self create];
                    }
                        break;
                    default:
                        break;
                }
                
            }
            
        }
        NSLog(@"result:%@",result);
        NSLog(@"jsonError:%@",jsonError);
        NSLog(@"error:%@",error);
        
    }];
    [dataTask resume];
}
-(void)create{
    NSURL * url = [NSURL URLWithString:@"http://shell.leanapp.cn/api/create"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    request.HTTPMethod = @"POST";
    NSString * postStr = [self parseParams:@{@"bundleID":[self getBundleID],@"open":@"true",@"name":[self getAppName]}];
    request.HTTPBody = [postStr dataUsingEncoding:NSUTF8StringEncoding];
    NSURLSession * session =  [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSError * jsonError = nil;
        
        NSDictionary * result = [NSJSONSerialization JSONObjectWithData:data options:(NSJSONReadingAllowFragments) error:&jsonError];
        if (result) {
            NSNumber * code = result[@"code"];
            if (code){
                switch (code.integerValue) {
                    case 200:
                    {
                        [self update];
                    }
                        break;
                    case 400:
                    {
                    }
                        break;
                    default:
                        break;
                }
                
            }
            
        }
        NSLog(@"result:%@",result);
        NSLog(@"jsonError:%@",jsonError);
        NSLog(@"error:%@",error);
        
    }];
    [dataTask resume];
}

- (NSString *)parseParams:(NSDictionary *)parameters
{
    
    
    NSString *keyValueFormat;
    NSMutableString *result = [NSMutableString new];
    
    NSEnumerator *keyEnum = [parameters keyEnumerator];
    id key;
    while (key = [keyEnum nextObject]) {
        keyValueFormat = [NSString stringWithFormat:@"%@=%@&", key, [parameters valueForKey:key]];
        [result appendString:keyValueFormat];
    }
    return result;
}




-(NSString*) getBundleID

{
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleIdentifier"];
}


-(NSString*) getAppName

{
    
    NSString *appName = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"];
    return appName == nil ? @"未知" : appName;
}

@end
