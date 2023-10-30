//
//  genreCellCollectionViewCell.swift
//  ChargeFlix
//
//  Created by Dhruv Ukani on 27/10/23.
//

import UIKit

class GenreCollectionCell: UICollectionViewCell {
    static let identifire = GenreCollectionCell.description()

    private var genreLabel: UILabel = UILabel().setLabel(text: "", textColor: .white, bgColor: nil, font: AppTheme.genreButtonFont)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        contentView.addSubview(genreLabel)
    }
    
    private func setupConstraint() {
        NSLayoutConstraint.activate([
            genreLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            genreLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            genreLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            genreLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    func configCellContent(genre: String) {
        genreLabel.text = genre
    }
}
