#import <TargetConditionals.h>

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-property-no-attribute"

#if TARGET_OS_IPHONE
@import UIKit;
#else
@import AppKit;
#endif

#import "MAIEnums.h"
#import "MAIDeclarations.h"

NS_ASSUME_NONNULL_BEGIN

@protocol MAIRotationGestureRecognizerProtocol
-(CGPoint)locationInView:(nullable id<MAIViewProtocol>)view;
@property(setter=setRotation:, getter=rotation) CGFloat rotation;
@property(nullable, setter=setDelegate:, getter=delegate) id <MAIGestureRecognizerDelegate> delegate;
@property(setter=setEnabled:, getter=isEnabled) BOOL enabled;
@property(readonly, nullable, getter=view) id<MAIViewProtocol> view;

#if TARGET_OS_IPHONE
#else
-(nullable instancetype)initWithCoder:(NSCoder*)coder NS_UNAVAILABLE;
#endif

@end

#if TARGET_OS_IPHONE
@interface MAIRotationGestureRecognizer : UIRotationGestureRecognizer<MAIRotationGestureRecognizerProtocol>
#else
@interface MAIRotationGestureRecognizer : NSRotationGestureRecognizer<MAIRotationGestureRecognizerProtocol>
#endif
@end

NS_ASSUME_NONNULL_END

#pragma clang diagnostic pop
