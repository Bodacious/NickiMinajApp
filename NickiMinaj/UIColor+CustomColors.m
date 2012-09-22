//
//  UIColor.m
//  NickiInMyPocket
//
//  Created by Gavin Morrice on 16/09/2012.
//  Copyright (c) 2012 Katana Code. All rights reserved.
//

#import "UIColor+CustomColors.h"

static UIColor *_turquoiseColor = nil;
static UIColor *_customPinkColor = nil;
static UIColor *_customBlueColor = nil;
static UIColor *_customYellowColor = nil;

@implementation UIColor(CustomColors)

// #3eff93
+(UIColor *)customTurquoiseColor
{
    if (!_turquoiseColor) {
        _turquoiseColor = [[UIColor alloc] initWithRed: 62.0f/255
                                                 green: 255.0f/255
                                                  blue: 147.0f/255
                                                 alpha: 1.0f];
    }
    return _turquoiseColor;
}

// #f5a1cb
+(UIColor *)customPinkColor
{
    if (!_customPinkColor) {
        _customPinkColor = [[UIColor alloc] initWithRed: 245.0f/255
                                                 green: 161.0f/255
                                                  blue: 203.0f/255
                                                 alpha: 1.0f];
    }
    return _customPinkColor;
}

// #60e1fc
+(UIColor *)customBlueColor
{
    if (!_customBlueColor) {
        _customBlueColor = [[UIColor alloc] initWithRed: 96.0f/255
                                                  green: 225.0f/255
                                                   blue: 252.0f/255
                                                  alpha: 1.0f];
    }
    return _customBlueColor;
}


// #fadf4c
+(UIColor *)customYellowColor
{
    if (!_customYellowColor) {
        _customYellowColor = [[UIColor alloc] initWithRed: 250.0f/255
                                                  green: 223.0f/255
                                                   blue: 76.0f/255
                                                  alpha: 1.0f];
    }
    return _customYellowColor;
}

@end
