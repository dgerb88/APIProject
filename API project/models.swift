//
//  models.swift
//  API project
//
//  Created by Dax Gerber on 12/1/23.
//

import Foundation

struct Doggo: Decodable {
    var message: String
}

struct Representatives: Decodable {
    var results: [Representative]
}

struct Representative: Decodable {
    var name: String
    var party: String
    var state: String
    var link: String
}
