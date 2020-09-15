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
    func getEpisodes(fromURL: URL = URL(string: EPISODE_ENDPOINT)!, completion: @escaping (EpisodeResults?) -> Void) {
        let req = request(url: fromURL)
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
