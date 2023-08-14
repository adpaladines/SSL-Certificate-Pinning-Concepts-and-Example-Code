//
//  NetworkError.swift
//  MVVMAPICallSwiftUI
//
//  Created by Andres D. Paladines on 7/18/23.
//

import Foundation

enum NetworkError: Error {
    case invalidUrlError
    case dataNotFoundError
    case parsingError
    case responseError
    case timeOutError
    case invalidRequest
}

extension NetworkError: LocalizedError, Equatable {
    var errorDescription: String? {
        let myError: String
        switch self {
        case .invalidUrlError:
            myError = NSLocalizedString("API EndPoint was wrong", comment: "invalidUrlError")
        case .dataNotFoundError:
            myError = NSLocalizedString("API failed to give us response", comment: "dataNotFoundError")
        case .parsingError:
            myError = NSLocalizedString("We failed to parse the received response.", comment: "parsingError")
        case .responseError:
            myError = NSLocalizedString("Got invalid status code.", comment: "responseError")
        case .timeOutError:
            myError = NSLocalizedString("Time ran out.", comment: "timeOutError")
        case .invalidRequest:
            myError = NSLocalizedString("Invalid request.", comment: "invalidRequest")
        }
        return myError
    }
}
