#import <Foundation/Foundation.h>

// https://github.com/xybp888/iOS-SDKs/blob/23d41e927dc9f860cefb731687a4a33ab3a115e5/iPhoneOS18.4.sdk/System/Library/Frameworks/Foundation.framework/Headers/NSURL.h#L70
// https://developer.apple.com/documentation/foundation/nsurl/init(string:encodinginvalidcharacters:)?language=objc

// これでは同等の機能をObjCに実装するだけで、swiftのシンボルを解決できない
// @implementation NSURL (Fixes)
// - (instancetype)initWithString:(NSString *)URLString encodingInvalidCharacters:(BOOL)encodingInvalidCharacters {
//     // simply call the existing initializer without encodingInvalidCharacters
//     return [self initWithString:URLString];
// }
// + (nullable instancetype)URLWithString:(NSString *)URLString encodingInvalidCharacters:(BOOL)encodingInvalidCharacters {
//     return [[self alloc] initWithString:URLString encodingInvalidCharacters:encodingInvalidCharacters];
// }
// @end

// @implementation NSURLComponents (Fixes)
// + (instancetype)componentsWithString:(NSString *)URLString encodingInvalidCharacters:(BOOL)encodingInvalidCharacters {
//     // simply call the existing initializer without encodingInvalidCharacters
//     return [self componentsWithString:URLString];
// }
// - (instancetype)initWithString:(NSString *)URLString encodingInvalidCharacters:(BOOL)encodingInvalidCharacters {
//     return [self initWithString:URLString];
// }
// @end

void* $s10Foundation3URLV6stringACSgSSh_tcfC(id self, SEL _cmd, id URLString);
void* $s10Foundation3URLV6string25encodingInvalidCharactersACSgSSh_SbtcfC(id self, SEL _cmd, id URLString, _Bool encodingInvalidCharacters) {
    return $s10Foundation3URLV6stringACSgSSh_tcfC(self, _cmd, URLString);
}
