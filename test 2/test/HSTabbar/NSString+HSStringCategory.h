//
//  NSString+HSStringCategory.h
//  HSStructDemo
//
//  Created by Bee on 15/6/1.
//  Copyright (c) 2015年 Bee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (HSStringCategory)

- (NSString *)getImageName;
- (NSString *)getImageType;
-(NSString *) stringByStrippingHTML;
- (NSString *)clearWhiteSpaceAndNewLine;

@end
