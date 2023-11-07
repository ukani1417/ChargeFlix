//
//  TableHeaderView.swift
//  ChargeFlix
//
//  Created by Dhruv Ukani on 26/10/23.
//

import UIKit
import Kingfisher

protocol TableHeaderViewToViewController {
    func filterDataUsingGenre(index: Int)
}

class TableHeaderView: UIView {
    var delegate: TableHeaderViewToViewController?
    
    private var genreList: [Genre] = [Genre(id: -1, name: "All")]
    
    private var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var moviePoster: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleToFill
        return view
    }()
        
    private var genreCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 100, height: 30)
        
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.register(GenreCollectionCell.self, forCellWithReuseIdentifier: GenreCollectionCell.identifire)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.showsHorizontalScrollIndicator = false
        view.backgroundColor = .black
        return view
    }()
    
    private var movieName: UILabel = {
        let label = UILabel()
         label.numberOfLines = 1
         label.translatesAutoresizingMaskIntoConstraints = false
         label.textColor = .white
        label.font = .boldSystemFont(ofSize: 36)
         return label
    }()
    
    private var stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.translatesAutoresizingMaskIntoConstraints = false
        view.distribution = .fill
        view.spacing = 5
        return view
    }()
    
    private var votes: UILabel = {
        let label = UILabel()
         label.numberOfLines = 1
         label.translatesAutoresizingMaskIntoConstraints = false
         label.textColor = .white
        label.textAlignment = .center
        return label
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
        addSubview(containerView)
        containerView.addSubview(moviePoster)
        containerView.addSubview(movieName)
        containerView.addSubview(stackView)
        containerView.addSubview(votes)
        containerView.addSubview(genreCollectionView)
        genreCollectionView.delegate = self
        genreCollectionView.dataSource = self
    }

    func addStarToStack(stars: [String]) {
        for star in stars {
            let view = UIImageView(image: UIImage(named: star))
            view.translatesAutoresizingMaskIntoConstraints = false
            view.contentMode = .scaleToFill
            view.widthAnchor.constraint(equalToConstant: 15).isActive = true
            self.stackView.addArrangedSubview(view)
        }
        self.stackView.addArrangedSubview(votes)
    }
    
    private func setupConstraint() {
        setupContainerViewConstraint()
        setupMoviePosterConstraint()
        setupMovieNameConstraint()
        setupStackViewConstraint()
        setupGenericCollectionViewConstraint()
    }
    
    private func setupContainerViewConstraint() {
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.leftAnchor.constraint(equalTo: leftAnchor),
            containerView.rightAnchor.constraint(equalTo: rightAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func setupMoviePosterConstraint() {
        NSLayoutConstraint.activate([
            moviePoster.topAnchor.constraint(equalTo: containerView.topAnchor),
            moviePoster.leftAnchor.constraint(equalTo: containerView.leftAnchor),
            moviePoster.rightAnchor.constraint(equalTo: containerView.rightAnchor),
            moviePoster.heightAnchor.constraint(equalToConstant: 250)
            
        ])
    }
    
    private func setupMovieNameConstraint() {
        NSLayoutConstraint.activate([
            movieName.topAnchor.constraint(equalTo: moviePoster.bottomAnchor, constant: -40),
            movieName.leftAnchor.constraint(equalTo: containerView.leftAnchor),
            movieName.bottomAnchor.constraint(equalTo: moviePoster.bottomAnchor)
        ])
    }
    
    private func setupStackViewConstraint() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: moviePoster.bottomAnchor, constant: 10),
            stackView.leftAnchor.constraint(equalTo: containerView.leftAnchor),
            stackView.heightAnchor.constraint(equalToConstant: 15)
        ])
    }
    
    private func setupGenericCollectionViewConstraint() {
        NSLayoutConstraint.activate([
            genreCollectionView.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 5),
            genreCollectionView.leftAnchor.constraint(equalTo: containerView.leftAnchor),
            genreCollectionView.rightAnchor.constraint(equalTo: containerView.rightAnchor),
            genreCollectionView.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    func configContent(input: TableHeaderInput) {
        movieName.text = input.title
        moviePoster.setImage(with: input.poster)
        votes.text = "   \(String(input.votes))"
        addStarToStack(stars: input.starts)
    }
    func configGenreList(genreList: [Genre]) {
        DispatchQueue.main.async {
            self.genreList.append(contentsOf: genreList)
            self.genreCollectionView.reloadData()
        }
    }
}

extension TableHeaderView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, 
                        numberOfItemsInSection section: Int) -> Int {
        return genreList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, 
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: GenreCollectionCell.identifire,
            for: indexPath) as? GenreCollectionCell else {
            return UICollectionViewCell()
        }
        cell.configCellContent(genre: genreList[indexPath.row].name ?? "")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, 
                        didSelectItemAt indexPath: IndexPath) {
        delegate?.filterDataUsingGenre(index: indexPath.row)
    }
    
}
