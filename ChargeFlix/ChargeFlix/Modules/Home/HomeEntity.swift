//
//  HomeEntity.swift
//  ChargeFlix
//
//  Created by Dhruv Ukani on 25/10/23.
//

import Foundation

struct GenreList: Codable {
    let list: [Genre]
}

struct MovieList: Codable {
    var populerMovies: PopularMoviesList
    var topRatedMovies: TopRatedMoviesList
    var upcomingMovies: UpcomingMoviesList
    var nowPlayingMovies: NowPlayingMoviesList
}
