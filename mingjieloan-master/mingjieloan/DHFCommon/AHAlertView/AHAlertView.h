//
//  AHAlertView.h
//  AHAlertViewSample
//
//	Copyright (C) 2012 Auerhaus Development, LLC
//
//	Permission is hereby granted, free of charge, to any person obtaining a copy of
//	this software and associated documentation files (the "Software"), to deal in
//	the Software without restriction, including without limitation the rights to
//	use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
//	the Software, and to permit persons to whom the Software is furnished to do so,
//	subject to the following conditions:
//
//	The above copyright notice and this permission notice shall be included in all
//	copies or substantial portions of the Software.
//
//	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//	IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
//	FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
//	COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
//	IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
//	CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//

#import <UIKit/UIKit.h>

#if __IPHONE_OS_VERSION_MIN_REQUIRED >= 60000
#define AHTextAlignmentCenter NSTextAlignmentCenter
#define AHLineBreakModeWordWrap NSLineBreakByWordWrapping
#else
#define AHTextAlignmentCenter UITextAlignmentCenter
#define AHLineBreakModeWordWrap UILineBreakModeWordWrap
#endif

#define UIColorWithRGB(r,g,b) [UIColor colorWithRed:r/255. green:g/255. blue:b/255. alpha:1.]
#define UIColorRGB(r) [UIColor colorWithRed:(r>>16&0xff)/255. green:(r>>8&0xff)/255. blue:(r&0xff)/255. alpha:1.]
#define UIColorWithRGBA(r,g,b,a) [UIColor colorWithRed:r/255. green:g/255. blue:b/255. alpha:a/255.]
#define UIColorRGBA(r) [UIColor colorWithRed:(r>>24&0xff)/255. green:(r>>16&0xff)/255. blue:(r>>8&0xff)/255. alpha:(r&0xff)/255.]
//色值
#define GLOBAL_COLOR_A          UIColorRGB(0x0899FF)
#define GLOBAL_COLOR_B          UIColorRGB(0xFF8612)
#define GLOBAL_COLOR_C          UIColorRGB(0x333333)
#define GLOBAL_COLOR_D          UIColorRGB(0x646464)
#define GLOBAL_COLOR_F          UIColorRGB(0x898989)
#define GLOBAL_COLOR_G          UIColorRGB(0xB3B3B3)
#define GLOBAL_COLOR_M          UIColorRGB(0xF9F9F9)
#define GLOBAL_COLOR_L          UIColorRGB(0xF2F2F2)
#define GLOBAL_COLOR_N          UIColorRGB(0xFFFFFF)
#define GLOBAL_COLOR_U          UIColorRGB(0xE0E0E0)
#define GLOBAL_COLOR_V          UIColorRGB(0xCECECE)

//字号（iPhone6）
#define IPHONE6_FONT_SIZE_1     17.0f
#define IPHONE6_FONT_SIZE_2     16.0f
#define IPHONE6_FONT_SIZE_3     15.0f
#define IPHONE6_FONT_SIZE_4     14.0f
#define IPHONE6_FONT_SIZE_5     13.0f
#define IPHONE6_FONT_SIZE_6     12.0f
//字号（iPhone5）
#define IPHONE5_FONT_SIZE_1     16.0f
#define IPHONE5_FONT_SIZE_2     15.0f
#define IPHONE5_FONT_SIZE_3     14.0f
#define IPHONE5_FONT_SIZE_4     13.0f
#define IPHONE5_FONT_SIZE_5     12.0f

#define IPHONE6_FONT_SIZE_CELL_ARROW        18.0f

typedef enum {
    AHAlertViewStyleDefault = 0,
    AHAlertViewStyleSecureTextInput,
    AHAlertViewStylePlainTextInput,
    AHAlertViewStyleLoginAndPasswordInput,
} AHAlertViewStyle;

typedef enum {
	AHAlertViewEnterDirectionFromTop,
	AHAlertViewEnterDirectionFromRight,
	AHAlertViewEnterDirectionFromBottom,
	AHAlertViewEnterDirectionFromLeft,
} AHAlertViewEnterDirection;

typedef enum {
	AHAlertViewExitDirectionToTop,
	AHAlertViewExitDirectionToRight,
	AHAlertViewExitDirectionToBottom,
	AHAlertViewExitDirectionToLeft,
} AHAlertViewExitDirection;

typedef enum {
	AHAlertViewPresentationStyleNone = 0,
	AHAlertViewPresentationStylePop,
	AHAlertViewPresentationStyleFade,
	AHAlertViewPresentationStylePush,

	AHAlertViewPresentationStyleDefault = AHAlertViewPresentationStylePop
} AHAlertViewPresentationStyle;

typedef enum {
	AHAlertViewDismissalStyleNone = 0,
	AHAlertViewDismissalStyleZoomDown,
	AHAlertViewDismissalStyleZoomOut,
	AHAlertViewDismissalStyleFade,
	AHAlertViewDismissalStyleTumble,
	AHAlertViewDismissalStylePush,

	AHAlertViewDismissalStyleDefault = AHAlertViewDismissalStyleFade
} AHAlertViewDismissalStyle;

typedef void (^AHAlertViewButtonBlock)();

@interface AHAlertView : UIView

