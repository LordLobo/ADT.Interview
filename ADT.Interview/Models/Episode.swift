//
//  Episode.swift
//  ADT.Interview
//
//  Created by Dan Giralte on 9/15/20.
//  Copyright © 2020 Dan Giralte. All rights reserved.
//

struct Episode : Codable {
    let id:Int
    let name: String //  The name of the episode.
    let air_date: String // The air date of the episode.
    let episode: String // The code of the episode.
    let characters: [String] //   List of characters who have been seen in the episode.
    let url: String // Link to the episode's own endpoint.
    let created: String  // Time at which the episode was created in the database.
}
