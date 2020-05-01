# WelcomeKit

This package is an extremely easy way to recreate the "Welcome" (or "What's New") screen that's native to Apple platforms. Written in SwiftUI.

If you present this in a UIHostingController:
- Add "NotificationCenter.default.addObserver(forName: WelcomeView.continueNotification)" to dismiss.
- Add "isModalInPresentation = true" to prevent gesture dismissals which will not post a notification.
- "modalPresentationStyle = .formSheet" is recommened.
