//
//  LabelExtension.swift
//  ChargeFlix
//
//  Created by Dhruv Ukani on 25/10/23.
//

import UIKit

extension UILabel {
    func setLabel(text: String, textColor: UIColor, bgColor: UIColor?, font: UIFont?) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = text
        label.textAlignment = .center
        label.textColor = textColor
        
        if let bgColor = bgColor {
            label.backgroundColor = bgColor
        }
        
        if let font = font {
            label.font =  font
        }
        
        return label
    }

}
