//
//  StringTool.m
//  zhimayun
//
//  Created by zhimayun on 15/12/22.
//  Copyright © 2015年 zhimayun. All rights reserved.
//

#import "StringTool.h"

@implementation StringTool

+ (CGSize)boundingRectWithSize:(CGSize)size UILabel:(UILabel *) label
{
    NSDictionary *attribute = @{NSFontAttributeName: label.font};
    
    CGSize retSize = [label.text boundingRectWithSize:size
                                              options:\
                      NSStringDrawingTruncatesLastVisibleLine |
                      NSStringDrawingUsesLineFragmentOrigin |
                      NSStringDrawingUsesFontLeading
                                           attributes:attribute
                                              context:nil].size;
    
    return retSize;
}


+ (CGSize)boundingRectWithSizeForIos6:(CGSize)size UILabel:(UILabel *) label
{
    
    CGSize retSize = [label.text sizeWithFont:label.font
                            constrainedToSize:size
                                lineBreakMode:NSLineBreakByCharWrapping];
    
    return retSize;
}

@end
