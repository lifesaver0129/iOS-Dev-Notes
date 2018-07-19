# Adapt Edge to iOS 12

* Pods -> Pod file

  * Comment `pod 'PapyrusLib', :git => 'https://microsoft.visualstudio.com/DefaultCollection/Universal%20Store/_git/MS.MPE.Pod.PapyrusLib', :tag => '1.1807.11.0' `

* RubyBrowser -> Service -> Instrumentation -> PapyrusTelemetryDelegate.swift
  * Comment `import PapyrusCore`
  * Comment all

* RubyBrowser -> Service -> Instrumentation -> PapyrusAuthProvider.swift 

  * Comment `import PapyrusCore`
  * Comment all

* RubyBrowser -> Service -> Instrumentation -> PapyrusCorrelationVector.swift

  * Comment `import PapyrusCore`
  * Comment all

* RubyBrowser -> Service -> Books -> PapyrusSleepModeDelegate.swift 

  * Comment `import PapyrusCore`
  * Comment all

* RubyBrowser -> Service -> Application -> PapyrusNotificationsProvider.swift 

  * Comment `import Papyrus`
  * Comment `import PapyrusCore`
  * Comment all

* RubyBrowser -> Comment -> Hub -> Books -> Controller -> BooksViewController.swift 

  - Comment `import Papyrus`
  - Comment `import PapyrusCore`
  - Comment all

* RubyBrowser -> Service -> Extensions -> StringExtension.swift

  * Comment 

    ```swift
    subscript(range: Range<Int>) -> String {
            return String(self[Range(index(startIndex, offsetBy: range.lowerBound) ..< index(startIndex, offsetBy: range.upperBound))])
        }
    ```

  * Revert to "Hello"