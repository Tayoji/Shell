//
//  VButton.m
//  Shell
//
//  Created by 唐友建 on 2018/1/7.
//  Copyright © 2018年 唐友建. All rights reserved.
//

#import "VButton.h"

@implementation VButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(void)awakeFromNib{
    [super awakeFromNib];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
}
-(CGRect)titleRectForContentRect:(CGRect)contentRect{
    
    return CGRectMake(0, self.frame.size.height/2, self.frame.size.width, 20);
}
-(CGRect)imageRectForContentRect:(CGRect)contentRect{
    return CGRectMake(( self.frame.size.width - 22)/2, self.frame.size.height/2 - 22, 22, 22);
}
@end
