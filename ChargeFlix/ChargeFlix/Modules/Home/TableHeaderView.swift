//
//  TableHeaderView.swift
//  ChargeFlix
//
//  Created by Dhruv Ukani on 26/10/23.
//

import UIKit

class TableHeaderView: UIView {
    
    private var moviePoster: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleToFill
        return view
    }()
    
    private let genreCollectionView: UICollectionView = {
        let view = CollectionView(layout: ConfigLayout(scrollDirection: .horizontal, itemSize: CGSize(width: 50, height: 50), sectionInset: UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1), minimumLineSpaceing: 10, minimumInteritemSpacing: 10), sections: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.register(GenreCollectionCell.self, forCellWithReuseIdentifier: GenreCollectionCell.identifire)
        
        return view
    }()
    
    private var movieName: UILabel = UILabel().setLabel(text: "MovieName", textColor: .white, bgColor: nil, font: .boldSystemFont(ofSize: 20))
    
    private var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
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
        containerView.addSubview(genreCollectionView)
    }
    
    func configContent(title: String, poster: String) {
        movieName.text = title
        moviePoster.setImage(with: poster)
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
            moviePoster.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            
            movieName.leadingAnchor.constraint(equalTo: moviePoster.leadingAnchor),
            movieName.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -20)
        
        ])
    }
    
}
