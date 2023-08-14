//
//  Digimon.swift
//  MVVMAPICallSwiftUI
//
//  Created by Andres D. Paladines on 7/18/23.
//

import Foundation

struct Digimon: Decodable {
    
    let name: String
    let img: String
    let level: String
}

extension Digimon: Identifiable {
    var id: UUID {
        return UUID()
    }
}

extension Digimon {
    static func mockList() -> [Digimon] {
        return [
            Digimon(name: "Digimon 1", img: "Image", level: "Training 1"),
            Digimon(name: "Digimon 2", img: "Image", level: "Training 2"),
            Digimon(name: "Digimon 3", img: "Image", level: "Training 3"),
        ]
    }
}
