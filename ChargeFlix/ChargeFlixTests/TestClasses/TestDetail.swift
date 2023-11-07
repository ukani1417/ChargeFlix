//
//  TestDetail.swift
//  ChargeFlixTests
//
//  Created by Dhruv Ukani on 07/11/23.
//

import XCTest
@testable import ChargeFlix

final class TestDetail: XCTestCase {
    
    private var repository = MockRepository()
    private var router = DetailRouter()
    private var interactor: DetailInteractor?
    private var presenter: DetailPresenter?
    private var content = DetailModel(id: 0, backdropPath: "", genres: [], originalTitle: "", originalName: "", overview: "", posterPath: "", releaseDate: "", firstAirDate: "", runtime: 0, voteAverage: 0.0, voteCount: 0, spokenLanguage: [], videos: ContentVideos(results: []), numberOfEpisodes: 0, numberOfSeasons: 0, credits: CastCredit(cast: []))
    private var type = DataType.castMovieCredit
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        interactor = DetailInteractor(repository: repository)
        presenter = DetailPresenter(interactor: interactor, content: content, contentDataType: type)
        interactor?.presenter = presenter
        
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class
        interactor = nil
        presenter = nil
        super.tearDown()
    }

    func test_fetch_CastDetail_Success() {
        presenter?.interactor?.getCastDetail(type: .castDetail, id: 1)
        
        XCTAssertNotNil(presenter?.castDetail)
        XCTAssertNil(presenter?.error)
    }
    
    func test_fetch_CastDetail_Failure() {
        presenter?.interactor?.getCastDetail(type: .movieDetail, id: 1)
        
        XCTAssertNil(presenter?.castDetail)
        XCTAssertNotNil(presenter?.error)
    }

}
