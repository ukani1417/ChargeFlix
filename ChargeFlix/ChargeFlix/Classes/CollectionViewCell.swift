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
        return view
    }()
    
    private var movieTitle: UILabel = UILabel().setLabel(text: "Name",
                                                textColor: .white,
                                                bgColor: nil,
                                                font: AppTheme.cellLabelFont)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        
        contentView.addSubview(posterImage)
        contentView.addSubview(movieTitle)
        movieTitle.textAlignment = .left
    }
    
    private func setupConstraint() {
        
        NSLayoutConstraint.activate([
            
            posterImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            posterImage.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            posterImage.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            posterImage.heightAnchor.constraint(equalToConstant: contentView.frame.height - 20),
            
            movieTitle.topAnchor.constraint(equalTo: posterImage.bottomAnchor),
            movieTitle.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            movieTitle.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            movieTitle.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    func configCellContent(title: String, posterPath: String) {
        movieTitle.text = " \(title)"
        posterImage.setImage(with: posterPath)
    }
}
