//
//  ResultInfo.swift
//  ADT.Interview
//
//  Created by Dan Giralte on 9/15/20.
//  Copyright © 2020 Dan Giralte. All rights reserved.
//

struct ResultInfo : Codable {
    let count: Int
    let pages: Int
    let next: String?
    let prev: String?
}
