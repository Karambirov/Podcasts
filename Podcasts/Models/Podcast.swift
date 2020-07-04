//
//  Podcast.swift
//  Podcasts
//
//  Created by Eugene Karambirov on 04.07.2020.
//

import Foundation

struct Podcast: Decodable, Identifiable {
    typealias ID = UUID
    var id: ID { UUID() }

    /// The name of the podcast.
    var trackName: String?
    /// The name of the artist.
    var artistName: String?
    /// A URL for the artwork associated with the returned media type.
    var artworkUrl600: String?
}
