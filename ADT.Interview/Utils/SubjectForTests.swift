//
//  SubjectForTests.swift
//  ADT.Interview
//
//  Created by Dan Giralte on 9/15/20.
//  Copyright © 2020 Dan Giralte. All rights reserved.
//

import Foundation
import Combine

class SubjectForTests {

    static func fizzBuzz(upTo: Int) -> [String] {
        var ret = [String]()
        
        for i in 1...upTo {
            if i % 3 == 0 {
                ret.append("Fizz")
            } else if i % 5 == 0 {
                ret.append("Buzz")
            } else {
                ret.append("")
            }
        }
        
        return ret
    }
    
    
    
    func buildPostLoginRequest(req: LoginRequest) throws -> URLSession.DataTaskPublisher {
        let loginUrl = URL(string: "https://x3rnqjtaed.execute-api.us-east-1.amazonaws.com/Prod/login")
        
        let headers = [
            "Content-Type": "application/json",
            "cache-control": "no-cache",
        ]
        
        let encoder = JSONEncoder()
        
        guard let postData = try? encoder.encode(req) else {
            throw APIError.invalidBody
        }
        
        var request = URLRequest(url: loginUrl!,
                                 cachePolicy: .useProtocolCachePolicy,
                                 timeoutInterval: 10.0)
        
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = headers
        request.httpBody = postData as Data
        
        let session = URLSession.shared
        
        return session.dataTaskPublisher(for: request)
    }
    
    func loginRequest(email: String, password: String) -> AnyPublisher<LoginResult, Error> {
        let request = LoginRequest(email: email, password: password)
        
        let loginPublisher = try? buildPostLoginRequest(req: request)
        
        return (loginPublisher?
            .mapError { $0 as Error }
            .map { $0.data }
            .decode(type: LoginResult.self, decoder: JSONDecoder())
            .eraseToAnyPublisher())!
    }
}

enum APIError: Error {
    case invalidBody
    case invalidEndpoint
    case invalidURL
    case emptyData
    case invalidJSON
    case invalidResponse
    case statusCode(Int)
}

struct LoginRequest : Codable {
    let email: String
    let password: String
}

struct LoginResult : Codable {
    let statusCode: Int
    let message: String
    
    let token: String?
    let userData: UserData?
}

struct UserData : Codable {
    let firstName: String
    let lastName: String
    let photoLink: String
    let userHandle: String
    let email: String
    let id: String
}

