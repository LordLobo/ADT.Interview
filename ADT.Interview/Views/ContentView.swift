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
    @State private var nextPage = ""
    
    let api = API()
    
    var body: some View {
        VStack {
            Text("Rick and Morty")
            
            List {
                ForEach(self.episodes, id:\.self) { episode in
                    NavigationLink(destination: EpisodeDetailView()) {
                        EpisodeRow(episode)
                            .onAppear {
                                self.getNextEpisodes(episode)
                            }
                    }
                }
            }
        }
        .onAppear {
            // gets rid of seperators
            UITableView.appearance().separatorStyle = .none
            
            self.api.getEpisodes() { result in
                DispatchQueue.main.async {
                    self.episodes = result!.results
                    self.nextPage = result!.info.next!
                }
            }
        }
    }
    
    func getNextEpisodes(_ episode: Episode) {
        if episode == self.episodes.last && self.nextPage != "" {
            self.api.getEpisodes(fromURL: URL(string: self.nextPage)!) { result in
                DispatchQueue.main.async {
                    self.episodes.append(contentsOf: result!.results)
                    
                    if result!.info.next != nil {
                        self.nextPage = result!.info.next!
                    } else {
                        self.nextPage = ""
                    }
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
