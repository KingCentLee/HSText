//
//  UIView+Sizes.h
//  HSUtils
//
//  Created by Bee on 15/5/28.
//  Copyright (c) 2015年 Bee. All rights reserved.
//

#import <UIKit/UIKit.h>

/** Helps clean up code for changing UIView frames.
 
 Instead of creating a CGRect struct, changing properties and reassigning. For example, moving a UIView newX points to the left:
 
 CGRect frame = view.frame;
 frame.origin x = (CGFloat)newX + view.frame.size.width;
 view.frame = frame;
 
 This can be cleaned up to:
 
 view.left += newX;
 
 Properties bottom and right also take into account the width of the UIView.
 */

@interface UIView (Sizes)

///---------------------------------------------------------------------------------------
/// @name Edges
///---------------------------------------------------------------------------------------

/** Get the left point of a view. */
@property (nonatomic) CGFloat left;

/** Get the top point of a view. */
@property (nonatomic) CGFloat top;

/** Get the right point of a view. */
@property (nonatomic) CGFloat right;

/** Get the bottom point of a view. */
@property (nonatomic) CGFloat bottom;

///---------------------------------------------------------------------------------------
/// @name Dimensions
///---------------------------------------------------------------------------------------

/** Get the width of a view. */
@property (nonatomic) CGFloat width;

/** Get the height of a view. */
@property (nonatomic) CGFloat height;

///---------------------------------------------------------------------------------------
/// @name Quick Access
///---------------------------------------------------------------------------------------

/** Get the origin of a view. */
@property (nonatomic) CGPoint origin;

/** Get the size of a view. */
@property (nonatomic) CGSize size;

@end
