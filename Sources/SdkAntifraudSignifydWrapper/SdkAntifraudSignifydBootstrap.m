#import "SdkAntifraudSignifydBootstrap.h"

@interface SdkAntifraudSignifyd : NSObject
+ (void)register;
@end

@implementation SdkAntifraudSignifydBootstrap

+ (void)load {
    [SdkAntifraudSignifyd register];
}

@end
