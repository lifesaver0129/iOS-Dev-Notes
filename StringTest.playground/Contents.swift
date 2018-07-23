import UIKit

var str = "Hello, playground"

extension String {
    subscript(range: Range<Int>) -> String {
        return String(self[index(startIndex, offsetBy: range.lowerBound) ..< index(startIndex, offsetBy: range.upperBound)])
    }
    
    
    func substring(from: Int, to: Int) -> String {
        let start = index(startIndex, offsetBy: from)
        let end = index(start, offsetBy: to - from)
        return String(self[start ..< end])
    }
    
    func substring(range: NSRange) -> String {
        return substring(from: range.lowerBound, to: range.upperBound)
    }
    
    func substring(range: Range<Int>) -> String {
        return String(self[index(startIndex, offsetBy: range.lowerBound) ..< index(startIndex, offsetBy: range.upperBound)])
    }
}


print (str.substring(from: 2,to: 3))
print (str.substring(range: [2...3]))

