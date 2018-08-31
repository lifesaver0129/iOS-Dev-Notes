> TROUBLESHOOT BUILD FAILURES

# If multiple commands produce the same output

The New Build System detects if multiple commands in your project produce the same output. This could cause your build to fail to produce the same products every time. If your project has multiple commands which produce the same output, you will see a build error similar to:

```
error: Multiple commands produce '/Users/user/Library/Developer/Xcode/DerivedData/A-dzgekznnciixqzfsegyqigsizcuw/Build/Products/Debug/A.app/Contents/MacOS/A':``1) Target 'A' has link command with path '/Users/user/Library/Developer/Xcode/DerivedData/A-dzgekznnciixqzfsegyqigsizcuw/Build/Products/Debug/A.app/Contents/MacOS/A'``2) Target 'B' has link command with path '/Users/user/Library/Developer/Xcode/DerivedData/A-dzgekznnciixqzfsegyqigsizcuw/Build/Products/Debug/A.app/Contents/MacOS/A'
```

In this case, both target A and target B are compiling and linking the same binary file, making it ambiguous which one will be on disk after the build has completed. You may see different types of files and commands listed in this error, depending on which outputs are duplicated.

*Note:* If the output is surrounded by `<` and `>` characters, it is a special kind of output used by the build system for ordering related commands, but does not necessarily correspond to a file on disk.

If multiple targets produce the same output because the output is required by clients of each of those targets, factor out the creation of that output into a new target which the others can depend upon.

If the outputs are multiple different products that should exist side by side, you should make sure that they have unique product names.

## Change the product name of the target

1. In the [project editor](https://help.apple.com/xcode/mac/current/#/devdab46c612), select the target, then click Build Settings.
2. In the search field, enter `product` to filter the list of build settings.
3. Double-click the Product Name row, then enter a new product name in the dialog that appears.
4. To dismiss the dialog, click anywhere in the project editor.

