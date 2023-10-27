//
//  CollectionView.swift
//  ChargeFlix
//
//  Created by Dhruv Ukani on 26/10/23.
//

import UIKit

struct ConfigLayout {
    let scrollDirection: UICollectionView.ScrollDirection
    let itemSize: CGSize
    let sectionInset: UIEdgeInsets
    let minimumLineSpaceing: CGFloat
    let minimumInteritemSpacing: CGFloat
}

// extend from UIView
// init with frame
class CollectionView: UICollectionView {
    var numsOfSection: Int = 0

    init(layout: ConfigLayout, sections: Int) {
        
        let collectionLayout = UICollectionViewFlowLayout()
        collectionLayout.scrollDirection = layout.scrollDirection
        collectionLayout.itemSize = layout.itemSize
        collectionLayout.sectionInset = layout.sectionInset
        collectionLayout.minimumLineSpacing = layout.minimumLineSpaceing
        collectionLayout.minimumInteritemSpacing = layout.minimumInteritemSpacing
        
        super.init(frame: .zero, collectionViewLayout: collectionLayout)
        super.showsHorizontalScrollIndicator = false
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
