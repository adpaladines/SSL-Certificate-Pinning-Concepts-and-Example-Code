//
//  JsonManager.swift
//  MVVMFruitsApi
//
//  Created by Andres D. Paladines on 7/11/23.
//

import Foundation

enum TestUseCasesEnum: String {
    case digimonIncorrectData
    case digimonList
    case empyList
    case noData
    case none
}

class FakeNetworkManager: NetworkAbleProtocol {

    var fakePath: TestUseCasesEnum = .none

    func getDataFromApi(urlRequest: Requestable) async throws -> Data {
        guard let request = urlRequest.createURLRequest(isFake: true) else {
            throw NetworkError.invalidUrlError
        }
        let bundle = Bundle(for: FakeNetworkManager.self)
        let urlString = fakePath == .none ? request.url!.absoluteString : fakePath.rawValue
        guard let url = bundle.url(forResource: urlString, withExtension: "json") else {
            throw NetworkError.invalidUrlError
        }
        do {
            let data = try Data(contentsOf: url)
            return data
        }catch {
            print(error.localizedDescription)
            throw error
        }
    }
        
}
