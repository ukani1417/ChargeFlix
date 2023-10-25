//
//  HomeViewController.swift
//  ChargeFlix
//
//  Created by Dhruv Ukani on 25/10/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    var presenter: HomePresenterInterface?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.title = "Home"
        view.backgroundColor = .systemBackground
        setupUI()
        setupDelegates()
        setupConstraint()
        presenter?.viewDidLoad()
    }
    
    private let activityIndicator: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView(style: .large)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.color = AppTheme.activityIndicatorColor
        view.hidesWhenStopped = true
        return view
    }()
    
    private let movieTableView: UITableView = {
        let view = UITableView(frame: .zero, style: .grouped)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return view
    }()
    
    private func setupUI() {
        view.addSubview(movieTableView)
        view.addSubview(activityIndicator)
        
    }
    
    private func setupDelegates() {
        movieTableView.delegate = self
        movieTableView.dataSource = self
    }
    
    private func setupConstraint() {
        NSLayoutConstraint.activate([
            movieTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            movieTableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            movieTableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            movieTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            activityIndicator.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])
    }

}

extension HomeViewController: HomeViewInterface {
    
    func onFetchPopularMovieListSuccess() {
        DispatchQueue.main.async {
            self.movieTableView.reloadSections(IndexSet(integer: 0), with: .fade)
        }
    }
    
    func onFetchTopRatedMovieListSuccess() {
        DispatchQueue.main.async {
            self.movieTableView.reloadSections(IndexSet(integer: 1), with: .fade)
        }
    }
    
    func onFetchUpComingMovieListSuccess() {
        DispatchQueue.main.async {
            self.movieTableView.reloadSections(IndexSet(integer: 2), with: .fade)
        }
    }
    
    func onFetchNowPlayingMovieListSuccess() {
        DispatchQueue.main.async {
            self.movieTableView.reloadSections(IndexSet(integer: 3), with: .fade)
        }
    }
    
    func onFetchPopularMovieListFailure() {
        DispatchQueue.main.async {
            self.showAlert(title: "Failed", message: "On Populer Movies")
        }
        
    }
    
    func onFetchTopRatedMovieListFailure() {
        DispatchQueue.main.async {
            self.showAlert(title: "Failed", message: "On TopRated Movies")
        }
    }
    
    func onFetchUpComingMovieListFailure() {
        DispatchQueue.main.async {
            self.showAlert(title: "Failed", message: "On UpComing Movies")
        }
    }
    
    func onFetchNowPlayingMovieListFailure() {
        DispatchQueue.main.async {
            self.showAlert(title: "Failed", message: "On NowPlaying Movies")
        }
    }
    
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        presenter?.heightForSectionAt(tableView: tableView, section: section) ?? 0.0
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        presenter?.heightForRowAt(tableView: tableView, indexPath: indexPath) ?? 0.0
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return presenter?.numsOfSection() ?? 0
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.numsOfRows(section: section) ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return presenter?.cellForRowAt(tableView: tableView, indexPath: indexPath) ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return presenter?.titleForHeaderSectionAt(tableView: tableView, section: section)
    }

}
