#import <AVFAudio/AVFAudio.h>

/*
AVAudioApplicationInputMuteStateChangeNotification
A notification the system posts when the app’s audio input mute state changes.
iOS 17.0+
iPadOS 17.0+
Mac Catalyst 17.0+
macOS 14.0+
tvOS 17.0+
visionOS 26.0+
watchOS 10.0+
extern NSNotificationName const AVAudioApplicationInputMuteStateChangeNotification;

*/
/*!
	@brief	Notification sent to registered listeners when the application's input is muted
			or unmuted.

	Check the notification's userInfo dictionary for the mute state AVAudioApplicationInputMuteStateKey
	which will have a boolean value 0 for unmuted or value 1 for muted.
	@note this notification will only be dispatched for state changes when there is an active record session (i.e. record or playAndRecord category).
		Setting the `inputMuted` state while the record session is not active is allowed and will be stored, but it will not trigger a notification for the
		state change. When the record session subsequently goes active, the `inputMuted` state will be applied, and this notification will be dispatched
		with the latest input muted state.
*/
// OS_EXPORT NSNotificationName const AVAudioApplicationInputMuteStateChangeNotification API_AVAILABLE(ios(17.0), watchos(10.0), tvos(17.0), macos(14.0)) NS_SWIFT_NAME(AVAudioApplication.inputMuteStateChangeNotification);

/// Keys for AVAudioApplicationInputMuteStateChangeNotification
/// Value is NSNumber type with boolean value 0 for unmuted or value 1 for muted (samples zeroed out)
// OS_EXPORT NSString *const AVAudioApplicationMuteStateKey API_AVAILABLE(ios(17.0), watchos(10.0), tvos(17.0), macos(14.0)) NS_SWIFT_NAME(AVAudioApplication.muteStateKey);

// adds alternative definition to avoid symbol not found crash on older iOS versions

// TODO: これじゃまずい可能性が高い
NSNotificationName const AVAudioApplicationInputMuteStateChangeNotification = @"AVAudioApplicationInputMuteStateChangeNotification";
NSString *const AVAudioApplicationMuteStateKey = @"AVAudioApplicationMuteStateKey";


// OBJC_CLASS_$_AVAudioApplication
// @implementation AVAudioApplication : NSObject
// @end
int OBJC_CLASS_$_AVAudioApplication(void) {
	return 0;
}

