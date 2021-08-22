//
//  MovieListViewModel.swift
//  MovieBox
//
//  Created by Jack on 06/09/20.
//  Copyright © 2020 xyz. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

class MovieListViewModel: ObservableObject {
    @Published var movies = [Movie]()
    init() {
        fetchTrendingMovies()
    }
    
    func fetchTrendingMovies() {
        Webservice().loadTrendingMovies(path: "trending/movie/day?api_key=\(api_key)") { movies in
            if let movies = movies {
                self.movies = movies
            }
        }
    }
}

struct MovieListViewModel_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
