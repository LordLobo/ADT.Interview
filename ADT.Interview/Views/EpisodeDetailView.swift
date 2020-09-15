//
//  EpisodeDetailView.swift
//  ADT.Interview
//
//  Created by Dan Giralte on 9/15/20.
//  Copyright © 2020 Dan Giralte. All rights reserved.
//

import SwiftUI

struct EpisodeDetailView: View {
    var episode: Episode
    
    init(_ episode: Episode) {
        self.episode = episode
    }
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                Text("\(self.episode.name)")
                .font(Font.system(size: 24.0, weight: .bold))

                HStack {
                    Text("\(self.episode.air_date)")
                    .font(Font.system(size: 12.0))

                    .padding(.leading, 6)

                    Spacer()

                    Text("\(self.episode.episode)")
                    .font(Font.system(size: 14.0))
                }
                
                Spacer()
                
            }
            .frame(width: geo.size.width * 0.9)
            .padding(8)
            .background(Color.gray)
            .cornerRadius(6)
        }
    }
}

struct EpisodeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        EpisodeDetailView(Episode(id: 1, name: "name", air_date: "September 15th, 2020", episode: "S99E99", characters: [], url: "", created:""))
    }
}
