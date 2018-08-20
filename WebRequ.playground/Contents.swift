import UIKit
import WebKit

let webConfiguration = WKWebViewConfiguration()
let webView = WKWebView(frame: .zero, configuration: webConfiguration)
let myURL = URL(string: "https://www.msn.com/spartan/mmx")
let myRequest = URLRequest(url: myURL!)
webView.load(myRequest)
webView.evaluateJavaScript("$('.rc-item-js.rc-item.show .rc.rcdw a').attr('href')", completionHandler: { result, err in
    if err == nil,
        let urlString = result as? String,
        let url = URL(string: urlString) {
        print(url)
    }
})
