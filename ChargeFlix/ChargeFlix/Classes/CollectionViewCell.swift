//
//  CollectionViewCell.swift
//  ChargeFlix
//
//  Created by Dhruv Ukani on 26/10/23.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    static let identifire = CollectionViewCell.description()
    private var posterImage: UIImageView = {
       let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleToFill
        view.clipsToBounds = true
        view.layer.cornerRadius = 10
        return view
    }()
    
    private var movieTitle: UILabel = {
       let label = UILabel()
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 15)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .black
        setupUI()
        setupConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        contentView.addSubview(posterImage)
        contentView.addSubview(movieTitle)
    }
    
    private func setupConstraint() {
        NSLayoutConstraint.activate([
            posterImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            posterImage.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            posterImage.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            posterImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
//            movieTitle.topAnchor.constraint(equalTo: posterImage.bottomAnchor),
            movieTitle.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            movieTitle.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            movieTitle.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
            
        ])
    }
    
    func configCellContent(data: Codable) {
        switch data {
        case  is ContentObject :
            if let cellData = data as? ContentObject {
               
                movieTitle.text = cellData.originalTitle ?? cellData.originalName ?? ""
                posterImage.setImage(with: cellData.posterPath ?? "")
            }
            
        case  is Image:
            if let cellData = data as? Image {
                posterImage.setImage(with: cellData.filePath ?? "")
            }
            
        default: break
        }
    }
}
