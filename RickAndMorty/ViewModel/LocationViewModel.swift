//
//  LocationViewModel.swift
//  RickAndMorty
//
//  Created by Natália Arantes on 03/08/20.
//  Copyright © 2020 Natália Arantes. All rights reserved.
//

import Foundation

class LocationViewModel {
    private let location: Location
    init(location: Location) {
        self.location = location
    }
    var id: Int? {
        return location.id
    }
    var name:String? {
        return location.name
    }
    var typeLocation: String? {
        return location.typeLocation
    }
    var dimension: String? {
        return location.dimension
    }
    var residents:[URL]? {
        return location.residents
    }
    var url:String? {
        return location.url
    }
}
