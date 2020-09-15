//
//  rickandmortyapi.swift
//  ADT.Interview
//
//  Created by Dan Giralte on 9/15/20.
//  Copyright © 2020 Dan Giralte. All rights reserved.
//

import Foundation

let BASE_URL = "https://rickandmortyapi.com/api/"
let EPISODE_ENDPOINT = BASE_URL + "episode"

class API {
    func getEpisodes(completion: @escaping (EpisodeResults?) -> Void) {
        let fullURL = URL(string: EPISODE_ENDPOINT)
        let req = request(url: fullURL!)
        let getTask = URLSession.shared.dataTask(with: req) { data, response, error in
            if let _ = error {
                // todo
            } else if let _ = response as? HTTPURLResponse {
                if let response = Coder<EpisodeResults>.decode(data!) {
                    completion(response)
                } else {
                    completion(nil)
                }
            }
        }
        
        getTask.resume()
    }

    func request(url: URL) -> URLRequest {
        var result = URLRequest(url: url)
        result.httpMethod = "GET"
        
        return result
    }
}
