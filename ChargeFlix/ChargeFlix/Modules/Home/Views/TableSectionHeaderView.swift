//
//  TableSectionHeaderView.swift
//  ChargeFlix
//
//  Created by Dhruv Ukani on 26/10/23.
//

import UIKit

protocol TableSectionHeaderViewToPresenter {
    func showAll(section: Int)
}
class TableSectionHeaderView: UIView {
    
    var delegate: TableSectionHeaderViewToPresenter? 
    
    private var headerContentView: UIView = {
       let view = UIView()
       view.translatesAutoresizingMaskIntoConstraints = false
       return view
    }()
    
    private var sectionLabel: UILabel = {
        let label = UILabel()
         label.numberOfLines = 1
         label.translatesAutoresizingMaskIntoConstraints = false
         label.textColor = .white
         return label
    }()
    
    private var showAllButton: UIButton = {
       let button = UIButton()
        button.setTitle("Show All", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.white, for: .normal)
        return button
    }()
   
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .black
        setupUI()
        setupConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubview(headerContentView)
        headerContentView.addSubview(sectionLabel)
        headerContentView.addSubview(showAllButton)
       
        showAllButton.addTarget(self, 
                                action: #selector(TableSectionHeaderView.showAllButtonTapped),
                                for: .touchUpInside)
    }
    
    private func setupConstraint() {
        
        NSLayoutConstraint.activate([
            headerContentView.topAnchor.constraint(equalTo: topAnchor),
            headerContentView.leftAnchor.constraint(equalTo: leftAnchor),
            headerContentView.rightAnchor.constraint(equalTo: rightAnchor),
            headerContentView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            sectionLabel.topAnchor.constraint(equalTo: headerContentView.topAnchor),
            sectionLabel.bottomAnchor.constraint(equalTo: headerContentView.bottomAnchor),
            sectionLabel.leadingAnchor.constraint(equalTo: headerContentView.leadingAnchor, constant: 15),
            
            showAllButton.topAnchor.constraint(equalTo: headerContentView.topAnchor),
            showAllButton.bottomAnchor.constraint(equalTo: headerContentView.bottomAnchor),
            showAllButton.trailingAnchor.constraint(equalTo: headerContentView.trailingAnchor, constant: -15)
        ])
    }
    
    @objc private func showAllButtonTapped() {
        delegate?.showAll(section: showAllButton.tag)
    }
    
    func configContent(sectionTitle: String, section: Int, delegate: TableSectionHeaderViewToPresenter? ) {
        sectionLabel.text = sectionTitle
        showAllButton.tag = section
        self.delegate =  delegate
    }
    
}
