//
//  NetworkmanagerTest.swift
//  MVVMAPICallSwiftUITests
//
//  Created by Andres D. Paladines on 8/10/23.
//

import XCTest
@testable import MVVMAPICallSwiftUI

final class NetworkmanagerTest: XCTestCase {

    static let testUrl = "testUrl"
    static let testData = "testData".data(using: .utf8)
    static let testPath = "testPath"

    override func setUpWithError() throws {

    }

    override func tearDownWithError() throws {

    }

    func testNetWorkManager_getDataFromAPI_WhenEverythingIsCorrect() async throws {
        //Given
        let urlSession = MockUrlSession()
        let networkManager = NetworkManager(urlSession: urlSession)
        do {
            //When
            let dummyData = NetworkmanagerTest.testData
            let urlResponse = HTTPURLResponse(url: URL(string: NetworkmanagerTest.testUrl)!, statusCode: 200, httpVersion: nil, headerFields: nil)

            urlSession.setMockData(data: dummyData!)
            urlSession.setUrlResponse(urlResponse: urlResponse!)

            let pkeRequ =  DigimonRequest(path: NetworkmanagerTest.testPath)
            let data = try await networkManager.getDataFromApi(urlRequest: pkeRequ)
            //Then
            XCTAssertNotNil(data)
        }catch let error {
            XCTAssertNotNil(error)
        }
    }

    func testNetWorkManager_getDataFromAPI_WhenItGives404Error() async throws {
        //Given
        let urlSession = MockUrlSession()
        let networkManager = NetworkManager(urlSession: urlSession)
        do {
            //When
            let dummyData = "SomeData".data(using: .utf8)
            let urlResponse = HTTPURLResponse(url: URL(string: "testUrl")!, statusCode: 404, httpVersion: nil, headerFields: nil)

            urlSession.setMockData(data: dummyData!)
            urlSession.setUrlResponse(urlResponse: urlResponse!)
            let pkeRequ =  DigimonRequest(path: "Test_404")
            _ = try await networkManager.getDataFromApi(urlRequest: pkeRequ)
        }catch let error {
            //Then
            XCTAssertEqual(error as! NetworkError, NetworkError.responseError)
        }
    }

    func testNetWorkManager_getDataFromAPI_WhenDataNotFoundError() async throws {
        //Given
        let urlSession = MockUrlSession()
        let networkManager = NetworkManager(urlSession: urlSession)
        do {
            //When
            urlSession.setError(error: NetworkError.dataNotFoundError)
            let pkeRequ =  DigimonRequest(path: "Test_404")
            _ = try await networkManager.getDataFromApi(urlRequest: pkeRequ)
        }catch let error {
            //Then
            XCTAssertEqual(error as! NetworkError, NetworkError.dataNotFoundError)
        }
    }

    func testNetWorkManager_getDataFromAPI_WhenInvalidUrlError() async throws {
        //Given
        let urlSession = MockUrlSession()
        let networkManager = NetworkManager(urlSession: urlSession)
        do {
            //When
            urlSession.setError(error: NetworkError.invalidUrlError)
            let pkeRequ = DigimonRequest(path: "digimonList")
            _ = try await networkManager.getDataFromApi(urlRequest: pkeRequ)
        }catch let error {
            //Then
            XCTAssertEqual(error as! NetworkError, NetworkError.invalidUrlError)
        }
    }

    func testNetWorkManager_getDataFromAPI_WhenParsingError() async throws {
        //Given
        let urlSession = MockUrlSession()
        let networkManager = NetworkManager(urlSession: urlSession)
        do {
            //When
            urlSession.setError(error: NetworkError.parsingError)
            let pkeRequ = DigimonRequest(path: "digimonList")
            _ = try await networkManager.getDataFromApi(urlRequest: pkeRequ)
        }catch let error {
            //Then
            XCTAssertEqual(error as! NetworkError, NetworkError.parsingError)
        }
    }

    func testNetWorkManager_getDataFromAPI_WhenTimeOutError() async throws {
        //Given
        let urlSession = MockUrlSession()
        let networkManager = NetworkManager(urlSession: urlSession)
        do {
            //When
            urlSession.setError(error: NetworkError.timeOutError)
            let pkeRequ = DigimonRequest(path: "digimonList")
            _ = try await networkManager.getDataFromApi(urlRequest: pkeRequ)
        }catch let error {
            //Then
            XCTAssertEqual(error as! NetworkError, NetworkError.timeOutError)
        }
    }

    func testNetWorkManager_getDataFromAPI_WhenInvalidRequest() async throws {
        //Given
        let urlSession = MockUrlSession()
        let networkManager = NetworkManager(urlSession: urlSession)
        do {
            //When
            urlSession.setError(error: NetworkError.invalidRequest)
            let pkeRequ = DigimonRequest(path: "digimonList")
            _ = try await networkManager.getDataFromApi(urlRequest: pkeRequ)
        }catch let error {
            //Then
            XCTAssertEqual(error as! NetworkError, NetworkError.invalidRequest)
        }
    }

    func testPerformanceExample() throws {
        self.measure {
        }
    }

}
