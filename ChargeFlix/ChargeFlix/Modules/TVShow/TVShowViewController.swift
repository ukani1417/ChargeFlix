//
//  TVShowViewController.swift
//  ChargeFlix
//
//  Created by Dhruv Ukani on 25/10/23.
//

import UIKit

class TVShowViewController: UIViewController {
 
    var presenter: TVShowViewToPresenterProtocol?
    
    private var tvShowsCollectionView: CustomCollectionView = {
        let cView = CustomCollectionView(scrollDirection: .vertical, 
                                      cellSize: CGSize(width: 130, height: 180),
                                      cellClass: CollectionViewCell.self,
                                      cellIdentifire: CollectionViewCell.identifire)
        cView.translatesAutoresizingMaskIntoConstraints = false
        cView.collectionview?.showsVerticalScrollIndicator = false
        return cView
    }()
    
    private let activityIndicator: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView(style: .large)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.color = .red
        view.hidesWhenStopped = true
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "TV Shows"
        self.navigationController?.navigationBar.tintColor = .white
        self.navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .black
        setupUI()
        setupConstraints()
        presenter?.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = false
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }

    private func setupUI() {
        view.addSubview(tvShowsCollectionView)
        view.addSubview(activityIndicator)
    }
    
    private func setupConstraints() {
        setupTVShowsCollectionViewConstraints()
        setupActivityIndicatorConstraints()
    }
    
    private func setupTVShowsCollectionViewConstraints() {
        NSLayoutConstraint.activate([
            tvShowsCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tvShowsCollectionView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            tvShowsCollectionView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            tvShowsCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func setupActivityIndicatorConstraints() {
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

}

extension TVShowViewController: TVShowPresenterToViewProtocol {
    func onFetchPopularTVShowsListSuccess(list: [ContentObject]) {
        DispatchQueue.main.async {
            self.tvShowsCollectionView.configContent(list: list, delegate: self.presenter as? CollectionViewToPresenter)
            self.tvShowsCollectionView.collectionview?.reloadData()
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

    func onFetchFailure(message: String) {
        DispatchQueue.main.async {
            self.showAlert(title: "Error", message: message)
        }
    }
}
