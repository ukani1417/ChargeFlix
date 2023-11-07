//
//  MovieDetailViewController.swift
//  ChargeFlix
//
//  Created by Dhruv Ukani on 02/11/23.
//

import UIKit

class DetailViewController: UIViewController {

    var presenter: DetailViewToPresenterProtocol?
    
    private let scrollView: UIScrollView = {
        let scrolllView = UIScrollView()
        scrolllView.translatesAutoresizingMaskIntoConstraints = false
        scrolllView.showsHorizontalScrollIndicator = false
        scrolllView.showsVerticalScrollIndicator = false
        return scrolllView
    }()
    
    private let contentView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let activityIndicator: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView(style: .large)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.color = .red
        view.hidesWhenStopped = true
        return view
    }()

    private let movieDetailView: UIView = {
        let view = CustomDetailView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConstraints()
        presenter?.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = true
        self.navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    private func setupUI() {
        view.addSubview(scrollView)
        view.addSubview(activityIndicator)
        scrollView.addSubview(movieDetailView)
    }
    
    private func setupConstraints() {
        setupScrollViewConstraints()
        setupMovieDetailViewConstraints()
        setupActivityIndicatorConstraints()
    }
    
    private func setupScrollViewConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            scrollView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    private func setupContentViewConstraints() {
        NSLayoutConstraint.activate([
            contentView.widthAnchor.constraint(equalTo: view.widthAnchor),
                        contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
                        contentView.leftAnchor.constraint(equalTo: scrollView.leftAnchor),
                        contentView.rightAnchor.constraint(equalTo: scrollView.rightAnchor),
                        contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
            
        ])
    }
    private func setupMovieDetailViewConstraints() {
        NSLayoutConstraint.activate([
            movieDetailView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            movieDetailView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            movieDetailView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
        ])
    }
    private func setupActivityIndicatorConstraints() {
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }  
}

extension DetailViewController: DetailPresenterToViewProtocol {
    
    func onFetchSuccess(data: CustomDetailViewModel) {
        DispatchQueue.main.async {
            self.title = data.title
            (self.movieDetailView as? CustomDetailView)?.configContent(data: data,
                                                                         delegate: self.presenter as? CollectionViewToPresenter)
            self.movieDetailView.reloadInputViews()
        }
    }
    
    func onFetchFailure(message: String) {
        DispatchQueue.main.async {
            self.showAlert(title: "Error", message: message)
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

}
