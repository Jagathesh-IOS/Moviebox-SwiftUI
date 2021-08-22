//
//  Webservice.swift
//  MovieBox
//
//  Created by Jack on 06/09/20.
//  Copyright © 2020 xyz. All rights reserved.
//

import Foundation

let api_key = "5afb74f0331b3a1755910a738c87a133"
let baseURL = "https://api.themoviedb.org/3/"
let imageBaseURL = "https://image.tmdb.org/t/p/"

class Webservice {
    func loadTrendingMovies(path:String, completion: @escaping ([Movie]?) -> ()) {
        guard let url = URL(string: baseURL + path) else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let jsonData = data, error == nil else {
                completion(nil)
                return
            }
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let jsonResponse = try? decoder.decode(MovieResponse<Movie>.self, from: jsonData)
            if let response = jsonResponse {
                completion(response.results)
            }
        }.resume()
    }
}
