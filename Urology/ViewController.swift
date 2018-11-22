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

        //MARK: - Urination Section
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
            //MARK: - Fluid Intake Section
            +++ Section("Fluid Intake")
            <<< TimeRow(){
                $0.title = "Time"
                $0.value = Date()
            }
            <<< IntRow(){
                $0.title = "Amount"
                $0.placeholder = "Enter Amount Here"
            }
           
            //MARK: - Accident Section
            +++ Section("Accident")
            <<< SwitchRow("didUserHaveAccidentRow"){
                $0.title = "Accident?"
            }
            <<< TimeRow(){ row in
                row.title = "Time of Accident"
                row.value = Date()
                row.hidden = Condition.function(["didUserHaveAccidentRow"], { (form) -> Bool in
                    return !((form.rowBy(tag: "didUserHaveAccidentRow") as? SwitchRow)?.value ?? false)
                })
            }
            <<< PickerInputRow<String>(){ row in
                row.title = "Accident Type"
                row.options = ["Urinary", "Stool"]
                row.value = "Urinary"
                row.hidden = Condition.function(["didUserHaveAccidentRow"], { (form) -> Bool in
                    return !((form.rowBy(tag: "didUserHaveAccidentRow") as? SwitchRow)?.value ?? false)
                })
            }
            <<< IntRow(){ row in
                row.title = "amount"
                row.placeholder = "Enter Amount Here"
            }
        
            //MARK: - Other Symptoms Section
            +++ Section("Other Symptoms")
            <<< MultipleSelectorRow<String>() { row in
                row.title = "Other Symptoms"
                row.options = ["Fatigue", "Pain", "Naseua", "Dizziness"]
            }
    }

    
}

