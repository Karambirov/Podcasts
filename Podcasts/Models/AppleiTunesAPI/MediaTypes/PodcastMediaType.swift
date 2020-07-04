//
//  PodcastMediaType.swift
//  Podcasts
//
//  Created by Eugene Karambirov on 03.07.2020.
//

public struct PodcastMediaType: MediaType {
    public enum Entity: String {
        case podcast
        case author = "podcastAuthor"
    }

    public enum Attribute: String {
        case title = "titleTerm"
        case language = "languageTerm"
        case author = "authorTerm"
        case genre = "genreIndex"
        case artist = "artistTerm"
        case rating = "ratingIndex"
        case keywords = "keywordsTerm"
        case description = "descriptionTerm"
    }
}
