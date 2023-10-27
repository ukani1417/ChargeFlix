//
//  genreCellCollectionViewCell.swift
//  ChargeFlix
//
//  Created by Dhruv Ukani on 27/10/23.
//

import UIKit

class GenreCollectionCell: UICollectionViewCell {
    static let identifire = GenreCollectionCell.description()

    private var genreButton: UIButton = UIButton().setButton(type: .roundedRect, title: "Genre", font: AppTheme.genreButtonFont)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        contentView.addSubview(genreButton)
    }
    
    private func setupConstraint() {
        NSLayoutConstraint.activate([
            genreButton.topAnchor.constraint(equalTo: contentView.topAnchor),
            genreButton.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            genreButton.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            genreButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    func configCellContent(genre: String) {
        genreButton.setTitle(genre, for: .normal)
    }
}
