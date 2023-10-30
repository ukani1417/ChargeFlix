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
    var list: [ListObj] = []
   
    init(scrollDirection: UICollectionView.ScrollDirection) {
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
        layout.itemSize = CGSize(width: 130, height: 180)
        layout.minimumLineSpacing = 2
        layout.minimumInteritemSpacing = 2
        layout.sectionInset = UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1)
        
    }
    
    func setupCollectionView() {
        collectionview = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionview?.delegate = self
        collectionview?.dataSource = self
        collectionview?.register(CollectionViewCell.self,
                                 forCellWithReuseIdentifier: CollectionViewCell.identifire)
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
    
    func configContent(list: [ListObj]) {
        self.list = list
    }
    
}

extension NewCollectionView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if list.isEmpty {
            return 0
        }
        return list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifire, for: indexPath) as? CollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.configCellContent(title: list[indexPath.row].title ?? "",
                               posterPath: list[indexPath.row].posterPath ?? "")
        return cell
    }
}
