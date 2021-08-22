//
//  TabContentView.swift
//  MovieBox
//
//  Created by Jack on 06/09/20.
//  Copyright © 2020 xyz. All rights reserved.
//

import SwiftUI

struct TabContentView: View {
    init() {
        UITabBar.appearance().barTintColor = .black
    }
    var body: some View {
        NavigationView {
            TabView {
                HomeView()
                    .tabItem {
                        Image(systemName: "house")
                        Text("Home")
                }
                TrendingView()
                    .tabItem {
                        Image(systemName: "flame.fill")
                        Text("Trending")
                }
                SearchView()
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                        Text("Search")
                }
                VideosView()
                    .tabItem {
                        Text("Videos")
                        Image(systemName: "play.circle.fill")
                }
                ProfileView()
                    .tabItem {
                        Text("Profile")
                        Image(systemName: "person.crop.circle.fill")
                }
            }
            .font(.headline)
            .accentColor(Color("Color_app_primary"))
            .navigationBarTitle("Movie Box", displayMode: .inline)
        }
    }
}

struct TabContentView_Previews: PreviewProvider {
    static var previews: some View {
        TabContentView()
            .environment(\EnvironmentValues.colorScheme, ColorScheme.dark)
    }
}
