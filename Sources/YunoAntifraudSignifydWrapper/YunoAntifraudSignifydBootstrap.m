#import "YunoAntifraudSignifydBootstrap.h"

__attribute__((objc_runtime_name("_TtC21YunoAntifraudSignifyd21YunoAntifraudSignifyd")))
@interface YunoAntifraudSignifyd : NSObject
+ (void)register;
@end

@implementation YunoAntifraudSignifydBootstrap

+ (void)load {
    [YunoAntifraudSignifyd register];
}

@end
