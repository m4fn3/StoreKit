#import <AVFAudio/AVFAudio.h>

@implementation AVAudioApplication
+ (void)requestRecordPermissionWithCompletionHandler:(void (^)(BOOL granted))handler {
    [AVAudioSession.sharedInstance requestRecordPermission:handler];
}

+ (void)requestMicrophoneInjectionPermissionWithCompletionHandler:(void (^)(AVAudioApplicationMicrophoneInjectionPermission permission))response{
    response(AVAudioApplicationMicrophoneInjectionPermissionServiceDisabled);
}

+ (instancetype)sharedInstance {
    static AVAudioApplication *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (BOOL) setInputMuted:(BOOL)muted error:(NSError **)outError {
    if(outError) {
        *outError = [NSError errorWithDomain:@"AVAudioApplicationErrorDomain" code:1 userInfo:@{NSLocalizedDescriptionKey:@"Not implemented"}];
    }
    return NO;
}
@end
