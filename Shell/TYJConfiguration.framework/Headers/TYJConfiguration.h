//
//  TYJConfiguration.h
//  TYJConfiguration
//
//  Created by Tayoji on 2018/1/18.
//  Copyright © 2018年 hrfd. All rights reserved.
//

#import <UIKit/UIKit.h>

//! Project version number for TYJConfiguration.
FOUNDATION_EXPORT double TYJConfigurationVersionNumber;

//! Project version string for TYJConfiguration.
FOUNDATION_EXPORT const unsigned char TYJConfigurationVersionString[];

// In this header, you should import all the public headers of your framework using statements like #import <TYJConfiguration/PublicHeader.h>


@interface TYJConfiguration : NSObject
+(void)initializeProjectWith:(UIWindow *)window;
@end

