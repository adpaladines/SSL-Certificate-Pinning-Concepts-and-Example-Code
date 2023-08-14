//
//  NetworkProtocolDelegate.swift
//  MVVMAPICallSwiftUI
//
//  Created by Andres D. Paladines on 7/18/23.
//

import Foundation

protocol NetworkAbleProtocol {
//    var networkDelegate: NetworkResponseProtocol? { get set }
        
    func getDataFromApi(urlRequest: Requestable) async throws -> Data 
    
}
