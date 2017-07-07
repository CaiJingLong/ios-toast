//
//  ViewController.swift
//  Toast
//
//  Created by Caijinglong on 2017/7/7.
//  Copyright © 2017年 kikt. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .gray
        // Do any additional setup after loading the view, typically from a nib.
        NSLog("viewDidLoad")
        runDelay(1) {
            toast("hello toast")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

