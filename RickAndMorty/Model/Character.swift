//
//  Character.swift
//  RickAndMorty
//
//  Created by Natália Arantes on 03/08/20.
//  Copyright © 2020 Natália Arantes. All rights reserved.
//

import Foundation

struct Character: Decodable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let typeSpecies: String
    let gender: String
    let origin: Location
    let location: Location
    let image: URL
    let episode: [URL]

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case status
        case species
        case typeSpecies = "type"
        case gender
        case origin
        case location
        case image
        case episode
    }

}
