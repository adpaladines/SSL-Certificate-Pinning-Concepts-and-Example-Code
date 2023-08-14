//
//  URLResponse+Extension.swift
//  MVVMAPICallSwiftUI
//
//  Created by Andres D. Paladines on 8/9/23.
//

import Foundation

protocol URLResponseable {
    func isValidUrlResponse() -> Bool
}

extension URLResponse: URLResponseable {
    
    func isValidUrlResponse() -> Bool {
        guard let response = self as? HTTPURLResponse else {
            return false
        }
        let code = response.statusCode
        switch code {
        case 200...299:
            return true
        case 300...399:
            return true
        case 400...499:
            return false
        case 500...599:
            return false
        default:
            return false
        }
    }
    
}
