//
//  DigimonRepositoryTest.swift
//  MVVMAPICallSwiftUITests
//
//  Created by Andres D. Paladines on 8/10/23.
//

import XCTest
@testable import MVVMAPICallSwiftUI

final class DigimonRepositoryTest: XCTestCase {


    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testDigimonRepository_WhenWeExpectEverythingCorrect() async throws {
        //Given
        let fakeNetworkManager = FakeNetworkManager()
        let digimonRepository = DigimonRepository(networkManager: fakeNetworkManager)
        //When
        fakeNetworkManager.fakePath = .digimonList
        let list = try await digimonRepository.getListOfDigimons()
        //Then
        XCTAssertNotNil(fakeNetworkManager)
        XCTAssertNotNil(digimonRepository)
        XCTAssertEqual(list.count, 209)
    }

    func testDigimonRepository_WhenWeExpectEmptyList() async throws {
        //Given
        let fakeNetworkManager = FakeNetworkManager()
        let digimonRepository = DigimonRepository(networkManager: fakeNetworkManager)

        //When
        fakeNetworkManager.fakePath = .empyList
        let list = try await digimonRepository.getListOfDigimons()

        //Then
        XCTAssertNotNil(fakeNetworkManager)
        XCTAssertNotNil(digimonRepository)
        XCTAssertEqual(list.count, 0)
    }

    func testDigimonRepository_WhenWeExpectNoData() async throws {
        //Given
        let fakeNetworkManager = FakeNetworkManager()
        let digimonRepository = DigimonRepository(networkManager: fakeNetworkManager)

        //When
        fakeNetworkManager.fakePath = .noData
        do {
            let list = try await digimonRepository.getListOfDigimons()
        }catch let error {
            //Then
            XCTAssertNotNil(error)
        }
    }

    func testDigimonRepository_WhenWeExpectParsingError() async throws {
        //Given
        let fakeNetworkManager = FakeNetworkManager()
        let digimonRepository = DigimonRepository(networkManager: fakeNetworkManager)

        //When
        fakeNetworkManager.fakePath = .digimonIncorrectData
        do {
            let list = try await digimonRepository.getListOfDigimons()
        }catch let error {
            //Then
            XCTAssertNotNil(error)
            XCTAssertTrue(error is DecodingError)
        }
    }

    func testPerformanceExample() throws {

        self.measure {

        }
    }

}
