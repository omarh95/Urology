//
//  ViewController.swift
//  Urology
//
//  Created by Omar H on 11/22/18.
//  Copyright © 2018 Omar H. All rights reserved.
//

import UIKit
import Eureka

class ViewController: FormViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        form +++ Section("Time of Urination")
            <<< TimeRow(){ row in
                row.title = "Time of urination"
            }
            <<< IntRow(){
                $0.title = "Amount of Urination"
                $0.placeholder = "Enter Amount Here"
            }
            +++ Section("Section2")
            <<< DateRow(){
                $0.title = "Date Row"
                $0.value = Date(timeIntervalSinceReferenceDate: 0)
        }
        
    }

}

