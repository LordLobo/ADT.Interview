//
//  ContentView.swift
//  ADT.Interview
//
//  Created by Dan Giralte on 9/15/20.
//  Copyright © 2020 Dan Giralte. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var dataSource = EpisodeDataSource()
    
    let api = API()
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(self.dataSource.episodes, id:\.self) { episode in
                        NavigationLink(destination: EpisodeDetailView(episode)) {
                            EpisodeRow(episode)
                                .onAppear {
                                    self.dataSource.getNextEpisodes(episode)
                                }
                        }
                    }
                }
            }
            .navigationBarTitle(Text("Episodes"), displayMode: .large)
        }
        .onAppear {
            // gets rid of seperators
            UITableView.appearance().separatorStyle = .none
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
