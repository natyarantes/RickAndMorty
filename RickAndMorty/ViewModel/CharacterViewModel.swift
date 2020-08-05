//
//  CharacterViewModel.swift
//  RickAndMorty
//
//  Created by Natália Arantes on 03/08/20.
//  Copyright © 2020 Natália Arantes. All rights reserved.
//

import Foundation

class CharacterViewModel {

    private let character: Character
    init(character: Character) {
        self.character = character
    }
    var id: Int {
        return character.id
    }
    var name: String {
        return character.name
    }
    var status: String {
        return character.status
    }
    var species: String {
        return character.species
    }
    var typeSpecies: String {
        return character.typeSpecies
    }
    var gender: String {
        return character.gender
    }
    var origin: String? {
        return character.origin.name
    }
    var location: String? {
        return character.location.name
    }
    var image: URL {
        return character.image
    }
    var episode: [URL] {
        return character.episode
    }
}
