//
//  DigimonViewModelUnitTests.swift
//  MVVMAPICallSwiftUITests
//
//  Created by Andres D. Paladines on 7/19/23.
//

import XCTest
@testable import MVVMAPICallSwiftUI

//nil value type vars
//null reference type vars
final class DigimonViewModelUnitTests: XCTestCase {

    var viewModel: DigimonListViewModel!
    
    override func setUpWithError() throws {
       
    }

    override func tearDownWithError() throws {
        
    }

    func testDigimonList_WhenWeExpectCorrectData() async throws {
        let repo = FakeDigimonRepository(networkManager: FakeNetworkManager(), useCase: .digimonList)
        viewModel = await DigimonListViewModel(pokemonRepository: repo)
        await viewModel.getDigimonList()
        let digiList = await viewModel.digimonList
        XCTAssertEqual(digiList.count, 209)
        
        let error = await viewModel.customError
        XCTAssertNil(error)
        
        let firstDigi = digiList.first
        XCTAssertEqual(firstDigi?.name, "Koromon")
        XCTAssertEqual(firstDigi?.level, "In Training")
    }

    func testDigimonList_WhenWeHaveInvalidURL() async throws {
        let fnm = FakeNetworkManager()
        let repo = FakeDigimonRepository(networkManager: fnm, useCase: .digimonIncorrectData)
        viewModel = await DigimonListViewModel(pokemonRepository: repo)

        await viewModel.getDigimonList()
        let digiList = await viewModel.digimonList
        XCTAssertEqual(digiList.count, 0)

        let error = await viewModel.customError
        XCTAssertNotNil(error)
        XCTAssertEqual(error!, .parsingError)
        let firstDigi = digiList.first
        XCTAssertNil(firstDigi)
    }

    func testDigimonList_WhenWeExpectNoData() async throws {
        let fnm = FakeNetworkManager()
        let repo = MockDigimonRepository(networkManager: fnm, useCase: .noData)
        viewModel = await DigimonListViewModel(pokemonRepository: repo)

        await viewModel.getDigimonList()
        let digiList = await viewModel.digimonList
        XCTAssertEqual(digiList.count, 0)

        let error = await viewModel.customError
        XCTAssertEqual(error, NetworkError.responseError)
    }

    func testDigimonList_WhenWeExpectParsingError() async throws {
        let fnm = FakeNetworkManager()
        let repo = FakeDigimonRepository(networkManager: fnm, useCase: .digimonIncorrectData)
        viewModel = await DigimonListViewModel(pokemonRepository: repo)

        await viewModel.getDigimonList()
        let digiList = await viewModel.digimonList
        XCTAssertEqual(digiList.count, 0)

        let error = await viewModel.customError
        XCTAssertEqual(error, NetworkError.parsingError)
    }

    func testDigimonList_WhenWeExpectResponseError() async throws {
        let fnm = FakeNetworkManager()
        let repo = MockDigimonRepository(networkManager: fnm, useCase: .noData)
        viewModel = await DigimonListViewModel(pokemonRepository: repo)

        await viewModel.getDigimonList()
        let digiList = await viewModel.digimonList

        XCTAssertEqual(digiList.count, 0)
        let error = await viewModel.customError
        XCTAssertEqual(error, NetworkError.responseError)
    }
    
    func testPerformanceExample() throws {
        self.measure {
        }
    }
}
