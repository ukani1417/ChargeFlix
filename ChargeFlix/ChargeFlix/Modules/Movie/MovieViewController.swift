//
//  MovieViewController.swift
//  ChargeFlix
//
//  Created by Dhruv Ukani on 25/10/23.
//

import UIKit

class MovieViewController: UIViewController {

    var presenter: MoviePresenterInterface?
    
    private var moviessCollectionView: NewCollectionView = {
        let cView = NewCollectionView(scrollDirection: .vertical,
                                      cellSize: CGSize(width: 130, height: 180),
                                      cellClass: CollectionViewCell.self,
                                      cellIdentifire: CollectionViewCell.identifire)
        cView.translatesAutoresizingMaskIntoConstraints = false
        cView.collectionview.showsVerticalScrollIndicator = false
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
        self.title = "Movies"
        view.backgroundColor = .systemBackground
        view.addSubview(moviessCollectionView)
        view.addSubview(activityIndicator)
    }
    
    private func setupConstraint() {
        NSLayoutConstraint.activate([
            moviessCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            moviessCollectionView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            moviessCollectionView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            moviessCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}

extension MovieViewController: MovieViewInterface {
    func onFetchPopularMovieListSuccess(data: [ListObj]) {
        DispatchQueue.main.async {
            self.moviessCollectionView.configContent(list: data)
            self.moviessCollectionView.collectionview.reloadData()
        }
    }
    
    func showActity() {
        DispatchQueue.main.async {
            self.activityIndicator.startAnimating()
        }
    }
    
    func hideActivity() {
        DispatchQueue.main.async {
            self.activityIndicator.stopAnimating()
        }
    }

    func onFetchPopularMovieListFailure() {
        DispatchQueue.main.async {
            self.showAlert(title: "Error", message: "On Populer Movie Fetch")
        }
    }
}
