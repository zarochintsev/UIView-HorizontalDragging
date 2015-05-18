//
//  UIView+HorizontalDragging.m
//  testapplic
//
//  Created by Александр Зарочинцев on 15/05/15.
//  Copyright (c) 2015 Awery Software Solutions. All rights reserved.
//

#import "UIView+HorizontalDragging.h"
#import <objc/runtime.h>

@implementation UIView (HorizontalDragging)

#pragma mark - objc / runtime

// Setter
- (void)setPanGestureRecognizer:(UIPanGestureRecognizer *)panGestureRecognizer {
    objc_setAssociatedObject(self, @selector(panGestureRecognizer), panGestureRecognizer, OBJC_ASSOCIATION_RETAIN);
}

// Getter
- (UIPanGestureRecognizer *)panGestureRecognizer {
    return objc_getAssociatedObject(self, @selector(panGestureRecognizer));
}

// Setter
- (void)setLeftOffset:(NSInteger)leftOffset {
    NSNumber *number = [NSNumber numberWithInteger:leftOffset];
    objc_setAssociatedObject(self, @selector(leftOffset), number, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

// Getter
- (NSInteger)leftOffset {
    NSNumber *number = objc_getAssociatedObject(self, @selector(leftOffset));
    return [number integerValue];
}

// Setter
- (void)setRightOffset:(NSInteger)rightOffset {
    NSNumber *number = [NSNumber numberWithInteger:rightOffset];
    objc_setAssociatedObject(self, @selector(rightOffset), number, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

// Getter
- (NSInteger)rightOffset {
    NSNumber *number = objc_getAssociatedObject(self, @selector(rightOffset));
    return [number integerValue];
}

#pragma mark - Public

- (void)enableHorizontalDragging {
    [self _verificationOffset];
    
    // Initialzie 'panGestureRecognizer'
    self.panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(_panGestureRecognizer:)];
    [[self panGestureRecognizer] setMaximumNumberOfTouches:1];
    [[self panGestureRecognizer] setMinimumNumberOfTouches:1];
    [[self panGestureRecognizer] setCancelsTouchesInView:false];
    
    // Add gesture recognizer to current view
    [self addGestureRecognizer:[self panGestureRecognizer]];
}

- (void)disableHorizontalDragging {
    [self removeGestureRecognizer:[self panGestureRecognizer]];
    self.panGestureRecognizer = nil;
}

#pragma mark - Private Functions

- (void)_verificationOffset {
    if ([self rightOffset] == 0) {
        self.rightOffset = [[UIScreen mainScreen] bounds].size.width;
    }
}

- (void)_panGestureRecognizer:(UIPanGestureRecognizer *)recognizer {
    [self _controlPositionOfRecognizer:recognizer];
    
    if ([recognizer state] == UIGestureRecognizerStateChanged) {
        CGPoint translation = [recognizer translationInView:self];
        [[recognizer view] setCenter:CGPointMake([[recognizer view] center].x + translation.x, [[recognizer view] center].y)];
        [recognizer setTranslation:CGPointZero inView:self];
    }
}

- (void)_controlPositionOfRecognizer:(UIPanGestureRecognizer *)recognizer {
    if (recognizer.view.frame.origin.x + recognizer.view.frame.size.width > [self rightOffset]) {
        recognizer.view.center = CGPointMake([self rightOffset] - recognizer.view.frame.size.width / 2, recognizer.view.center.y);
    } else if (recognizer.view.frame.origin.x < [self leftOffset]) {
        recognizer.view.center = CGPointMake([self leftOffset] + recognizer.view.frame.size.width / 2, recognizer.view.center.y);
    }
}

@end
