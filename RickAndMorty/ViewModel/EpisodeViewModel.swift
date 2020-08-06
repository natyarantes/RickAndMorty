//
//  EpisodeViewModel.swift
//  RickAndMorty
//
//  Created by Natália Arantes on 03/08/20.
//  Copyright © 2020 Natália Arantes. All rights reserved.
//

import Foundation

class EpisodeViewModel {

    private let episode: Episode
    init(episode: Episode) {
        self.episode = episode
    }
    var id: Int {
        return episode.id
    }
    var name: String {
        return episode.name
    }
    var airDate: String {
        return episode.airDate
    }
    var episodes: String {
        return episode.episode
    }
    var characters: [URL] {
        return episode.characters
    }
    var url: URL {
        return episode.url
    }
}
