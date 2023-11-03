//
//  Models.swift
//  ChargeFlix
//
//  Created by Dhruv Ukani on 20/10/23.
//

import Foundation
import UIKit
// MARK: - Movie
struct Movie: Codable {
    let id: Int?
    let adult: Bool?
    let backdropPath: String?
    let genres: [Genre]?
    let originalLanguage: String?
    let originalTitle: String?
    let overview: String?
    let popularity: Double?
    let posterPath: String?
    let releaseDate: String?
    let status: String?
    let title: String?
    let runtime: Int?
    let voteAverage: Double?
    let voteCount: Int?
    
    enum CodingKeys: String, CodingKey {
        case id, adult, genres, overview, popularity, status, title, runtime
        case backdropPath = "backdrop_path"
        case posterPath = "poster_path"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case releaseDate = "release_date"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
    
    func toCustomDetailView() -> CustomDetailViewModel {
        
        var genreList = ""
        self.genres?.forEach({ genre in
            genreList.append((genre.name ?? "") + " / ")
        })
        genreList.removeLast(2)
        
        let runtime: Int = self.runtime ?? 0
        let hour = runtime/60
        let minute = runtime - (60*hour)
        let hourString = ( hour < 10) ? "0\(hour)" : "\(hour)"
        let minuteString = ( minute < 10) ? "0\(minute)" : "\(minute)"
        
        return CustomDetailViewModel(title: self.originalTitle ?? "",
                                     genreList: genreList,
                                     halfStar: 0,
                                     fullStar: 5,
                                     overView: self.overview ?? "",
                                     stackData: [
                                        ("calendar",String(self.releaseDate ?? "") ),
                                        ("clock","\(hourString):\(minuteString) / \(runtime) min"),
                                        ("globe",self.originalLanguage ?? "")],
                                     posterPath: self.backdropPath ?? "",
                                     votes: String(self.voteCount ?? 0) + " Votes" )
    }
        
}

struct MovieList: Codable {
    let page: Int?
    let totalPages: Int?
    let totalResults: Int?
    let list: [MovieListObj]?
    
    enum CodingKeys: String, CodingKey {
        case page
        case totalPages = "total_pages"
        case totalResults = "total_results"
        case list = "results"
    }
    
    func toListObj() -> [ListObj] {
        return self.list?.map({ movie in
            return ListObj(id: movie.id, title: movie.originalTitle,
                           posterPath: movie.posterPath, backdropPath: movie.backdropPath,
                           genre: movie.genre, voteAverage: movie.voteAvarage,
                           voteCount: movie.voteCount)
        }) ?? []
    }
}

struct MovieListObj: Codable {
    let id: Int?
    let backdropPath: String?
    let posterPath: String?
    let originalTitle: String?
    let voteAvarage: Double?
    let voteCount: Int?
    let genre: [Int]?
    
    enum CodingKeys: String, CodingKey {
        case id
        case backdropPath = "backdrop_path"
        case posterPath = "poster_path"
        case originalTitle = "original_title"
        case voteCount = "vote_count"
        case voteAvarage = "vote_average"
        case genre = "genre_ids"
    }
}

struct MovieGenreList: Codable {
    let genres: [Genre]
}

struct Genre: Codable {
    let id: Int?
    let name: String?
}

struct Dates: Codable {
    let maximum, minimum: String?
}

// MARK: - TVShow
struct TVShow: Codable {
    let id: Int?
    let adult: Bool?
    let name: String?
    let backdropPath: String?
    let posterPath: String?
    let episodeRunTime: [Int]?
    let firstAirDate: String?
    let genres: [Genre]?
    let inProducation: Bool?
    let languages: [String]?
    let lastAirDate: String?
    let lastEpisodeToAir: Episode?
    let nextEpisodeToAir: Episode?
    let numberOfEpisodes: Int?
    let numberOfSeasons: Int?
    let originalLanguage: String?
    let overview: String?
    let originalName: String?
    let popularity: Double?
    let seasons: [Season]?
    let voteAverage: Double?
    let voteCount: Int?
    let status: String?
    let type: String?

    enum CodingKeys: String, CodingKey {
        case id, adult, genres, languages, name, overview, popularity, seasons, status, type
        case backdropPath = "backdrop_path"
        case posterPath = "poster_path"
        case episodeRunTime = "episode_run_time"
        case firstAirDate = "first_air_date"
        case inProducation = "in_production"
        case lastAirDate = "last_air_date"
        case lastEpisodeToAir = "last_episode_to_air"
        case nextEpisodeToAir = "next_episode_to_air"
        case numberOfEpisodes = "number_of_episodes"
        case numberOfSeasons = "number_of_seasons"
        case originalName = "original_name"
        case originalLanguage = "original_language"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
    
    func toCustomDetailView() -> CustomDetailViewModel {
        
        var genreList = ""
        self.genres?.forEach({ genre in
            genreList.append((genre.name ?? "") + " / ")
        })
        if genreList.count > 2 {
            genreList.removeLast(2)
        }
        
        return CustomDetailViewModel(title: self.originalName ?? "",
                                     genreList: genreList,
                                     halfStar: 0,
                                     fullStar: 5,
                                     overView: self.overview ?? "",
                                     stackData: [
                                        ("calendar",String(self.firstAirDate ?? "") ),
                                        ("tv.play","Episodes: \(self.numberOfEpisodes ?? 0)"),
                                        ("tv.play", "Seasons: \(self.numberOfSeasons ?? 0)")],
                                     posterPath: self.backdropPath ?? "",
                                     votes: String(self.voteCount ?? 0) + " Votes" )
    }
}

struct Episode: Codable {
    let id: Int?
    let showId: Int?
    let seasonNumber: Int?
    let episodeNumber: Int?
    let name: String?
    let overview: String?
    let runtime: Int?
    let voteAverage: Double?
    let voteCount: Int?
    let airDate: String?
    let episodeType: String?
    let stillPath: String?

