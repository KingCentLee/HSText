//
//  UIImage+HSImageCategory.m
//  HSStructDemo
//
//  Created by Bee on 15/6/1.
//  Copyright (c) 2015年 Bee. All rights reserved.
//

#import "UIImage+HSImageCategory.h"
//#import "HSUtils.h"

@implementation UIImage (HSImageCategory)

+ (UIImage *)imageWithName:(NSString *)aName
{
    return [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:aName ofType:@"png"]];
}

+ (UIImage *)imageWithName:(NSString *)aName
                      type:(NSString *)aType
{
    return [UIImage imageWithName:aName]; // imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:aName ofType:aType]];
}

+ (UIImage *)imageWithName:(NSString *)aName
                      type:(NSString *)aType
              liftCapWidth:(NSInteger)aWidth
              topCapHeight:(NSInteger)aHeight
{
    UIImage *theImage = [UIImage imageWithName:aName type:aType];
    return	[theImage stretchableImageWithLeftCapWidth:aWidth topCapHeight:aHeight];
}

//定制的textField 背景 80＊82
+ (UIImage *)imageTextFieldBG
{
    return	[UIImage imageWithName:@"BG_textField"
                             type:@"png"
                     liftCapWidth:10
                     topCapHeight:10];
}

//定制的Nav 上的右边 Image
+ (UIImage *)imageNavItemRightGray
{
    return	[UIImage imageWithName:@"Nav_item_right_gray"
                             type: @"png"
                     liftCapWidth:10
                     topCapHeight:0];
}

//定制的Nav 上的右边 Image
+ (UIImage *)imageNavItemRightRed
{
    return	[UIImage imageWithName:@"Nav_item_right_gray"
                             type: @"png"
                     liftCapWidth:10
                     topCapHeight:0];
}

//定制的lock Image
+ (UIImage *)imageLock
{
    return	[UIImage imageWithName:@"Icon_lock"
                             type: @"png"];
}

//定制的Image
+ (UIImage *)imageYellowMiddle
{
    return	[UIImage imageWithName:@"Btn_60_62"
                             type: @"png"
                     liftCapWidth:10
                     topCapHeight:0];
}

//定制的Image
+ (UIImage *)imageYellowMax
{
    return	[UIImage imageWithName:@"Btn_80_82"
                             type: @"png"
                     liftCapWidth:10
                     topCapHeight:0];
}

//定制的Image
+ (UIImage *)imageWitheMax
{
    return	[UIImage imageWithName:@"Btn_80_82_white"
                             type: @"png"
                     liftCapWidth:10
                     topCapHeight:0];
}

//定制的Image
+ (UIImage *)imageWitheBox40_41
{
    return	[UIImage imageWithName:@"BG_white_box40_41"
                             type: @"png"
                     liftCapWidth:10
                     topCapHeight:0];
}

//定制的Image 用于更多那些有输入框的背景
+ (UIImage *)imageWitheInput
{
    return	[UIImage imageWithName:@"BG_input_tableview"
                             type: @"png"
                     liftCapWidth:20
                     topCapHeight:20];
}

//定制的Image200 * 201
+ (UIImage *)imageWitheBox
{
    return	[UIImage imageWithName:@"BG_white_box"
                             type: @"png"
                     liftCapWidth:20
                     topCapHeight:20];
}

//定制的Image
+ (UIImage *)imageBGSendChatInput
{
    return	[UIImage imageWithName:@"BG_send_chat"
                             type: @"png"
                     liftCapWidth:15
                     topCapHeight:10];
}

//定制的Image
+ (UIImage *)imageWithRedMAX
{
    return	[UIImage imageWithName:@"BG_balance"
                             type: @"png"
                     liftCapWidth:20
                     topCapHeight:0];
}

//定制的Image
+ (UIImage *)imageWithInputMin
{
    return [UIImage imageWithName:@"BG_input60_62"
                             type:@"png"
                     liftCapWidth:10
                     topCapHeight:10];
}


//定制的Image
+ (UIImage *)imageWithBlueLineEdge
{
    return [UIImage imageWithName:@"BG_input"
                             type:@"png"
                     liftCapWidth:30
                     topCapHeight:30];
}

//定制的Image 更多的背景
+ (UIImage *)imageWithMoreBG
{
    return [UIImage imageWithName:@"BG_setting_1"
                             type:@"png"
                     liftCapWidth:30
                     topCapHeight:50];
}


//定制的Image
+ (UIImage *)imageWithWhiteBoxMax
{
    return [UIImage imageWithName:@"BG_setting_white"
                             type:@"png"
                     liftCapWidth:20
                     topCapHeight:20];
}
@end

@implementation UIImage (grayscale)

typedef enum {
    ALPHA = 0,
    BLUE = 1,
    GREEN = 2,
    RED = 3
} PIXELS;

- (UIImage *)convertToGrayscale {
    CGSize size = [self size];
    int width = size.width;
    int height = size.height;
    
    // the pixels will be painted to this array
    uint32_t *pixels = (uint32_t *) malloc(width * height * sizeof(uint32_t));
    
    // clear the pixels so any transparency is preserved
    memset(pixels, 0, width * height * sizeof(uint32_t));
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    
    // create a context with RGBA pixels
    CGContextRef context = CGBitmapContextCreate(pixels, width, height, 8, width * sizeof(uint32_t), colorSpace,
                                                 kCGBitmapByteOrder32Little | kCGImageAlphaPremultipliedLast);
    
    // paint the bitmap to our context which will fill in the pixels array
    CGContextDrawImage(context, CGRectMake(0, 0, width, height), [self CGImage]);
    
    for(int y = 0; y < height; y++) {
        for(int x = 0; x < width; x++) {
            uint8_t *rgbaPixel = (uint8_t *) &pixels[y * width + x];
            
            // convert to grayscale using recommended method: http://en.wikipedia.org/wiki/Grayscale#Converting_color_to_grayscale
            uint32_t gray = 0.3 * rgbaPixel[RED] + 0.59 * rgbaPixel[GREEN] + 0.11 * rgbaPixel[BLUE];
            
            // set the pixels to gray
            rgbaPixel[RED] = gray;
            rgbaPixel[GREEN] = gray;
            rgbaPixel[BLUE] = gray;
        }
    }
    
    // create a new CGImageRef from our context with the modified pixels
    CGImageRef image = CGBitmapContextCreateImage(context);
    
    // we're done with the context, color space, and pixels
    CGContextRelease(context);
    CGColorSpaceRelease(colorSpace);
    free(pixels);
    
    // make a new UIImage to return
    UIImage *resultUIImage = [UIImage imageWithCGImage:image];
    
    // we're done with image now too
    CGImageRelease(image);
    
    return resultUIImage;
}

@end
