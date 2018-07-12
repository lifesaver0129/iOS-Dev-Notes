//
//  ViewController.swift
//  VocalTextEdit
//
//  Created by Yuxing Hu on 2018/7/11.
//  Copyright © 2018 Yuxing Hu. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    @IBOutlet var textView: NSTextView!
    
    @IBAction func speakButtonClicked(_ sender: NSButton) {
        print(" The speak button was clicked")
    }
    
    @IBAction func stopButtonClicked(_ sender: NSButton) {
        print(" The stop button was clicked")
    }
}



