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
    
    private let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
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
        view.tableHeaderView = TableHeaderView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 200))
        view.register(MovieTableViewCell.self, forCellReuseIdentifier: MovieTableViewCell.identifire)
        return view
    }()
    
    private func setupUI() {
        view.addSubview(contentView)
        view.addSubview(activityIndicator)
        contentView.addSubview(movieTableView)
    }
    
    private func setupDelegates() {
        movieTableView.delegate = self
        movieTableView.dataSource = self
    }
    
    private func setupConstraint() {
        NSLayoutConstraint.activate([
            
            contentView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            contentView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            contentView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            contentView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            movieTableView.topAnchor.constraint(equalTo: contentView.topAnchor),
            movieTableView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            movieTableView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            movieTableView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            activityIndicator.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])
    }

}

extension HomeViewController: HomeViewInterface {
    func setupHeaderView(title: String, poster: String) {
        DispatchQueue.main.async {
            let headerView: TableHeaderView = TableHeaderView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 200))
            headerView.configContent(title: title, poster: poster)
            self.movieTableView.tableHeaderView = headerView
        }
    }
    
    func showActity() {
        DispatchQueue.main.async {
            self.activityIndicator.startAnimating()
        }
    }
    
    func hideActivity() {
        DispatchQueue.main.async {
            self.activityIndicator.startAnimating()
        }
    }
    
    func reloadTable() {
        DispatchQueue.main.async {
            self.movieTableView.reloadData()
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
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return presenter?.setupHeaderView(section: section)
    }
    
}

extension HomeViewController: MovieTableCellToView {
    func numsOfSectionInCollection(sectionForCollection: Int) -> Int {
        return presenter?.numsOfSectionInCollection(sectionForCollection: sectionForCollection) ?? 0
    }
    
    func numsOfRowsCollectionSection(section: Int, sectionForCollection: Int) -> Int {
        return presenter?.numsOfRowsCollectionSection(section: section, sectionForCollection: sectionForCollection) ?? 0
    }
    
    func setupCollectionCell(collectionView: UICollectionView,
                             indexPath: IndexPath,
                             sectionForCollection: Int) -> UICollectionViewCell {
        return presenter?.setupCollectionCell(collectionView: collectionView,
                                              indexPath: indexPath,
                                              sectionForCollection: sectionForCollection) ?? UICollectionViewCell()
    }
    
}