    enum CodingKeys: String, CodingKey {
        case id, name, overview, runtime
        case showId = "show_id"
        case seasonNumber = "season_number"
        case episodeNumber = "episode_number"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        case airDate = "air_date"
        case episodeType = "episode_type"
        case stillPath = "still_path"
    }
}

struct Season: Codable {
    let id: Int?
    let name: String?
    let overview: String?
    let posterPath: String?
    let airDate: String?
    let episodeCount: Int?
    let seasonNumber: Int?
    let voteAverage: Double?
    
    enum CodingKeys: String, CodingKey {
        case id, name, overview
        case posterPath = "poster_path"
        case airDate = "air_date"
        case seasonNumber = "season_number"
        case episodeCount = "episode_count"
        case voteAverage = "vote_average"
        
    }
}

struct TVShowList: Codable {
    let page: Int?
    let totalPages: Int?
    let totalResults: Int?
    let list: [TVShowListObj]?
    
    enum CodingKeys: String, CodingKey {
        case page
        case totalPages = "total_pages"
        case totalResults = "total_results"
        case list = "results"
    }
    
    func toListObj() -> [ListObj] {
        return self.list?.map({ show in
            return ListObj(id: show.id, title: show.originalName,
                           posterPath: show.posterPath, backdropPath: show.backdropPath,
                           genre: show.genre, voteAverage: show.voteAverage,
                           voteCount: show.voteCount)
        }) ?? []
    }
}

struct TVShowListObj: Codable {
    let id: Int?
    let backdropPath: String?
    let posterPath: String?
    let originalName: String?
    let genre: [Int]?
    let voteAverage: Double?
    let voteCount: Int?
    enum CodingKeys: String, CodingKey {
        case id
        case backdropPath = "backdrop_path"
        case posterPath = "poster_path"
        case originalName = "original_name"
        case genre = "genre_ids"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}

// MARK: - Cast

struct Person: Codable {
    let id: Int?
    let adult: Bool?
    let biography: String?
    let gender: Int?
    let name: String?
    let knownForDepartement: String?
    let profilePath: String?
    
    enum CodingKeys: String, CodingKey {
        case id, adult, biography, name, gender
        case knownForDepartement = "known_for_department"
        case profilePath = "profile_path"
    }
}

struct TVShowCast: Codable {
    let id: Int?
    let cast: [Person]?
    let crew: [Person]?
    
    func getListObj() -> [ListObj] {
        return self.cast?.map({ person in
            return ListObj(id: person.id, title: person.name,
                           posterPath: person.profilePath, backdropPath: person.profilePath,
                           genre: nil, voteAverage: nil,
                           voteCount: nil)
        }) ?? []
    }
}

struct MovieCast: Codable {
    let id: Int?
    let cast: [Person]?
    let crew: [Person]?
    
    func getListObj() -> [ListObj] {
        return self.cast?.map({ person in
            return ListObj(id: person.id, title: person.name,
                           posterPath: person.profilePath, backdropPath: person.profilePath,
                           genre: nil, voteAverage: nil,
                           voteCount: nil)
        }) ?? []
    }
    
}

struct KnownForMovie: Codable {
    let id: Int?
    let cast: [MovieListObj]?
    let crew: [MovieListObj]?
    
    enum CodingKeys: String, CodingKey {
        case id, cast, crew
    }
    
    func toListObj() -> [ListObj] {
        return self.cast?.map({ show in
            return ListObj(id: show.id, title: show.originalTitle,
                           posterPath: show.posterPath, backdropPath: show.backdropPath,
                           genre: show.genre, voteAverage: show.voteAvarage,
                           voteCount: show.voteCount)
        }) ?? []
    }
    
}

struct KnownForTVShow: Codable {
    let id: Int?
    let cast: [TVShowListObj]?
    let crew: [TVShowListObj]?
    
    enum CodingKeys: String, CodingKey {
        case id, cast, crew
    }
    
    func toListObj() -> [ListObj] {
        return self.cast?.map({ show in
            return ListObj(id: show.id, title: show.originalName,
                           posterPath: show.posterPath, backdropPath: show.backdropPath,
                           genre: show.genre, voteAverage: show.voteAverage,
                           voteCount: show.voteCount)
        }) ?? []
    }
}

struct PersonImages: Codable {
    let id: Int?
    let profiles: [Image]?

    enum CodingKeys: String, CodingKey {
        case id, profiles
    }
    
    func toListObj() -> [ListObj] {
        return self.profiles?.map { image in
            return ListObj(id: self.id, title: "", 
                           posterPath: image.filePath,
                           backdropPath: image.filePath, 
                           genre: nil, 
                           voteAverage: nil,
                           voteCount: nil)
        } ?? []
    }
    
}

struct Image: Codable {
    let filePath: String?
    
    enum CodingKeys: String, CodingKey {
        case filePath = "file_path"
    }
}
