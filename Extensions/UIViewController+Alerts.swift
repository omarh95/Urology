//
//  UIViewController+Alerts.swift
//  Urology
//
//  Created by Omar H on 11/22/18.
//  Copyright © 2018 Omar H. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    func showAlert(withTitle title: String, withMessage message: String, withButtonTitle buttonTitle: String) {
        let alertController = UIAlertController(title: title,
                                                message: message,
                                                preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: buttonTitle, style: .default, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
    
}
