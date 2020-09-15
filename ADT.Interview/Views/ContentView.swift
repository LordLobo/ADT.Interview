//
//  ContentView.swift
//  ADT.Interview
//
//  Created by Dan Giralte on 9/15/20.
//  Copyright © 2020 Dan Giralte. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var episodes = [Episode]()
    let api = API()
    
    var body: some View {
        VStack {
            List {
                ForEach(self.episodes, id:\.self) { episode in
                    //NavigationLink(destination: EpisodeDetailView(episode)) {
                    //    EpisodeRow(episode)
                    //}
                    
                    Text("\(episode.name)")
                }
            }
        }
        .onAppear {
            self.api.getEpisodes() { result in
                DispatchQueue.main.async {
                    self.episodes = result!.results
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
