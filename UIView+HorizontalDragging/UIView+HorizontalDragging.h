//
//  UIView+HorizontalDragging.h
//  testapplic
//
//  Created by Александр Зарочинцев on 15/05/15.
//  Copyright (c) 2015 Awery Software Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  @category UIView+HorizontalDragging
 *  @author Alex Zarochintsev
 */
@interface UIView (HorizontalDragging)

/** 
 *  The pan gestures that handles the view dragging
 *
 *  @param panGestureRecognizer The tint color of the blurred view. Set to nil to reset.
 */
@property (nonatomic) UIPanGestureRecognizer *panGestureRecognizer;

///--------------------------------
/// @name Enable & Disable Dragging
///--------------------------------

/**
 *  Enable horizontal dragging
 */
- (void)enableHorizontalDragging;

/**
 *  Disable horizontal dragging
 */
- (void)disableHorizontalDragging;

///--------------------------
/// @name Settings / Optional
///--------------------------

/**
 *  This is left offset to view
 */
@property (assign, nonatomic) NSInteger leftOffset;

/**
 *  This is right offset to view
 */
@property (assign, nonatomic) NSInteger rightOffset;

@end
