//
//  ViewControllerExtesion.swift
//  ChargeFlix
//
//  Created by Dhruv Ukani on 25/10/23.
//

import UIKit

extension UIViewController {
    func showAlert(title: String, message: String) {
        let dialogMessage = UIAlertController(title: title, message: message, preferredStyle: .alert)
                let okAction = UIAlertAction(title: "OK", style: .default, handler: { (_) -> Void in
                     print("Ok button tapped")
                  })
        dialogMessage.addAction(okAction)
        self.present(dialogMessage, animated: true, completion: nil)
    }
    
}
