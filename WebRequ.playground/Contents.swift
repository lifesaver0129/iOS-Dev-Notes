import UIKit
import WebKit
import JavaScriptCore

let myURLString = "https://www.msn.com/spartan/mmx"
let myURL = URL(string: myURLString)

//do {
//    let myHTMLString = try String(contentsOf: myURL!, encoding: .ascii)
//    print("HTML : \(myHTMLString)")
//} catch let error {
//    print("Error: \(error)")
//}


let jsSource = "$('#SIvCob').textContent"

var context = JSContext()
context?.evaluateScript(jsSource)

let testFunction = context?.objectForKeyedSubscript(try! String(contentsOf: myURL!, encoding: .ascii))
let result = testFunction?.call(withArguments: ["the message"])
