//
//  UIImage+HSImageCategory.h
//  HSStructDemo
//
//  Created by Bee on 15/6/1.
//  Copyright (c) 2015年 Bee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface UIImage (HSImageCategory)

+ (UIImage *)imageWithName:(NSString *)aName;

+ (UIImage *)imageWithName:(NSString *)aName
                      type:(NSString *)aType;

+ (UIImage *)imageWithName:(NSString *)aName
                      type:(NSString *)aType
              liftCapWidth:(NSInteger)aWidth
              topCapHeight:(NSInteger)aHeight;

//定制的Image
+ (UIImage *)imageYellowMiddle;

//定制的textField 背景 80＊82
+ (UIImage *)imageTextFieldBG;

//定制的Image
+ (UIImage *)imageYellowMax;

//定制的Image 更多的背景
+ (UIImage *)imageWithMoreBG;

//定制的Image
+ (UIImage *)imageWitheMax;

//定制的Image
+ (UIImage *)imageBGSendChatInput;

//定制的Image
+ (UIImage *)imageWithInputMin;

//定制的lock Image
+ (UIImage *)imageLock;

//定制的Nav 上的右边 Image
+ (UIImage *)imageNavItemRightGray;

//定制的Nav 上的右边 Image
+ (UIImage *)imageNavItemRightRed;

//定制的Image 用于更多那些有输入框的背景
+ (UIImage *)imageWitheInput;

//定制的Image
+ (UIImage *)imageWitheBox40_41;

//定制的Image
+ (UIImage *)imageWithRedMAX;

//定制的Image
+ (UIImage *)imageWithBlueLineEdge;

//定制的Image
+ (UIImage *)imageWithWhiteBoxMax;

//定制的Image
+ (UIImage *)imageWitheBox;
@end

@interface UIImage (grayscale)

- (UIImage *)convertToGrayscale;


@end
