//
//  NewCollectionView.swift
//  ChargeFlix
//
//  Created by Dhruv Ukani on 30/10/23.
//

import Foundation
import UIKit

class NewCollectionView: UIView {
    var collectionview: UICollectionView!
    var layout: UICollectionViewFlowLayout!
    var cellClass: AnyClass
    var cellIdentifire: String
    var cellSize: CGSize
    var list: [Codable] = []
   
    init(scrollDirection: UICollectionView.ScrollDirection, cellSize: CGSize, 
         cellClass: AnyClass, cellIdentifire: String) {
        self.cellClass = cellClass
        self.cellIdentifire = cellIdentifire
        self.cellSize = cellSize
        super.init(frame: .zero)
        setupLayout(scrollDirection: scrollDirection)
        setupCollectionView()
        setupConstraint()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLayout(scrollDirection: UICollectionView.ScrollDirection) {
        layout = UICollectionViewFlowLayout()
        layout.scrollDirection = scrollDirection
        layout.itemSize = cellSize
        layout.minimumLineSpacing = 2
        layout.minimumInteritemSpacing = 2
        layout.sectionInset = UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1)
    }
    
    func setupCollectionView() {
        collectionview = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionview?.delegate = self
        collectionview?.dataSource = self
        collectionview?.register(cellClass,
                                 forCellWithReuseIdentifier: cellIdentifire)
        collectionview.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(collectionview)
    }

    private func setupConstraint() {
        NSLayoutConstraint.activate([
            collectionview.topAnchor.constraint(equalTo: topAnchor),
            collectionview.leftAnchor.constraint(equalTo: leftAnchor),
            collectionview.rightAnchor.constraint(equalTo: rightAnchor),
            collectionview.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func configContent(list: [Codable]) {
        self.list = list
    }
    
}

extension NewCollectionView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, 
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifire, for: indexPath)
        switch cellIdentifire {
        case CollectionViewCell.identifire:
            guard let cell = cell as? CollectionViewCell else {
                return UICollectionViewCell()
            }
            if let data = list as? [ListObj] {
                cell.configCellContent(title: data[indexPath.row].title ?? "",
                                       posterPath: data[indexPath.row].posterPath ?? "")
            }
        case GenreCollectionCell.identifire:
            guard let cell = cell as? GenreCollectionCell else {
                return UICollectionViewCell()
            }
            if let data = list as? [Genre] {
                cell.configCellContent(genre: data[indexPath.row].name ?? "")
            }
        default: return UICollectionViewCell()
        }
        return cell
    }
}
