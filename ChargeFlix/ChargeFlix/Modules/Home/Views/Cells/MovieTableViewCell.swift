//
//  MovieTableViewCell.swift
//  ChargeFlix
//
//  Created by Dhruv Ukani on 26/10/23.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
    static let identifire = MovieTableViewCell.description()
    
    var type: String = ""
    var moviessCollectionView: CustomCollectionView = {
        let cView = CustomCollectionView(scrollDirection: .horizontal,
                                      cellSize: CGSize(width: 130, height: 180),
                                      cellClass: CollectionViewCell.self,
                                      cellIdentifire: CollectionViewCell.identifire)
        cView.translatesAutoresizingMaskIntoConstraints = false
        cView.collectionview?.showsHorizontalScrollIndicator = false
        return cView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        setupConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        contentView.addSubview(moviessCollectionView)
    }
    
    func configContent(data: [ListObj], delegate: CollectionViewToPresenter?) {
        self.moviessCollectionView.configContent(list: data, delegate: delegate)
    }
    
    private func setupConstraint() {
        NSLayoutConstraint.activate([
            moviessCollectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
            moviessCollectionView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            moviessCollectionView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            moviessCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
