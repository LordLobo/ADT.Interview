//
//  EpisodeRowView.swift
//  ADT.Interview
//
//  Created by Dan Giralte on 9/15/20.
//  Copyright © 2020 Dan Giralte. All rights reserved.
//

import SwiftUI

struct EpisodeRow: View {
    var episode: Episode
    
    init(_ episode: Episode) {
        self.episode = episode
    }
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("\(episode.name)")
                    .font(Font.system(size: 16.0, weight: .bold))
                
                Text("\(episode.air_date)")
                    .font(Font.system(size: 12.0))
            }
            .padding(.leading, 6)
            
            Spacer()
            
            Text("\(episode.episode)")
                .font(Font.system(size: 14.0))
        }
        .padding(4)
        .background(Color.gray)
        .cornerRadius(6)
    }
}

struct EpisodeRow_Previews: PreviewProvider {
    static var previews: some View {
        EpisodeRow(Episode(id: 1, name: "name", air_date: "September 15th, 2020", episode: "S99E99", characters: [], url: "", created:""))
    }
}
