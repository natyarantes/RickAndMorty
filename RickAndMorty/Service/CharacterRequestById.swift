//
//  CharacterRequestById.swift
//  RickAndMorty
//
//  Created by Natália Arantes on 09/08/20.
//  Copyright © 2020 Natália Arantes. All rights reserved.
//

import Foundation

class CharacterRequestById: APIRequest {
    var method: RequestType
    var path: String
    var parameters: [String : String]

    init(offset: Int, ids:[String]) {
        self.method = .GET
        self.path = "/character/" + "[" + ids.joined(separator: ",") + "]"
        self.parameters = [:]
    }
}
