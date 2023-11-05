//
//  MovieEntity.swift
//  ChargeFlix
//
//  Created by Dhruv Ukani on 25/10/23.
//

import Foundation

enum MoviePresenterError: String, Error {
    case failedInPopularMovies = "Failed in fetching popular movies"
    case failedInMovieDetail = "Failed in fetching movieDetail"
}
