//
//  CharacterRequest.swift
//  RickAndMorty
//
//  Created by Natália Arantes on 03/08/20.
//  Copyright © 2020 Natália Arantes. All rights reserved.
//

import Foundation

class CharacterRequest: APIRequest {
    var method: RequestType
    var path: String
    var parameters: [String : String]

    init(characterFilter: CharacterFilter?) {
        self.method = .GET
        self.path = "/character/"
        self.parameters = [:]

        if !(characterFilter?.selectedName?.isEmpty ?? true) {
            parameters["name"] = characterFilter?.selectedName
        }

        if !(characterFilter?.selectedSpecies?.isEmpty ?? true) {
            parameters["species"] = characterFilter?.selectedSpecies
        }

        if !(characterFilter?.selectedStatus?.isEmpty ?? true) {
            parameters["status"] = characterFilter?.selectedStatus
        }

        if !(characterFilter?.selectedGender?.isEmpty ?? true) {
            parameters["gender"] = characterFilter?.selectedGender
        }
    }
}
