//
//  NewCollectionView.swift
//  ChargeFlix
//
//  Created by Dhruv Ukani on 30/10/23.
//

import Foundation
import UIKit

protocol CollectionViewToPresenter {
    func didSelectItemAt(indexPath: IndexPath)
}

class NewCollectionView: UIView {
    var collectionview: UICollectionView?
    var layout: UICollectionViewFlowLayout?
    var cellClass: AnyClass
    var cellIdentifire: String
    var cellSize: CGSize
    var list: [ListObj] = []
    var delegate: CollectionViewToPresenter? 
   
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
        layout?.scrollDirection = scrollDirection
        layout?.itemSize = cellSize
        layout?.collectionView?.showsVerticalScrollIndicator = false
        layout?.collectionView?.showsHorizontalScrollIndicator = false
    }
    
    func setupCollectionView() {
        collectionview = UICollectionView(frame: .zero, collectionViewLayout: layout ?? UICollectionViewFlowLayout())
        collectionview?.delegate = self
        collectionview?.dataSource = self
        collectionview?.register(cellClass,
                                 forCellWithReuseIdentifier: cellIdentifire)
        collectionview?.translatesAutoresizingMaskIntoConstraints = false
        collectionview?.backgroundColor = .black
        self.addSubview(collectionview ?? UICollectionView())
    }

    private func setupConstraint() {
        collectionview?.topAnchor.constraint(equalTo: topAnchor).isActive = true
        collectionview?.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        collectionview?.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        collectionview?.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    func configContent(list: [ListObj], delegate: CollectionViewToPresenter? = nil) {
        self.list = list
        self.delegate = delegate
        self.collectionview?.reloadData()
    }
    
}

extension NewCollectionView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, 
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifire, 
                                                      for: indexPath)
        
        switch cellIdentifire {
        case CollectionViewCell.identifire:
            guard let cell = cell as? CollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.configCellContent(data: list[indexPath.row])
            
        default: return UICollectionViewCell()
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.didSelectItemAt(indexPath: indexPath)
    }

}
