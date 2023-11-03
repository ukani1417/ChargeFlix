//
//  MovieViewController.swift
//  ChargeFlix
//
//  Created by Dhruv Ukani on 25/10/23.
//

import UIKit

protocol MovieViewInterface: AnyObject {
    var presenter: MoviePresenterInterface? { get set }
    
    func showActity()
    func hideActivity()
    
    func onFetchPopularMovieListSuccess(data: [ListObj])
    func onFetchPopularMovieListFailure()
    func setupTitle(title: String)
}

class MovieViewController: UIViewController {

    var presenter: MoviePresenterInterface?
    
    init(presenter: MoviePresenterInterface? = nil) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
     private var moviessCollectionView: CustomCollectionView = {
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
        view.backgroundColor = .black
        setupUI()
        setupConstraints()
        presenter?.viewDidLoad()
    }
    
    private func setupUI() {
        self.title = "Movies"
        view.backgroundColor = .systemBackground
        
        view.addSubview(moviessCollectionView)
        view.addSubview(activityIndicator)
    }
    
    private func setupConstraints() {
        setupMoviessCollectionViewConstraints()
        setupActivityIndicatorConstraints()
    }
    private func setupMoviessCollectionViewConstraints() {
        NSLayoutConstraint.activate([
            moviessCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            moviessCollectionView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            moviessCollectionView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            moviessCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    private func setupActivityIndicatorConstraints() {
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
}

extension MovieViewController: MovieViewInterface {
    
    func setupTitle(title: String) {
        DispatchQueue.main.async {
            self.title = title
        }
    }
    func onFetchPopularMovieListSuccess(data: [ListObj]) {
        DispatchQueue.main.async {
            self.moviessCollectionView.configContent(list: data,
                                                     delegate: self.presenter as? CollectionViewToPresenter )
            self.moviessCollectionView.collectionview?.reloadData()
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
