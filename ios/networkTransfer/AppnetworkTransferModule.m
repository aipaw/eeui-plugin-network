//
//  AppnetworkTransferModule.m
//  Pods
//

#import "AppnetworkTransferModule.h"
#import "NatTransfer.h"
#import <WeexPluginLoader/WeexPluginLoader.h>

@interface AppnetworkTransferModule ()

@end

@implementation AppnetworkTransferModule

WX_PlUGIN_EXPORT_MODULE(networkTransfer, AppnetworkTransferModule)
WX_EXPORT_METHOD(@selector(download::))
WX_EXPORT_METHOD(@selector(upload::))

- (void)download:(id)params :(WXModuleKeepAliveCallback)callback{
    if ([params isKindOfClass:[NSString class]]) {
        params = @{@"url": params};
    }
    [[[NatTransfer alloc] init] download:params :^(id error,id result) {
        if (callback) {
            if (error) {
                callback(@{@"status": @-1, @"error": error[@"error"]}, false);
            } else {
               callback(result, [WXConvert BOOL:result[@"progress"]]);
            }
        }
    }];
}

- (void)upload:(id)params :(WXModuleKeepAliveCallback)callback{
    if ([params isKindOfClass:[NSString class]]) {
        params = @{@"url": params};
    }
    [[[NatTransfer alloc] init] upload:params :^(id error,id result) {
        if (callback) {
            if (error) {
                callback(@{@"status": @-1, @"error": error[@"error"]}, false);
            } else {
                callback(result, [WXConvert BOOL:result[@"progress"]]);
            }
        }
    }];
}

@end
