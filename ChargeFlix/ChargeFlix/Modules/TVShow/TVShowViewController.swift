//
//  TVShowViewController.swift
//  ChargeFlix
//
//  Created by Dhruv Ukani on 25/10/23.
//

import UIKit

class TVShowViewController: UIViewController {
 
    var presenter: TVShowPresenterInterface?
    
    private var collectionView: UICollectionView = {
        let view =  CollectionView(
            layout: ConfigLayout(scrollDirection: .vertical,
                                 itemSize: CGSize(width: 100, height: 200),
                                 sectionInset: UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1),
                                 minimumLineSpaceing: 10,
                                 minimumInteritemSpacing: 10),
            sections: 1
        )
        view.translatesAutoresizingMaskIntoConstraints = false
        view.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.identifire)
        return view
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
        setupDelegates()
        setupConstraint()
        
        presenter?.viewDidLoad()
        
    }
    
    private func setupUI() {
        self.title = "TV Shows"
        view.backgroundColor = .systemBackground
        view.addSubview(collectionView)
        view.addSubview(activityIndicator)
    }
    
    private func setupDelegates() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    private func setupConstraint() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

}

extension TVShowViewController: TVShowViewInterface {
    
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
    
    func onFetchPopularTVShowsListSuccess() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    func onFetchPopularTVShowsListFailure() {
        DispatchQueue.main.async {
            self.showAlert(title: "Error", message: "Populer TVSHows fetch error")
        }
    }
}

extension TVShowViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter?.numbersOfItemInSection(section: section) ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return presenter?.setupCell(collectionView, cellForItemAt: indexPath) ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter?.didSelect(indexPath: indexPath)
    }
}