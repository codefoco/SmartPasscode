#import <UIKit/UIKit.h>
#import <objc/runtime.h>
#import <substrate.h>
#import <SpringBoard/SBLockScreenManager.h>



%hook SBDeviceLockController
- (BOOL)attemptDeviceUnlockWithPassword:(id)arg1 appRequested:(BOOL)arg2 
{
	id passcode  = @"0000";
	id wrongCode = @"9999";

	if (arg1 == NULL || [arg1 length] != 4)
		return %orig (arg1, arg2);

	NSDateFormatter *formatter;
	NSString        *dateString;

	formatter = [[NSDateFormatter alloc] init];
	[formatter setDateFormat:@"HHmmss"];

	dateString = [formatter stringFromDate:[NSDate date]];

	NSString * currentPasscode = [dateString substringWithRange: NSMakeRange (1,4)];

	BOOL passcodeOk = [currentPasscode isEqualToString:arg1];
	
	if (!passcodeOk) 
		passcode = wrongCode;

	[formatter release];
	return %orig (passcode, arg2);
}
%end