//
//  HomeViewController.swift
//  ChargeFlix
//
//  Created by Dhruv Ukani on 25/10/23.
//

import UIKit

protocol HomeViewInterface: AnyObject {
    var presenter: HomePresenterInterface? { get set }
    
    func showActity()
    func hideActivity()
    func reloadTable()
    func setupHeaderView(input: TableHeaderInput)
    func onFetchFailure(message: String)
}

class HomeViewController: UIViewController {
    
    var presenter: HomePresenterInterface?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.title = "Home"
       
        view.backgroundColor = .black
        
        setupUI()
        setupDelegates()
        setupConstraints()
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
        view.color = .red
        view.hidesWhenStopped = true
        return view
    }()
    
    private let movieTableView: UITableView = {
        let view = UITableView(frame: .zero, style: .grouped)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.register(MovieTableViewCell.self, forCellReuseIdentifier: MovieTableViewCell.identifire)
        view.showsVerticalScrollIndicator = false
        view.backgroundColor = .black
        return view
    }()
    
    private func setupUI() {
        view.addSubview(contentView)
        contentView.addSubview(activityIndicator)
        contentView.addSubview(movieTableView)
    }

    private func setupDelegates() {
        movieTableView.delegate = self
        movieTableView.dataSource = self
    }
    private func setupConstraints() {
        setupContentViewConstraints()
        setupMovieTableViewConstraints()
        setupActivityIndicatorConstraints()
    }
    private func setupContentViewConstraints() {
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            contentView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            contentView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            contentView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    private func setupMovieTableViewConstraints() {
        NSLayoutConstraint.activate([
            movieTableView.topAnchor.constraint(equalTo: contentView.topAnchor),
            movieTableView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            movieTableView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            movieTableView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    private func setupActivityIndicatorConstraints() {
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
}

extension HomeViewController: HomeViewInterface {
    func setupHeaderView(input: TableHeaderInput) {
        DispatchQueue.main.async {
            let headerView: TableHeaderView = TableHeaderView(frame: CGRect(x: 0, y: 0, 
                                                                            width: self.view.frame.width,
                                                                            height: 330))
            
            headerView.configContent(input: input)
            headerView.delegate = self
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
            self.movieTableView.layoutIfNeeded()
        }
    }
    
    func onFetchFailure(message: String) {
        DispatchQueue.main.async {
            self.showAlert(title: "Failed", message: message)
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

extension HomeViewController: TableHeaderViewToViewController {
    func filterDataUsingGenre(index: Int) {
        presenter?.filterDataUsingGenre(index: index)
    }
}
