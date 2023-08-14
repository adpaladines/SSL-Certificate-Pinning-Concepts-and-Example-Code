//
//  CustomFileManager.swift
//  MVVMAPICallSwiftUI
//
//  Created by Consultant on 8/13/23.
//

import Foundation

class CustomFileManager {

    static let shared: CustomFileManager = .init()

    private init() {}

    func saveFileWithProtection() {
        do {
            let bundle = Bundle(for: FileManager.self)
            let fileURL = URL(string: "xyz")!
            let data = "someData".data(using: .utf8)
            try data?.write(to: fileURL, options: .completeFileProtection)
        } catch {
            print(error.localizedDescription)
        }
    }
}
