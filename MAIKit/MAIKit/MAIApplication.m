#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-protocol-property-synthesis"
#pragma clang diagnostic ignored "-Wprotocol"
#pragma clang diagnostic ignored "-Wincomplete-implementation"
#pragma clang diagnostic ignored "-Wobjc-designated-initializers"

#import "MAIApplication.h"

@implementation MAIApplication

+(Class) class
{
#if TARGET_OS_IPHONE
    return [UIApplication class];
#else
    return [NSApplication class];
#endif
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone
{
#if TARGET_OS_IPHONE
    return (MAIApplication*) [UIApplication alloc];
#else
    return (MAIApplication*) [NSApplication alloc];
#endif
}
+(MAIApplication*)sharedApplication{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wincompatible-pointer-types"
#pragma clang diagnostic ignored "-Wenum-conversion"
#if TARGET_OS_IPHONE
    return (id) [UIApplication sharedApplication];
#else
    return (id) [NSApplication sharedApplication];
#endif
#pragma clang diagnostic pop
}

#if TARGET_OS_IPHONE
-(UIApplication*) ios
{
    return (UIApplication*) self;
}
#else
-(NSApplication*) mac
{
    return (NSApplication*) self;
}
#endif

@end

#if TARGET_OS_IPHONE
@implementation UIApplication (MAIConversion)
#else
@implementation NSApplication (MAIConversion)
#endif
-(MAIApplication*) mai
{
    return (MAIApplication*) self;
}
@end

#pragma clang diagnostic pop
