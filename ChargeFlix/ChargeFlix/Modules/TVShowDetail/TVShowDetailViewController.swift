//
//  TVShowDetailViewController.swift
//  ChargeFlix
//
//  Created by Dhruv Ukani on 02/11/23.
//

import UIKit

protocol TVShowDetailViewControllerProtocol: AnyObject {
    var presenter: TVShowDetailPresenterProtocol? { get set }
    
    func onFetchSuccess(data: CustomDetailViewModel)
    func showActity()
    func hideActivity()
    
    func onFetchVideoContent(data: MovieVideo)
    func onFetchCastContent(data: [ListObj])
}

class TVShowDetailViewController: UIViewController {

    var presenter: TVShowDetailPresenterProtocol?
    
    private let scrollView: UIScrollView = {
        let scrolllView = UIScrollView()
        scrolllView.translatesAutoresizingMaskIntoConstraints = false
        scrolllView.showsHorizontalScrollIndicator = false
        scrolllView.showsVerticalScrollIndicator = false
        return scrolllView
    }()
    
    private let activityIndicator: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView(style: .large)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.color = .red
        view.hidesWhenStopped = true
        return view
    }()

    private let tvShowDetailView: UIView = {
        let view = CustomDetailView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConstraint()
        presenter?.viewDidLoad()
        
    }
    
    private func setupUI() {
        view.addSubview(scrollView)
        view.addSubview(activityIndicator)
        scrollView.addSubview(tvShowDetailView)
    }

    private func setupConstraint() {
        setupScrollViewConstraints()
        setupTVShowDetailViewConstraints()
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
    private func setupTVShowDetailViewConstraints() {
        NSLayoutConstraint.activate([
            tvShowDetailView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            tvShowDetailView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            tvShowDetailView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
        ])
    }
    private func setupActivityIndicatorConstraints() {
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

}

extension TVShowDetailViewController: TVShowDetailViewControllerProtocol {
    
    func onFetchSuccess(data: CustomDetailViewModel) {
        DispatchQueue.main.async {
            ((self.tvShowDetailView) as? CustomDetailView)?.configContent(data: data)
        }
    }
    func onFetchVideoContent(data: MovieVideo) {
        ((self.tvShowDetailView) as? CustomDetailView)?.configVideoContent(data: data)
    }
    
    func onFetchCastContent(data: [ListObj]) {
        DispatchQueue.main.async {
            ((self.tvShowDetailView) as? CustomDetailView)?.configCastContent(
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
