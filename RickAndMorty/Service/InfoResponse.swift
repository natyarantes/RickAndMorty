//
//  InfoResponse.swift
//  RickAndMorty
//
//  Created by Natália Arantes on 03/08/20.
//  Copyright © 2020 Natália Arantes. All rights reserved.
//

import Foundation

struct InfoResponse: Decodable {
    var count: Int
    var next: URL
    var pages: Int
    var prev: URL?
}
