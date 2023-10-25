//
//  TVShowViewController.swift
//  ChargeFlix
//
//  Created by Dhruv Ukani on 25/10/23.
//

import UIKit

class TVShowViewController: UIViewController {
 
    var presenter: TVShowPresenterInterface?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        // Do any additional setup after loading the view.
    }
    
    private func setupUI() {
        self.title = "TV Shows"
        view.backgroundColor = .systemBackground
    }

}

extension TVShowViewController: TVShowViewInterface {
    
}
