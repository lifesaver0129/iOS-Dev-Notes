// Navigate to newsfeed
((application.keyWindow?.rootViewController as? BrowserViewController)!.currentSessionViewController!.topViewController as? NewTabPageViewController)!.webkitWebView.evaluateJavaScript("$('.rc-item-js.rc-item.show .rc.rcdw a').attr('href')", completionHandler: { str, err in })

// Suggest siri shortcuts
private func registerSiriSuggestion() {
        guard #available(iOS 12.0, *) else { return }
        let suggestion = [
            INShortcut(userActivity: NSUserActivity(activityType: UserActivityType.favorite)),
            INShortcut(userActivity: NSUserActivity(activityType: UserActivityType.photo)),
            INShortcut(userActivity: NSUserActivity(activityType: UserActivityType.news)),
            INShortcut(userActivity: NSUserActivity(activityType: UserActivityType.newTab)),
            INShortcut(userActivity: NSUserActivity(activityType: UserActivityType.newPrivate)),
            INShortcut(userActivity: NSUserActivity(activityType: UserActivityType.voice))
            ]
        INVoiceShortcutCenter.shared.setShortcutSuggestions(suggestion)
    }

// Disable constrains
//swiftlint:disablfe next force_unwrapping

let pasteboard = UIPasteboard.general
if let content = pasteboard.string {
    let new_content = "microsoft-edge-" + content
    if let url = URL(string: new_content) {
        extensionContext?.open(url, completionHandler: { (success) in
            if !success {
                if let searchURL = URL(string: ("microsoft-edge-debug://search/" + content)) {
                    self.extensionContext?.open(searchURL, completionHandler: { (success) in
                        if !success {
                            // cannot search as well
                            self.SimpleLabel.text = "cannot search as well"
                        }
                    })
                }
            } else {
                self.SimpleLabel.text = "opening the url"
            }
        })
    }
} else {
    self.deeplinkRouter.handle(URL(string: "https://www.bing.com"), withCompletion: nil)
}
