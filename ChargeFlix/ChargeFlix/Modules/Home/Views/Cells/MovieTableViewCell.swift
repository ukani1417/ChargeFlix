//
//  MovieTableViewCell.swift
//  ChargeFlix
//
//  Created by Dhruv Ukani on 26/10/23.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
    static let identifire = MovieTableViewCell.description()
    
    var viewController: MovieTableCellToView?
    
    var sectionForCollection: Int = 0
    
    private  var movieCollectionView = {
        let view =  CollectionView(
            layout: ConfigLayout(scrollDirection: .horizontal,
                                 itemSize: CGSize(width: 100, height: 200),
                                 sectionInset: UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1),
                                 minimumLineSpaceing: 10,
                                 minimumInteritemSpacing: 1),
            sections: 1
        )
        view.translatesAutoresizingMaskIntoConstraints = false
        view.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.identifire)
        return view
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
        contentView.addSubview(movieCollectionView)
        movieCollectionView.dataSource = self
        movieCollectionView.delegate = self
        
    }
    
    private func setupConstraint() {
        NSLayoutConstraint.activate([
            movieCollectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
            movieCollectionView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            movieCollectionView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            movieCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
}

extension MovieTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return viewController?.numsOfSectionInCollection(sectionForCollection: self.sectionForCollection) ?? 0
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewController?.numsOfRowsCollectionSection(section: section, sectionForCollection: self.sectionForCollection) ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return viewController?.setupCollectionCell(collectionView: collectionView, indexPath: indexPath, sectionForCollection: self.sectionForCollection) ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewController?.didselectItemAt(indexPath: indexPath)
    }
}
