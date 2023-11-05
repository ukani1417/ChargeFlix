//
//  Models.swift
//  ChargeFlix
//
//  Created by Dhruv Ukani on 20/10/23.
//

import Foundation
import UIKit

struct GenreList: Codable {
    let genres: [Genre]
}

struct CommonListModel: Codable {
    let page: Int?
    let totalPages: Int?
    let totalResults: Int?
    let results: [ContentObject]
    
    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

struct ContentObject: Codable {
    let id: Int?
    let posterPath: String?
    let originalName: String?
    let originalTitle: String?
    let genres: [Int]?
    
    enum CodingKeys: String, CodingKey {
        case id
        case posterPath = "poster_path"
        case originalName = "original_name"
        case originalTitle = "original_title"
        case genres = "genre_ids"
    }
}

struct Cast: Codable {
    let id: Int?
    let cast: [Person]?

}

struct Genre: Codable {
    let id: Int?
    let name: String?
}

struct Person: Codable {
    let id: Int?
    let biography: String?
    let name: String?
    let knownForDepartement: String?
    let profilePath: String?
    let images: Profile?
    let tvCredit: Credit?
    let movieCredit: Credit?
    
    enum CodingKeys: String, CodingKey {
        case id, biography, name, images
        case knownForDepartement = "known_for_department"
        case profilePath = "profile_path"
        case tvCredit = "tv_credits"
        case movieCredit = "movie_credits"
    }
    
}

struct Profile: Codable {
    let profiles: [Image]
}

struct Credit: Codable {
    let id: Int?
    let cast: [ContentObject]?
}

struct CastCredit: Codable {
    let cast: [Person]?
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
            return [("calendar",String(self.releaseDate ?? "") ),
                    ("clock","\(runtimeString.0):\(runtimeString.1)/ \(runtime) min"),
                    ("globe", "\(self.spokenLanguage?.first?.englishName ?? "English")")]
        case .tvShowDetail:
            return [("calendar",String(self.firstAirDate ?? "") ),
                    ("tv.play","Episodes: \(self.numberOfEpisodes ?? 0)"),
                    ("tv.play", "Seasons: \(self.numberOfSeasons ?? 0)")]
        default:  return []
        }
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

struct PersonImages: Codable {
    let id: Int?
    let profiles: [Image]?
    
    enum CodingKeys: String, CodingKey {
        case id, profiles
    }
}

struct Image: Codable {
    let filePath: String?
    
    enum CodingKeys: String, CodingKey {
        case filePath = "file_path"
    }
}
