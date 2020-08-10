//
//  EpisodeRequestById.swift
//  RickAndMorty
//
//  Created by Natália Arantes on 10/08/20.
//  Copyright © 2020 Natália Arantes. All rights reserved.
//

import Foundation

class EpisodeRequestById: APIRequest {
    var method: RequestType
    var path: String
    var parameters: [String : String]

    init(offset: Int, ids:[String]) {
        self.method = .GET
        self.path = "/episode/" + "[" + ids.joined(separator: ",") + "]"
        self.parameters = [:]
    }
}
