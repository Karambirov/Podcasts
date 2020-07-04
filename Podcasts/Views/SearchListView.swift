//
//  SearchListView.swift
//  Podcasts
//
//  Created by Eugene Karambirov on 03.07.2020.
//

import SwiftUI

struct SearchListView: View {
    @State private var podcasts = [Podcast]()
    var searchService: SearchService<PodcastMediaType>

    var body: some View {
        NavigationView {
            List {
                ForEach(podcasts) { podcast in
                    Text(podcast.trackName ?? "Unknown")
                }
            }
            .navigationTitle(Text("Podcasts"))
        }
        .onAppear {
            self.searchService
                .search(for: PodcastMediaType.self, with: "News") { result in
                    switch result {
                    case .success(let response):
                        self.$podcasts.wrappedValue = response.results
                    case .failure(let error):
                        print(error)
                    }
                }
        }
    }
}

struct SearchListView_Previews: PreviewProvider {
    static var previews: some View {
        SearchListView(searchService: SearchService<PodcastMediaType>())
    }
}
