//
//  Movies.swift
//  MovieBox
//
//  Created by Jack on 06/09/20.
//  Copyright © 2020 xyz. All rights reserved.
//

import Foundation

struct MovieResponse<T:Codable>: Codable {
    let page: Int?
    let results: [T]?
    let totalPages: Int?
    let totalResults: Int?
}

struct Movie: Codable, Identifiable {
    let id: Int?
    let title: String?
    let overview: String?
    let mediaType: String?
    let voteAverage: Float?
    let posterPath: String?
    let releaseDate: String?
}
