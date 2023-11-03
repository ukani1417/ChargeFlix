//
//  VideoCollectionCell.swift
//  ChargeFlix
//
//  Created by Dhruv Ukani on 02/11/23.
//

import UIKit
import WebKit

class VideoCollectionCell: UICollectionViewCell {
    
    static let identifire = VideoCollectionCell.description()
    
    private lazy var webView: WKWebView = {
        let webView = WKWebView()
        webView.translatesAutoresizingMaskIntoConstraints = false
        return webView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupConstaint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        contentView.addSubview(webView)
    }
    
    private func setupConstaint() {
        NSLayoutConstraint.activate([
            webView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            webView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            webView.topAnchor.constraint(equalTo: contentView.topAnchor),
            webView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    func configCellContent(data: Codable) {
        guard let data = data as? String else { return }
        guard let youTubeURL = URL(string: "\(Constants.youtubeBasePath)\(data)?modestbranding=1") else { return }
        webView.load(URLRequest(url: youTubeURL))
    }
}
