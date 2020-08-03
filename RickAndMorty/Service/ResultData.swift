//
//  ResultData.swift
//  RickAndMorty
//
//  Created by Natália Arantes on 03/08/20.
//  Copyright © 2020 Natália Arantes. All rights reserved.
//

import Foundation

struct ResultData<T:Decodable>: Decodable {
    var info: InfoResponse
    var results: [T]
}
