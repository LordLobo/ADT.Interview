//
//  EpisodeDataSource.swift
//  ADT.Interview
//
//  Created by Dan Giralte on 9/15/20.
//  Copyright © 2020 Dan Giralte. All rights reserved.
//

import Combine

class EpisodeDataSource : ObservableObject {
    @Published var episodes = [Episode]()
}
