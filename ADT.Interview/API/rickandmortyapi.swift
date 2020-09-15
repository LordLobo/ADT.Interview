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
                    //completion(CheckItemResponse.errEmpty())
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

struct EpisodeResults : Codable {
    let info: ResultInfo
    let results: [Episode]
}

struct ResultInfo : Codable {
    let count: Int
    let pages: Int
    let next: String?
    let prev: String?
}

struct Episode : Codable {
    let id:Int
    let name: String //  The name of the episode.
    let air_date: String // The air date of the episode.
    let episode: String // The code of the episode.
    let characters: [String] //   List of characters who have been seen in the episode.
    let url: String // Link to the episode's own endpoint.
    let created: String  // Time at which the episode was created in the database.
}

class Coder<T: Codable> {
    static func encode(_ data:T) ->  Data? {
        let encoder = JSONEncoder()
        do {
            let ret = try encoder.encode(data)
            return ret
        } catch {
            return nil
        }
    }
    
    static func decode(_ data: Data) -> T? {
        let decoder = JSONDecoder()
        do {
            let ret = try decoder.decode(T.self, from: data)
            return ret
        } catch {
            return nil
        }
    }
}
