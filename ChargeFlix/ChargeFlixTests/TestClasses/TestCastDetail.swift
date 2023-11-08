//
//  TestCastDetail.swift
//  ChargeFlixTests
//
//  Created by Dhruv Ukani on 08/11/23.
//

import XCTest
@testable import ChargeFlix

final class TestCastDetail: XCTestCase {

    var repository: MockRepository = MockRepository()
    var router: CastDetailRouter = CastDetailRouter()
    var interactor: CastDetailInteractor?
    var presenter: CastDetailPresenter?
    var type = DataType.castMovieCredit
    var person = Person(id: 0, biography: "", name: "", knownForDepartement: "", profilePath: "", images: Profile(profiles: []), tvCredit: Credit(id: 0, cast: []), movieCredit:   Credit(id: 0, cast: []))
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        interactor = CastDetailInteractor(repository: repository)
        presenter = CastDetailPresenter(router: router , interactor: interactor ,castType: type, cast: person)
        interactor?.presenter = presenter
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        interactor = nil
        presenter = nil
    }

    func test_getCastCreditDetaiContent_With_Movie_Detail_Success() {
        presenter?.interactor?.getCastCreditContentDetail(type: .movieDetail, id: 1)
        
        XCTAssertNotNil(presenter?.creditContentDetail)
        XCTAssertNil(presenter?.error)
    }
    
    func test_getCastCreditDetaiContent_TVShowDetail_Success() {
        presenter?.interactor?.getCastCreditContentDetail(type: .tvShowDetail, id: 1)
        
        XCTAssertNotNil(presenter?.creditContentDetail)
        XCTAssertNil(presenter?.error)
    }
    
    func test_getCastCreditDetaiContent_failure_Success() {
        presenter?.interactor?.getCastCreditContentDetail(type: .castDetail, id: 1)
        
        XCTAssertNil(presenter?.creditContentDetail)
        XCTAssertNotNil(presenter?.error)
    }
}
