//
//  MovieDetailViewController.swift
//  ChargeFlix
//
//  Created by Dhruv Ukani on 02/11/23.
//

import UIKit

protocol MovieDetailViewControllerProtocol: AnyObject {
    var presenter: MovieDetailPresenterProtocol? { get set }
    
    func onFetchSuccess(data: CustomDetailViewModel)
    func onFetchVideoContent(data: MovieVideo)
    func onFetchCastContennt(data: [ListObj])
    func showActity()
    func hideActivity()
}

class MovieDetailViewController: UIViewController {

    var presenter: MovieDetailPresenterProtocol?
    
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
    
    private func setupUI() {
        view.addSubview(scrollView)
        view.addSubview(activityIndicator)
//        scrollView.addSubview(contentView)
        scrollView.addSubview(movieDetailView)
    }
    
    private func setupConstraints() {
        setupScrollViewConstraints()
//        setupContentViewConstraints()
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
//            contentView.bottomAnchor.constraint(greaterThanOrEqualTo: movieDetailView.bottomAnchor, constant: 110)
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

extension MovieDetailViewController: MovieDetailViewControllerProtocol {
    func onFetchVideoContent(data: MovieVideo) {
        ((self.movieDetailView) as? CustomDetailView)?.configVideoContent(data: data)
    }
    
    func onFetchSuccess(data: CustomDetailViewModel) {
        DispatchQueue.main.async {
            ((self.movieDetailView) as? CustomDetailView)?.configContent(data: data)
        }
    }
    
    func onFetchCastContennt(data: [ListObj]) {
        DispatchQueue.main.async {
            ((self.movieDetailView) as? CustomDetailView)?.configCastContent(
                data: data,
                delegate: self.presenter as? CollectionViewToPresenter)
        }
       
    }
    
    func showActity() {
        activityIndicator.startAnimating()
    }
    
    func hideActivity() {
        activityIndicator.stopAnimating()
    }

}
