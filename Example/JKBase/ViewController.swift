//
//  ViewController.swift
//  JKBase
//
//  Created by kashjack on 12/25/2020.
//  Copyright (c) 2020 kashjack. All rights reserved.
//

import UIKit
import JKBase

class ViewController: UIViewController {

    @IBOutlet weak var labForDateTitle: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        let time: TimeInterval = 1609221250
        
//        self.labForDateTitle.text = time.convertToDateStr()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

