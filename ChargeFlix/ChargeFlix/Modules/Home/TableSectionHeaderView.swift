//
//  TableSectionHeaderView.swift
//  ChargeFlix
//
//  Created by Dhruv Ukani on 26/10/23.
//

import UIKit

class TableSectionHeaderView: UIView {
    
    private var headerContentView: UIView = {
       let view = UIView()
       view.translatesAutoresizingMaskIntoConstraints = false
       return view
    }()
    
    private var sectionLabel: UILabel = UILabel().setLabel(text: "Section", 
                                                           textColor: .white,
                                                           bgColor: nil,
                                                           font: AppTheme.tableHeaderSectionLabelFont)
    
    private var showAllButton: UIButton = UIButton().setButton(type: .custom, 
                                                               title: "Show All",
                                                               font: AppTheme.tableHeaderSectionButtonFont)
   
    override init(frame: CGRect) {
        super.init(frame: frame)
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
       
        showAllButton.addTarget(self, action: #selector(TableSectionHeaderView.showAllButtonTapped), for: .touchUpInside)
    }
    
    private func setupDelegates() {
       
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
        print(showAllButton.tag)
    }
    
    func configContent(sectionTitle: String, section: Int) {
        sectionLabel.text = sectionTitle
        showAllButton.tag = section
    }
    
}
