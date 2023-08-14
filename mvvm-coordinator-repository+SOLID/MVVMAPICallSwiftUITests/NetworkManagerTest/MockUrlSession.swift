//
//  MockUrlSession.swift
//  MVVMAPICallSwiftUITests
//
//  Created by Andres D. Paladines on 8/10/23.
//

import Foundation
@testable import MVVMAPICallSwiftUI

class MockUrlSession: NetworkManagersessionable {

    private var mockData: Data!
    private var urlResponse: URLResponse!
    private var error: Error?

    func getData(for urlRequest: URLRequest, delegate: URLSessionTaskDelegate?) async throws -> (Data, URLResponse) {
        if error != nil {
            throw error!
        }

        return (mockData, urlResponse)
    }

    func setError(error: Error) {
        self.error = error
    }

    func setMockData(data: Data) {
        self.mockData = data
    }

    func setUrlResponse(urlResponse :URLResponse) {
        self.urlResponse = urlResponse
    }

}
