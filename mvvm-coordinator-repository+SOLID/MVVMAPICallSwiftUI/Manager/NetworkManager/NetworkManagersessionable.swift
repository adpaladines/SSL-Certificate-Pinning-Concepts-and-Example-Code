//
//  NetworkManagersessionable.swift
//  MVVMAPICallSwiftUI
//
//  Created by Andres D. Paladines on 8/9/23.
//

import Foundation
//URLSession.shared.data(for: urlRequest)
protocol NetworkManagersessionable {
    func getData(for urlRequest: URLRequest, delegate: URLSessionTaskDelegate?) async throws -> (Data, URLResponse)
}
