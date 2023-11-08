//
//  CastDetailViewController.swift
//  ChargeFlix
//
//  Created by Dhruv Ukani on 03/11/23.
//

import UIKit

class CastDetailViewController: UIViewController {

    var presenter: CastDetailViewToPresenterProtocol?
   
    private let scrollView: UIScrollView = {
        let scrolllView = UIScrollView()
        scrolllView.translatesAutoresizingMaskIntoConstraints = false
        scrolllView.showsHorizontalScrollIndicator = false
        scrolllView.showsVerticalScrollIndicator = false
        return scrolllView
    }()
    
    private var contentView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let activityIndicator: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView(style: .large)
        view.color = .red
        view.hidesWhenStopped = true
        return view
    }()
    
    private let castProfile: UIImageView = {
        let view = UIImageView()
        view.layer.borderColor = CGColor(red: 1, green: 1, blue: 1, alpha: 1)
        view.layer.borderWidth = 2
        view.clipsToBounds = true
        view.contentMode = .scaleToFill
        view.layer.cornerRadius = 100
        return view
    }()
    
    private let castName: UILabel = {
        let view = UILabel()
        view.font = .boldSystemFont(ofSize: 36)
        view.textColor = .white
        view.numberOfLines = 0
          return view
    }()
    
    private let knownFor: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.font = .boldSystemFont(ofSize: 15)
        view.numberOfLines = 0
        return view
    }()
    
    private let overview: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.textAlignment = .left
        view.numberOfLines = 0
        return view
    }()
    
    private let imageLabel: UILabel = {
      let view = UILabel()
        view.text = "PHOTOS"
        view.textColor = .white
        view.font = .boldSystemFont(ofSize: 20)
        view.numberOfLines = 0
        return view
        
    }()

    private let knownForLabel: UILabel = {
      let view = UILabel()
        view.text = "KNOWN FOR"
        view.textColor = .white
        view.font = .boldSystemFont(ofSize: 20)
        view.numberOfLines = 0
        return view
    }()
    
    private let castImages: UIView = {
        let view = CustomCollectionView(scrollDirection: .horizontal, 
                                        cellSize: CGSize(width: 130, height: 180),
                                        cellClass: CollectionViewCell.self,
                                        cellIdentifire: CollectionViewCell.identifire)
        view.collectionview?.showsHorizontalScrollIndicator = false
        return view
    }()
    
    private let castCredit: UIView = {
        let view = CustomCollectionView(scrollDirection: .horizontal, 
                                        cellSize: CGSize(width: 130, height: 180),
                                        cellClass: CollectionViewCell.self,
                                        cellIdentifire: CollectionViewCell.identifire)
        view.collectionview?.showsHorizontalScrollIndicator = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConstraints()
        presenter?.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = true
        self.navigationController?.navigationBar.prefersLargeTitles = false
    }
    private func setupUI() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        [castProfile, castName, knownFor, overview, imageLabel, castImages,knownForLabel, castCredit].forEach { view in
            contentView.addSubview(view)
            view.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    func setupConstraints() {
        setupScrollViewConstraints()
        setupContentViewConstraints()
        setupCastProfileConstraints()
        setupCastNameConstraints()
        setupKnownForConstraints()
        setupOverviewConstraints()
        setupImageLabelConstraints()
        setupCastImagesConstraints()
        setupKnownForLabelConstraints()
        setupCastCreditConstraints()
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
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leftAnchor.constraint(equalTo: scrollView.leftAnchor),
            contentView.rightAnchor.constraint(equalTo: scrollView.rightAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
    }
    private func setupCastProfileConstraints() {
        NSLayoutConstraint.activate([
            castProfile.topAnchor.constraint(equalTo: contentView.topAnchor),
            castProfile.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            castProfile.widthAnchor.constraint(equalToConstant: 200),
            castProfile.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    private func setupCastNameConstraints() {
        NSLayoutConstraint.activate([
            castName.topAnchor.constraint(equalTo: castProfile.bottomAnchor, constant: 10),
            castName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            castName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5)
        ])
    }
    private func setupKnownForConstraints() {
        NSLayoutConstraint.activate([
            knownFor.topAnchor.constraint(equalTo: castName.bottomAnchor, constant: 5),
            knownFor.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5)
        ])
    }
    private func setupOverviewConstraints() {
        NSLayoutConstraint.activate([
            overview.topAnchor.constraint(equalTo: knownFor.bottomAnchor, constant: 10),
            overview.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            overview.widthAnchor.constraint(equalTo: contentView.widthAnchor)
        ])
    }
    private func setupImageLabelConstraints() {
        NSLayoutConstraint.activate([
            imageLabel.topAnchor.constraint(equalTo: overview.bottomAnchor, constant: 10),
            imageLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            imageLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
    private func setupCastImagesConstraints() {
        NSLayoutConstraint.activate([
            castImages.topAnchor.constraint(equalTo: imageLabel.bottomAnchor, constant: 10),
            castImages.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            castImages.heightAnchor.constraint(equalToConstant: 190)
        ])
    }
    private func setupKnownForLabelConstraints() {
        NSLayoutConstraint.activate([
            knownForLabel.topAnchor.constraint(equalTo: castImages.bottomAnchor, constant: 10),
            knownForLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            knownForLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
    private func setupCastCreditConstraints() {
        NSLayoutConstraint.activate([
            castCredit.topAnchor.constraint(equalTo: knownForLabel.bottomAnchor, constant: 10),
            castCredit.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            castCredit.heightAnchor.constraint(equalToConstant: 190),
            castCredit.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
        ])
    }
    
    func configCastData(type: DataType, data: Person) {
        self.title = data.name ?? ""
        castProfile.setImage(with: data.profilePath ?? "")
        castName.text = data.name ?? ""
        overview.text = data.biography ?? ""
        knownFor.text = data.knownForDepartement ?? ""
        (castImages as? CustomCollectionView)?.configContent(list: data.images?.profiles ?? [])
        
        switch type {
        case .castMovieCredit:
            (castCredit as? CustomCollectionView)?.configContent(list: data.movieCredit?.cast ?? [], delegate: presenter as? CollectionViewToPresenter)
        case .castTVShowCredit:
            (castCredit as? CustomCollectionView)?.configContent(list: data.tvCredit?.cast ?? [] , delegate: presenter as? CollectionViewToPresenter)
        default: break
        }
    }
}

extension CastDetailViewController: CastDetailPresenterToViewProtocol {
    func onFetchFailure(message: String) {
        DispatchQueue.main.async {
            self.showAlert(title: "CastDetail Error", message: message)
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