// This text is presented at the top of the alert view, if non-nil.
@property(nonatomic, copy) NSString *title;
// This text is presented below the title and above any other controls, if non-nil.
@property(nonatomic, copy) NSString *message;
// This property indicates whether the alert is currently displayed on the screen.
@property(nonatomic, readonly, assign, getter = isVisible) BOOL visible;
// This property determines which controls are added to the alert (see AHAlertViewStyle above)
@property(nonatomic, assign) AHAlertViewStyle alertViewStyle;
// This property determines the animation used when the alert is shown.
@property(nonatomic, assign) AHAlertViewPresentationStyle presentationStyle;
// This property determines the animation used when the alert is dismissed.
@property(nonatomic, assign) AHAlertViewDismissalStyle dismissalStyle;
// For presentation animations that have an origin other than the center of the screen (push),
// this specifies the origination direction of the alert view.
@property(nonatomic, assign) AHAlertViewEnterDirection enterDirection;
// For dismissal animations that have an origin other than the center of the screen (push),
// this specifies the destination direction of the alert view.
@property(nonatomic, assign) AHAlertViewExitDirection exitDirection;
// Use this class inheriting from UITextField for text fields.
@property(nonatomic, retain) Class textFieldClass;

// neoadd 有的时候之前的keywindow就没了，是在连续多个uialertView弹出的时候
@property (nonatomic, strong) UIWindow *previousKeyWindow;
// neoadd 希望能够自定义
@property (nonatomic, strong) UITextField *plainTextField;

// Resets all UIAppearance modifiers back to generic iOS alert styles
+ (void)applySystemAlertAppearance;

// Designated initializer
- (id)initWithTitle:(NSString *)title message:(NSString *)message;

// Use this method to add an arbitrary number of buttons to the alert view.
// The block, if present, will be invoked when the corresponding button is pressed.
- (void)addButtonWithTitle:(NSString *)title block:(AHAlertViewButtonBlock)block;
// Use this method to set the title and action for a "destructive" button,
// which may have a different visual style than a normal button.
- (void)setDestructiveButtonTitle:(NSString *)title block:(AHAlertViewButtonBlock)block;
// Use this method to set the title and action for the cancel button,
// which may have a different visual style than a normal button
- (void)setCancelButtonTitle:(NSString *)title block:(AHAlertViewButtonBlock)block;

// Show the alert with the current presentation style
- (void)show;
// Show the alert with a custom presentation style, which then becomes the alert's current presentation style
- (void)showWithStyle:(AHAlertViewPresentationStyle)presentationStyle;
// Hide the alert with the current dismissal style
- (void)dismiss;
// Hide the alert with a custom dismissal style, which then becomes the alert's current dismissal style
- (void)dismissWithStyle:(AHAlertViewDismissalStyle)dismissalStyle;

// Retrieve the text field corresponding to the supplied index:
// For AHAlertViewStyleSecureTextInput and AHAlertViewStylePlainTextInput styles, there is only one text field at index 0.
// For AHAlertViewStyleLoginAndPasswordInput, the login field is at index 0, and the password field is at index 1.
- (UITextField *)textFieldAtIndex:(NSInteger)textFieldIndex;

// UIAppearance methods and properties

// Use this property to set the background image of alerts. For best results, use a resizable image.
@property(nonatomic, strong) UIImage *backgroundImage UI_APPEARANCE_SELECTOR;
// Use this property to customize the insets surrounding the content of the alert.
// This does not affect leading between labels and other controls.
@property(nonatomic, assign) UIEdgeInsets contentInsets UI_APPEARANCE_SELECTOR;

// Use this property to customize the title text appearance. The dictionary keys are documented in UIStringDrawing.h
@property(nonatomic, copy) NSDictionary *titleTextAttributes UI_APPEARANCE_SELECTOR;
// Use this property to customize the message text appearance. The dictionary keys are documented in UIStringDrawing.h
@property(nonatomic, copy) NSDictionary *messageTextAttributes UI_APPEARANCE_SELECTOR;
// Use this property to customize the button title text appearance. The dictionary keys are documented in UIStringDrawing.h
@property(nonatomic, copy) NSDictionary *buttonTitleTextAttributes UI_APPEARANCE_SELECTOR;

// Use these methods to set/get the background image for control state(s) of normal buttons.
- (void)setButtonBackgroundImage:(UIImage *)backgroundImage forState:(UIControlState)state UI_APPEARANCE_SELECTOR;
- (UIImage *)buttonBackgroundImageForState:(UIControlState)state UI_APPEARANCE_SELECTOR;

// Use these methods to set/get the background image for control state(s) of cancel buttons.
- (void)setCancelButtonBackgroundImage:(UIImage *)backgroundImage forState:(UIControlState)state UI_APPEARANCE_SELECTOR;
- (UIImage *)cancelButtonBackgroundImageForState:(UIControlState)state UI_APPEARANCE_SELECTOR;

// Use these methods to set/get the background image for control state(s) of destructive buttons.
- (void)setDestructiveButtonBackgroundImage:(UIImage *)backgroundImage forState:(UIControlState)state UI_APPEARANCE_SELECTOR;
- (UIImage *)destructiveButtonBackgroundImageForState:(UIControlState)state UI_APPEARANCE_SELECTOR;


- (void)setDoneButtonEnable:(BOOL)enable;

- (void)setTitleString:(NSString *)str;


- (void)addOtherSubView:(UIView *)otherView;
@end
