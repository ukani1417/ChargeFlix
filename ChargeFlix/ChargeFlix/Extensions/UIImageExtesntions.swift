//
//  ImageExtesntions.swift
//  ChargeFlix
//
//  Created by Dhruv Ukani on 20/10/23.
//

import Foundation
import Kingfisher
import UIKit

extension UIImageView {
    func setImage(with urlString: String) {
        if urlString == "" {
            self.image = UIImage(named: "error")
        } else {
            guard let imageURL = URL.init(string: Constants.imagePath + urlString) else { return }
            let resource = KF.ImageResource(downloadURL: imageURL)
            kf.indicatorType = .activity
            kf.setImage(with: resource)
        }
      }
}
