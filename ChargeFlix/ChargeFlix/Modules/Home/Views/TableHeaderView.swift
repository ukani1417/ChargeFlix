//
//  TableHeaderView.swift
//  ChargeFlix
//
//  Created by Dhruv Ukani on 26/10/23.
//

import UIKit
import Kingfisher

class TableHeaderView: UIView {
    
    var delegate: MovieHeaderViewToView?
    
    private var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var moviePoster: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleToFill
        return view
    }()
    
    private let genreCollectionView: UICollectionView = {
        let view = CollectionView(layout: ConfigLayout(scrollDirection: .horizontal, itemSize: CGSize(width: 100, height: 50), sectionInset: UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1), minimumLineSpaceing: 10, minimumInteritemSpacing: 10), sections: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.register(GenreCollectionCell.self, forCellWithReuseIdentifier: GenreCollectionCell.identifire)
        
        return view
    }()
    
    private var movieName: UILabel = UILabel().setLabel(text: "MovieName", textColor: .white, bgColor: nil, font: AppTheme.tableHeaderMovieLableFont)
    
    private var stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.translatesAutoresizingMaskIntoConstraints = false
        view.distribution = .fillEqually
        view.spacing = 5
        
        return view
    }()
    
    private var votes: UILabel = UILabel().setLabel(text: "0", textColor: AppTheme.votesLabelTextColot, bgColor: nil, font: AppTheme.votesLabelFont)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupConstraint()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubview(containerView)
        containerView.addSubview(moviePoster)
        containerView.addSubview(movieName)
        containerView.addSubview(stackView)
        containerView.addSubview(votes)
        containerView.addSubview(genreCollectionView)
        
        genreCollectionView.dataSource = self
        genreCollectionView.delegate = self
    }
    
    func configContent(title: String, poster: String, votes: String, fullStar: Int, halfStar: Int) {
        movieName.text = title
        moviePoster.setImage(with: poster)
        self.votes.text = String(votes)
        addStarToStack(fullStar: fullStar, halfStar: halfStar)
    }
    
    func addStarToStack(fullStar: Int, halfStar: Int) {
        DispatchQueue.main.async {
            for _ in 1...fullStar {
                let view = UIImageView(image: UIImage(named: "star.fill"))
                view.translatesAutoresizingMaskIntoConstraints = false
                view.contentMode = .scaleToFill
                view.widthAnchor.constraint(equalToConstant: 15).isActive = true
                self.stackView.addArrangedSubview(view)
            }
            
            if halfStar == 1 {
                let view = UIImageView(image: UIImage(named: "star.half.filled"))
                view.translatesAutoresizingMaskIntoConstraints = false
                view.contentMode = .scaleToFill
                view.widthAnchor.constraint(equalToConstant: 15).isActive = true
                self.stackView.addArrangedSubview(view)
            }
        }
        
    }
    
    private func setupConstraint() {
        NSLayoutConstraint.activate([
            
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.leftAnchor.constraint(equalTo: leftAnchor),
            containerView.rightAnchor.constraint(equalTo: rightAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            moviePoster.topAnchor.constraint(equalTo: containerView.topAnchor),
            moviePoster.leftAnchor.constraint(equalTo: containerView.leftAnchor),
            moviePoster.rightAnchor.constraint(equalTo: containerView.rightAnchor),
            moviePoster.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -55),
            moviePoster.heightAnchor.constraint(equalToConstant: 245),
            
            movieName.topAnchor.constraint(equalTo: moviePoster.bottomAnchor, constant: -45),
            movieName.leftAnchor.constraint(equalTo: containerView.leftAnchor),
            
            stackView.topAnchor.constraint(equalTo: moviePoster.bottomAnchor, constant: 10),
            stackView.leftAnchor.constraint(equalTo: containerView.leftAnchor),
            stackView.heightAnchor.constraint(equalToConstant: 15),
            
            votes.topAnchor.constraint(equalTo: moviePoster.bottomAnchor, constant: 10),
            votes.leftAnchor.constraint(equalTo: stackView.rightAnchor, constant: 10),
            votes.widthAnchor.constraint(equalToConstant: 70),
            votes.centerYAnchor.constraint(equalTo: stackView.centerYAnchor),

            genreCollectionView.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 5),
            genreCollectionView.leftAnchor.constraint(equalTo: containerView.leftAnchor),
            genreCollectionView.rightAnchor.constraint(equalTo: containerView.rightAnchor),
            genreCollectionView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -5)
        
        ])
    }
    
}

extension TableHeaderView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return delegate?.numsOfRowsInGenreCollection(section: section) ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return delegate?.setupGenreCollectionCell(collectionView: collectionView, indexPath: indexPath) ?? UICollectionViewCell()
    }
}
