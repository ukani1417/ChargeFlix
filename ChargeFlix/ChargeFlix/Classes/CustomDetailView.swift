//
//  CustomDetailView.swift
//  ChargeFlix
//
//  Created by Dhruv Ukani on 02/11/23.
//

import UIKit

struct CustomDetailViewModel {
    let title: String
    let genreList: String
    let stars: [String]
    let overView: String
    let stackData: [(String,String)]
    let posterPath: String
    let votes: String
    let videos: [Video]
    let cast: [ContentObject]
}

class CustomDetailView: UIView {
    
    private var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var poster: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleToFill
        return view
    }()
    
    private var overView: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.textAlignment = .left
        return label
    }()
    
    private var title: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 36)
        return label
    }()
    
    private var genreLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        return label
    }()
    
    private var votes: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    private var starStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.translatesAutoresizingMaskIntoConstraints = false
        view.distribution = .fill
        view.spacing = 5
        return view
    }()
    
    private var detailStack: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.translatesAutoresizingMaskIntoConstraints = false
        view.distribution = .fillProportionally
        view.spacing = 10
        return view
    }()
    
    private var videoHeading: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "VIDEOS"
        return view
    }()
    
    private var castHeading: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "CAST"
        return view
    }()
    
    private var youtubeVideoCollectionView: UIView = {
        let view = CustomCollectionView(scrollDirection: .horizontal, 
                                        cellSize: CGSize(width: 180, height: 120),
                                        cellClass: VideoCollectionCell.self,
                                        cellIdentifire: VideoCollectionCell.identifire)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.collectionview?.showsHorizontalScrollIndicator = false
        view.backgroundColor = .black
        return view
    }()
    
    private var castCollectionView: UIView = {
        let view = CustomCollectionView(scrollDirection: .horizontal,
                                        cellSize: CGSize(width: 130, height: 180),
                                        cellClass: CollectionViewCell.self,
                                        cellIdentifire: CollectionViewCell.identifire)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.collectionview?.showsHorizontalScrollIndicator = false
        view.backgroundColor = .black
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
        setupConstraints()
    }
    
    func setupUI() {
        addSubview(containerView)
        [poster, title, detailStack, genreLabel, starStackView, overView, 
         videoHeading, youtubeVideoCollectionView, castHeading, castCollectionView].forEach { view in
            containerView.addSubview(view)
        }
    }
    
    func setupConstraints() {
        setupContainerViewConstraints()
        setupPosterConstraints()
        setupTitleConstraints()
        setupDetailStackConstraints()
        setupGenreLabelConstraints()
        setupStarStackViewConstraints()
        setupOverViewConstraints()
        setupVideoHeadingConstraints()
        setupYoutubeVideoCollectionViewConstraints()
        setupCastHeadingConstraints()
        setupCastCollectionViewConstraints()
    }

    private func setupContainerViewConstraints() {
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.leftAnchor.constraint(equalTo: leftAnchor),
            containerView.rightAnchor.constraint(equalTo: rightAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    private func setupPosterConstraints() {
        NSLayoutConstraint.activate([
            poster.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 0),
            poster.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 0),
            poster.rightAnchor.constraint(equalTo: containerView.rightAnchor),
            poster.heightAnchor.constraint(equalToConstant: 250)
        ])
    }
    private func setupTitleConstraints() {
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: poster.bottomAnchor, constant: 5),
            title.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 5),
            title.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 0.60)
        ])
    }
    private func setupDetailStackConstraints() {
        NSLayoutConstraint.activate([
            detailStack.topAnchor.constraint(equalTo: poster.bottomAnchor, constant: 10),
            detailStack.rightAnchor.constraint(equalTo: containerView.rightAnchor),
            detailStack.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 0.38)
        ])
    }
    private func setupGenreLabelConstraints() {
        NSLayoutConstraint.activate([
            genreLabel.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 5),
            genreLabel.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 5)
        ])
    }
    private func setupStarStackViewConstraints() {
        NSLayoutConstraint.activate([
            starStackView.topAnchor.constraint(equalTo: genreLabel.bottomAnchor, constant: 10),
            starStackView.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 5),
            starStackView.heightAnchor.constraint(equalToConstant: 15)
        ])
    }
    private func setupOverViewConstraints() {
        NSLayoutConstraint.activate([
            overView.topAnchor.constraint(equalTo: starStackView.bottomAnchor, constant: 20),
            overView.widthAnchor.constraint(equalTo: containerView.widthAnchor)
        ])
    }
    private func setupVideoHeadingConstraints() {
        NSLayoutConstraint.activate([
            videoHeading.topAnchor.constraint(equalTo: overView.bottomAnchor, constant: 5),
            videoHeading.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 5)
        ])
    }
    private func setupYoutubeVideoCollectionViewConstraints() {
        NSLayoutConstraint.activate([
            youtubeVideoCollectionView.topAnchor.constraint(equalTo: videoHeading.bottomAnchor, constant: 5),
            youtubeVideoCollectionView.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 5),
            youtubeVideoCollectionView.rightAnchor.constraint(equalTo: containerView.rightAnchor),
            youtubeVideoCollectionView.heightAnchor.constraint(equalToConstant: 130)
        ])
    }
    private func setupCastHeadingConstraints() {
        NSLayoutConstraint.activate([
            castHeading.topAnchor.constraint(equalTo: youtubeVideoCollectionView.bottomAnchor, constant: 5),
            castHeading.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 5)
        ])
    }
    private func setupCastCollectionViewConstraints() {
        NSLayoutConstraint.activate([
            castCollectionView.topAnchor.constraint(equalTo: castHeading.bottomAnchor, constant: 5),
            castCollectionView.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 5),
            castCollectionView.rightAnchor.constraint(equalTo: containerView.rightAnchor),
            castCollectionView.heightAnchor.constraint(equalToConstant: 190),
            castCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
            ])
    }
    
    func configContent(data: CustomDetailViewModel, delegate: CollectionViewToPresenter? = nil) {
        DispatchQueue.main.async {
            self.overView.text = data.overView
            self.poster.setImage(with: data.posterPath)
            self.title.text = data.title
            self.genreLabel.text = data.genreList
            self.votes.text = "  \(data.votes)"
            self.configStarStack(stars: data.stars)
            self.configDetailsStack(data: data.stackData)
            (self.youtubeVideoCollectionView as? CustomCollectionView)?.configContent(list: data.videos)
            (self.castCollectionView as? CustomCollectionView)?.configContent(list: data.cast,
                                                                              delegate: delegate)
            
            if data.cast.isEmpty {
                self.castCollectionView.removeFromSuperview()
                self.castHeading.removeFromSuperview()
            }
            if data.videos.isEmpty {
                self.youtubeVideoCollectionView.removeFromSuperview()
                self.videoHeading.removeFromSuperview()
            }
        }
    }
    
    func configStarStack(stars: [String]) {
        for star in stars {
            let view = UIImageView(image: UIImage(named: star))
            view.translatesAutoresizingMaskIntoConstraints = false
            view.contentMode = .scaleToFill
            view.widthAnchor.constraint(equalToConstant: 15).isActive = true
            self.starStackView.addArrangedSubview(view)
        }
        self.starStackView.addArrangedSubview(votes)
    }
    
    private func configDetailsStack(data: [(String,String)]) {
        
        let imageStack: UIStackView = {
            let view =  UIStackView()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.axis = .vertical
            view.spacing = 10
            return view
        }()
        
        let labelStack: UIStackView = {
            let view =  UIStackView()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.axis = .vertical
            view.spacing = 10
            return view
        }()
        data.forEach { (image,data) in
            let imageView: UIImageView = {
                let view = UIImageView(frame: CGRect(x: 0, y: 0, width: 15, height: 15))
                view.translatesAutoresizingMaskIntoConstraints = false
                view.image = UIImage(named: image)
                view.contentMode = .scaleAspectFit
                
                return view
            }()
            
            let dataLabel: UILabel = {
                let view = UILabel(frame: .zero)
                view.translatesAutoresizingMaskIntoConstraints = false
                view.numberOfLines = 1
                view.textAlignment = .left
                view.text = data
                return view
            }()
            
            imageStack.addArrangedSubview(imageView)
            labelStack.addArrangedSubview(dataLabel)
        }
        detailStack.addArrangedSubview(imageStack)
        detailStack.addArrangedSubview(labelStack)
    }
}
