//
//  HomeViewController.swift
//  ChargeFlix
//
//  Created by Dhruv Ukani on 25/10/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    var presenter: HomeViewToPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Home"
        
        view.backgroundColor = .black
        
        setupUI()
        setupDelegates()
        setupConstraints()
        presenter?.viewDidLoad()
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.tintColor = .white
        self.tabBarController?.tabBar.isHidden = false
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
        view.isHidden = false
       
        let tableHeaderView = TableHeaderView(frame: CGRect(x: 0, y: 0,
                                                            width: UIScreen.main.bounds.width,
                                                           height: 330))

        view.tableHeaderView = tableHeaderView
        return view
    }()
    
    private func setupUI() {
        view.addSubview(contentView)
        contentView.addSubview(activityIndicator)
        contentView.addSubview(movieTableView)
        movieTableView.tableHeaderView?.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tappedOnPoster)))
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
    
    @objc func tappedOnPoster() {
        print("tapped")
        presenter?.tappedOnMoviePoster()
    }
}

extension HomeViewController: HomePresenterToViewProtocol {
    func setupGenreListInHeader(genreList: [Genre]) {
        DispatchQueue.main.async {
            (self.movieTableView.tableHeaderView as? TableHeaderView)?.configGenreList(genreList: genreList)
        }
    }
    
    func setupHeaderView(input: TableHeaderInput) {
        DispatchQueue.main.async { [weak self] in
            (self?.movieTableView.tableHeaderView as? TableHeaderView)?.configContent(input: input)
            (self?.movieTableView.tableHeaderView as? TableHeaderView)?.delegate = self
            self?.movieTableView.tableHeaderView?.reloadInputViews()
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
            self.movieTableView.isHidden = false
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
        return 30.0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 210.0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return presenter?.numsOfSection() ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.numsOfRows(section: section) ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MovieTableViewCell.identifire,
                                                       for: indexPath) as? MovieTableViewCell else {
            return UITableViewCell()
        }
        let cellData = presenter?.configTableCell(section: indexPath.section)
        cell.configContent(data: cellData?.data ?? [], delegate: cellData?.delegate)
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = TableSectionHeaderView()
        let data = presenter?.setupSectionHeaderView(section: section) ?? ""
        headerView.configContent(sectionTitle: data, 
                                 section: section,
                                 delegate: presenter as? TableSectionHeaderViewToPresenter)
        
        return headerView
    }
}

extension HomeViewController: TableHeaderViewToViewController {
    func filterDataUsingGenre(index: Int) {
        presenter?.filterDataUsingGenre(index: index)
    }
}
