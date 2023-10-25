//
//  MovieViewController.swift
//  ChargeFlix
//
//  Created by Dhruv Ukani on 25/10/23.
//

import UIKit

class MovieViewController: UIViewController {

    var presenter: MoviePresenterInterface? 
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        // Do any additional setup after loading the view.
    }
    
    private func setupUI() {
        self.title = "Movies"
        view.backgroundColor = .systemBackground
    }
}

extension MovieViewController: MovieViewInterface {
    
}
