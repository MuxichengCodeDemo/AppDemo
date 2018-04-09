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

    @IBAction func createHelpIndex(_ sender: Any) {
        guard let scriptPath = Bundle.main.path(forResource: "CreateHelpIndex", ofType: "scpt") else { return }
        guard let infoPlistPath = Bundle.main.path(forResource: "Info", ofType: "plist") else { return }
        guard let infoPlistStringPath = Bundle.main.path(forResource: "InfoPlist", ofType: "strings") else { return }
        guard let HtmlPath = Bundle.main.path(forResource: "HelpIndexDemo", ofType: "html") else { return }
        guard let deskTopPath = NSSearchPathForDirectoriesInDomains(.desktopDirectory, .userDomainMask, true).first else { return }
        let helpInfoPlistPath = deskTopPath + "/HelpIndexDemo/Contents/Resources/Info.plist"
        let helpInfoPlistStringPath = deskTopPath + "/HelpIndexDemo/Contents/Resources/zh-Hans.lproj/InfoPlist.strings"
        let helpFolderPath = deskTopPath + "/HelpIndexDemo/Contents/Resources/zh-Hans.lproj/HelpIndexDemo"
        let helpIndexPath = helpFolderPath + "/HelpIndexDemo.helpIndex"
        let helpHtmlPath = helpFolderPath + "/HelpIndexDemo.html"
        
        do {
            try FileManager.default.createDirectory(atPath: helpFolderPath, withIntermediateDirectories: true, attributes: nil)
            try FileManager.default.copyItem(at: URL.init(fileURLWithPath: infoPlistPath), to: URL.init(fileURLWithPath: helpInfoPlistPath))
            try FileManager.default.copyItem(at: URL.init(fileURLWithPath: infoPlistStringPath), to: URL.init(fileURLWithPath: helpInfoPlistStringPath))
            try FileManager.default.copyItem(at: URL.init(fileURLWithPath: HtmlPath), to: URL.init(fileURLWithPath: helpHtmlPath))
        } catch {
            
        }
        
        let createHelpIndexScript = "hiutil -C -a -m=3 -x \(helpInfoPlistPath) -f \(helpIndexPath) \(helpFolderPath)"
//        let createHelpIndexScript = "hiutil -C -a -s=en -m=3 -x \(helpInfoPlistPath) -f \(helpIndexPath) \(helpFolderPath)"
        let task = Process.launchedProcess(launchPath: "/usr/bin/osascript", arguments: [scriptPath, createHelpIndexScript])
        task.waitUntilExit()
        
        let contentPath = deskTopPath + "/HelpIndexDemo"
        let exportPath = deskTopPath + "/HelpIndexDemo.help"
        do {
            try FileManager.default.copyItem(at: URL.init(fileURLWithPath: contentPath), to: URL.init(fileURLWithPath: exportPath))
            try FileManager.default.removeItem(at: URL.init(fileURLWithPath: contentPath))
        } catch {
            
        }
    }
    
    @IBAction func startAppleScript(_ sender: Any) {
        guard let scriptPath = Bundle.main.path(forResource: "AppleScriptDemo", ofType: "scpt") else { return }
        let task = Process.launchedProcess(launchPath: "/usr/bin/osascript", arguments: [scriptPath])
        task.waitUntilExit()
    }

}

