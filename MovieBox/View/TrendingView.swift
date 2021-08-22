//
//  TrendingView.swift
//  MovieBox
//
//  Created by Jack on 06/09/20.
//  Copyright © 2020 xyz. All rights reserved.
//

import SwiftUI

struct TrendingView: View {
    @ObservedObject var viewModel = MovieListViewModel()
    var body: some View {
        VStack() {
            List(viewModel.movies) { item in
                VStack() {
                    HStack(alignment: .top, spacing: 5) {
                        //Create poster image
                        AsyncImage(url: URL(string: imageBaseURL + "w200" + (item.posterPath ?? ""))!)
                        VStack(alignment: .leading, spacing: 6) {
                            Text(item.title ?? "")
                            Text(item.overview ?? "")
                                .lineLimit(3)
                                .font(.callout)
                            Text(item.releaseDate ?? "")
                                .foregroundColor(.gray)
                                .font(.callout)
                            HStack() {
                                Image(systemName: "star.fill")
                                    .font(.callout)
                                    .foregroundColor(Color("Color_app_primary"))
                                Text(String(format: "%.1f", item.voteAverage ?? 0.0))
                                    .font(.callout)
                            }
                        }.padding(4)
                    }
                }
            }
            .modifier(ListSeparatorStyleModifier())
        }
    }
}

struct TrendingView_Previews: PreviewProvider {
    static var previews: some View {
        TrendingView()
    }
}
