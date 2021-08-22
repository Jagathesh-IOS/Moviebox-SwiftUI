//
//  Loader.swift
//  MovieBox
//
//  Created by Jack on 06/09/20.
//  Copyright © 2020 xyz. All rights reserved.
//

import SwiftUI

final class Loader: ObservableObject {
    var task: URLSessionDataTask!
    @Published var data: Data? = nil
    
    init(_ url: URL) {
        task = URLSession.shared.dataTask(with: url, completionHandler: { data, _, _ in
            DispatchQueue.main.async {
                self.data = data
            }
        })
        task.resume()
    }
    
    deinit {
        task.cancel()
    }
}

let placeholder = UIImage(named: "placeholder")!

struct AsyncImage: View {
    init(url: URL) {
        self.imageLoader = Loader(url)
    }
    
    @ObservedObject private var imageLoader: Loader
    var image: UIImage? {
        imageLoader.data.flatMap(UIImage.init)
    }
    
    var body: some View {
        Image(uiImage: image ?? placeholder)
            .resizable()
            .frame(width: 150, height: 200)
    }
}

public struct ListSeparatorStyleModifier: ViewModifier {
    public func body(content: Content) -> some View {
        content.onAppear {
            UITableView.appearance().separatorColor = .white
            UITableView.appearance().separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }.onDisappear {
            UITableView.appearance().separatorColor = .clear
        }
    }
}
