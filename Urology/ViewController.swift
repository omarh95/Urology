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
            <<< SwitchRow("didUserHaveBowelMovementRow"){ row in
                row.title = "Bowel Movement?"
            }
            <<< TimeRow(){ row in
                row.title = "Time of Bowel Movement"
                row.hidden = Condition.function(["didUserHaveBowelMovementRow"], { (form) -> Bool in
                    return !((form.rowBy(tag: "didUserHaveBowelMovementRow") as? SwitchRow)?.value ?? false)
                })
            }
    
            +++ Section("Fluid Intake")
            <<< TimeRow(){
                $0.title = "Time"
                $0.value = Date(timeIntervalSinceReferenceDate: 0)
            }
            <<< IntRow(){
                $0.title = "Amount"
                $0.placeholder = "Enter Amount Here"
            }
           
            +++ Section("Accident")
            <<< SwitchRow("didUserHaveAccidentRow"){
                $0.title = "Accident?"
            }
            <<< TimeRow(){ row in
                row.title = "Time of Accident"
                row.hidden = Condition.function(["didUserHaveAccidentRow"], { (form) -> Bool in
                    return !((form.rowBy(tag: "didUserHaveAccidentRow") as? SwitchRow)?.value ?? false)
                })
            }
//            <<< PickerRow(){
//                $0.title = "sample"
//                row.options = ["Urinary", "Stool"]
//                row.value = "Urinary"
//                row.hidden = Condition.function(["didUserHaveAccidentRow"], { (form) -> Bool in
//                    return !((form.rowBy(tag: "didUserHaveAccidentRow") as? SwitchRow)?.value ?? false)
//                })
//            }
    }

}

