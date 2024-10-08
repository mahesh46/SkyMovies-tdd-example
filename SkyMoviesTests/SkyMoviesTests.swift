//
//  SkyMoviesTests.swift
//  SkyMoviesTests
//
//  Created by mahesh lad on 22/05/2023.
//

import XCTest
@testable import SkyMovies

final class SkyMoviesTests: XCTestCase {
    
    //  var sut: MovieListViewModel!
    var mockservice: MockWebservice!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        mockservice = MockWebservice()
        
    }
    
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    
    }
    
    func testMockSericeGetMoviesExits() async {
        let getMovies =  try?  await mockservice.getMovies(searchTerm:"Batman")
        XCTAssertNotNil(getMovies)
    }
    
    func testNetworkserviceFactoryCreateExits() async {
        let nwnwfactoryCreate = NetworkServiceFactory.create()
        XCTAssertNotNil(nwnwfactoryCreate)
    }
    
    func testMockWebserviceSuccessfulyReturnsMovie() {
        Task {
            do {
                let movie =  try  await mockservice.getMovies(searchTerm:"Batman")
                XCTAssertFalse(movie.isEmpty)
            } catch (let error) {
                print(error.localizedDescription)
            }
        }
    }
    
    func testMockWebserviceThrowsError() throws {
        Task {
            do {
                let movie =  try  await mockservice.getMovies(searchTerm:"@@@@@")
                XCTAssertTrue(movie.isEmpty)
            } catch (let error) {
                print(error.localizedDescription)
                XCTAssertThrowsError(NetworkError.badID)
            }
        }
    }
    
    
    func testWebserviceSuccessReturnsMovies() {
        Task {
            do {
                let movie =  try  await Webservice().getMovies(searchTerm:"Batman")
                XCTAssertFalse(movie.isEmpty)
            } catch (let error) {
                print(error.localizedDescription)
            }
        }
    }
    
    func testWebServiceThrowsError() {
        Task {
            do {
                let movie =  try  await Webservice().getMovies(searchTerm:"@@@@@")
                XCTAssertTrue(movie.isEmpty)
            } catch (let error) {
                print(error.localizedDescription)
                XCTAssertThrowsError(NetworkError.badID)
            }
        }
    }
    
    
    func testMovieViewModelWithMock() async {
     
        let sut = await MovieListViewModel(service: mockservice).search(name: "Batman")
     
        XCTAssertEqual(sut.first?.imdbId,  "tt0096895")
            XCTAssertEqual(sut.first?.title,  "Batman")
        XCTAssertEqual(sut.first?.poster?.absoluteString, "https://m.media-amazon.com/images/M/MV5BZDNjOGNhN2UtNmNhMC00YjU4LWEzMmUtNzRkM2RjN2RiMjc5XkEyXkFqcGdeQXVyMTU0OTM5ODc1._V1_SX300.jpg")
          
         
    }
    
    
    func testMovieViewModelWithMockIsEmpty() async {
     
        let sut = await MovieListViewModel(service: mockservice).search(name: "@@@")
     
        XCTAssertTrue(sut.isEmpty)
         
    }
    
    
//    func testPerformanceExample() throws {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }
    
}
