//
//  EpisodeRequest.swift
//  RickAndMorty
//
//  Created by Natália Arantes on 03/08/20.
//  Copyright © 2020 Natália Arantes. All rights reserved.
//

import Foundation

class EpisodeRequest: APIRequest {
    var method: RequestType
    var path: String
    var parameters: [String : String]

    init(offset: Int) {
        self.method = .GET
        self.path = "/episode/"
        self.parameters = [:]
    }
}
