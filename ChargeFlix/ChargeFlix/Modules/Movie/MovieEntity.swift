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

struct GenreList: Codable {
    let genres: [Genre]
}

struct Genre: Codable {
    let id: Int?
    let name: String?
}

struct DetailModel: Codable {
    let id: Int?
    let backdropPath: String?
    let genres: [Genre]?
    let originalTitle: String?
    let originalName: String?
    let overview: String?
    let posterPath: String?
    let releaseDate: String?
    let firstAirDate: String?
    let runtime: Int?
    let voteAverage: Double?
    let voteCount: Int?
    let spokenLanguage: [SpokenLanguage]?
    let videos: ContentVideos
    let numberOfEpisodes: Int?
    let numberOfSeasons: Int?
    let credits: CastCredit?
    
    enum CodingKeys: String, CodingKey {
        case id, genres, overview, runtime, videos, credits
        case firstAirDate = "first_air_date"
        case backdropPath = "backdrop_path"
        case posterPath = "poster_path"
        case originalTitle = "original_title"
        case releaseDate = "release_date"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        case spokenLanguage = "spoken_languages"
        case numberOfEpisodes = "number_of_episodes"
        case numberOfSeasons = "number_of_seasons"
        case originalName = "original_name"
    }
    
    func toCustomDetailView(type: DataType) -> CustomDetailViewModel {
        let title = (type == .movieDetail) ? self.originalTitle : self.originalName
        return CustomDetailViewModel(title: title ?? "",
                                     genreList: self.getGenrelist(),
                                     stars: getRating(),
                                     overView: self.overview ?? "",
                                     stackData: getReleaseData(type: type),
                                     posterPath: self.backdropPath ?? "",
                                     votes: String(self.voteCount ?? 0) + " Votes",
                                     videos: self.videos.results ,
                                     cast: getCast())
    }
    
    func getCast() -> [ContentObject] {
        return self.credits?.cast?.map({ person in
            return ContentObject(id: person.id,
                                 posterPath: person.profilePath,
                                 originalName: person.name,
                                 originalTitle: person.name,
                                 genres: nil)
        }) ?? []
    }
    
    func getGenrelist() -> String {
        var genreList = ""
        self.genres?.forEach({ genre in
            genreList.append((genre.name ?? "") + " / ")
        })
        if genreList.count > 2 {
            genreList.removeLast(2)
        }
        return genreList
    }
    
    func getReleaseData(type: DataType) -> [(String,String)] {
        switch type {
        case .movieDetail:
            
            let runtime: Int = self.runtime ?? 0
            let hour = runtime/60
            let minute = runtime - (60*hour)
            let runtimeString = (( hour < 10) ? "0\(hour)" : "\(hour)",( minute < 10) ? "0\(minute)" : "\(minute)")
            return [("calendar",getDateString(date: self.releaseDate ?? "")),
                    ("clock","\(runtimeString.0):\(runtimeString.1)/ \(runtime) min"),
                    ("globe", "\(self.spokenLanguage?.first?.englishName ?? "English")")]
        case .tvShowDetail:
            return [("calendar",String(self.firstAirDate ?? "") ),
                    ("tv.play","Episodes: \(self.numberOfEpisodes ?? 0)"),
                    ("tv.play", "Seasons: \(self.numberOfSeasons ?? 0)")]
        default:  return []
        }
    }
    
    func getDateString(date: String) -> String {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "YYYY-mm-dd"
        guard let getDate = dateFormater.date(from: date) else { return "" }
        dateFormater.dateStyle = .medium
        return dateFormater.string(from: getDate)
    }
    
    func getRating() -> [String] {
        let voteaverage = ((self.voteAverage ?? 0.0)/2.0)
        let rounded: Double = voteaverage.rounded(.down)
        let fullStar: Int = Int(rounded)
        let halfStar: Int = (rounded < voteaverage && rounded != 5) ? 1 : 0
        
        if fullStar == 5 {
            return [String](repeating: "start.fill", count: 5)
        } else {
            var stars = [String](repeating: "star", count: 5)
            for index in 0..<fullStar {
                stars[index] = "star.fill"
            }
            if halfStar == 1 {
                stars[fullStar-1] = "star.half.filled"
            }
            return stars
        }
    }
    
}

struct ContentVideos: Codable {
    let results: [Video]
}
struct Video: Codable {
    let keyPath: String?
    let name: String?
    enum CodingKeys: String, CodingKey {
        case name
        case keyPath = "key"
    }
}
struct SpokenLanguage: Codable {
    let englishName: String?
    
    enum CodingKeys: String, CodingKey {
        case englishName = "english_name"
    }
}
