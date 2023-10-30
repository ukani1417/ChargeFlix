//
//  TVShowViewController.swift
//  ChargeFlix
//
//  Created by Dhruv Ukani on 25/10/23.
//

import UIKit

protocol ViewToNewCollectionView {
    func numsOfItem(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    func setupCell(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
}

class TVShowViewController: UIViewController {
 
    var presenter: TVShowPresenterInterface?
    
    private var newView: NewCollectionView = {
        let cView = NewCollectionView(scrollDirection: .vertical)
        cView.translatesAutoresizingMaskIntoConstraints = false
        return cView
    }()
    
    private let activityIndicator: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView(style: .large)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.color = AppTheme.activityIndicatorColor
        view.hidesWhenStopped = true
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConstraint()
        presenter?.viewDidLoad()
        
    }

    private func setupUI() {
        self.title = "TV Shows"
        view.backgroundColor = .systemBackground
        view.addSubview(newView)
        view.addSubview(activityIndicator)
    }
    
    private func setupConstraint() {
        NSLayoutConstraint.activate([
            newView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            newView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            newView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            newView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

}

extension TVShowViewController: TVShowViewInterface {
    func onFetchPopularTVShowsListSuccess(list: PopularTVShowsList?) {
        DispatchQueue.main.async {
            self.newView.configContent(list: list)
            self.newView.collectionview.reloadData()
        }
    }
    
    func showActivity() {
        DispatchQueue.main.async {
            self.activityIndicator.startAnimating()
        }
    }
    
    func hideActivity() {
        DispatchQueue.main.async {
            self.activityIndicator.stopAnimating()
        }
    }

    func onFetchPopularTVShowsListFailure() {
        DispatchQueue.main.async {
            self.showAlert(title: "Error", message: "Populer TVSHows fetch error")
        }
    }
}

