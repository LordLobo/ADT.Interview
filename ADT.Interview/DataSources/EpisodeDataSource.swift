//
//  EpisodeDataSource.swift
//  ADT.Interview
//
//  Created by Dan Giralte on 9/15/20.
//  Copyright © 2020 Dan Giralte. All rights reserved.
//

import Foundation
import Combine

class EpisodeDataSource : ObservableObject {
    @Published var episodes = [Episode]()
        
    let api = API()
    var nextPage = ""
    
    init() {
        self.getFirstEpisodes()
    }
    
    func getFirstEpisodes() {
        self.api.getEpisodes() { result in
            DispatchQueue.main.async {
                self.episodes = result!.results
                self.nextPage = result!.info.next!
            }
        }
    }
    
    func getNextEpisodes(_ episode: Episode? = nil) {
        if episode! == self.episodes.last && self.nextPage != "" {
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
