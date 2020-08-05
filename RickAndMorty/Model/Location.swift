//
//  Location.swift
//  RickAndMorty
//
//  Created by Natália Arantes on 03/08/20.
//  Copyright © 2020 Natália Arantes. All rights reserved.
//

import Foundation

struct Location: Decodable {
    let id: Int?
    let name: String?
    let typeLocation: String?
    let dimension: String?
    let residents: [URL]?
    let url: String?

    enum CodingKeys:String, CodingKey{
        case id
        case name
        case typeLocation = "type"
        case dimension
        case residents
        case url

    }
}
