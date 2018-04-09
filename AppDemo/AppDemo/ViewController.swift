//
//  ViewController.swift
//  AppDemo
//
//  Created by heguican on 2018/4/9.
//  Copyright © 2018年 heguican. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func startAppleScript(_ sender: Any) {
        guard let scriptPath = Bundle.main.path(forResource: "AppleScriptDemo", ofType: "scpt") else { return }
        guard let osascriptPath = Bundle.main.path(forResource: "osascript", ofType: nil) else { return }
        let task = Process.launchedProcess(launchPath: osascriptPath, arguments: [scriptPath])
        task.waitUntilExit()
    }

}

