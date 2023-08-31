//
//  Endpoint+Base.swift
//  Endpoints
//
//  Created by Zafar Ivaev on 08/08/23.
//

import Foundation

public extension Endpoint {
    var url: URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "thesimpsonsquoteapi.glitch.me"
        components.path =  "/\(path)"
        components.queryItems = queryItems
        
        guard let url = components.url else {
            preconditionFailure("Invalid URL components: \(components)")
        }
        
        return url
    }
    
    var headers: [String: Any] {
        return [
            "Accept": "application/json",
            "Content-Type": "application/json"
        ]
    }
}
