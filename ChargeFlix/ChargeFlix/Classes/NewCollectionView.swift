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
    var populerList: PopularTVShowsList? 
   
    init(scrollDirection: UICollectionView.ScrollDirection) {
        super.init(frame: .zero)
        setupLayout(scrollDirection: scrollDirection)
        setupConstraint()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLayout(scrollDirection: UICollectionView.ScrollDirection) {
        let collectionLayout = UICollectionViewFlowLayout()
        collectionLayout.scrollDirection = scrollDirection
        collectionLayout.itemSize = CGSize(width: 120, height: 180)
        collectionLayout.minimumLineSpacing = 4
        collectionLayout.minimumInteritemSpacing = 4
        collectionLayout.sectionInset = UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1)
        
        collectionview = UICollectionView(frame: .zero, collectionViewLayout: collectionLayout)
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
    
    func configContent(list: PopularTVShowsList?) {
        self.populerList = list
    }
    
}

extension NewCollectionView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return populerList?.list?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifire, for: indexPath) as? CollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.configCellContent(title: populerList?.list?[indexPath.row].originalName ?? "",
                               posterPath: populerList?.list?[indexPath.row].posterPath ?? "")
        return cell
    }
}
