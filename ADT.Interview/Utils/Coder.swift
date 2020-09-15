//
//  Coder.swift
//  ADT.Interview
//
//  Created by Dan Giralte on 9/15/20.
//  Copyright © 2020 Dan Giralte. All rights reserved.
//

import Foundation

struct Coder<T: Codable> {
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
