//
//  Endpoint+Quotes.swift
//  Endpoints
//
//  Created by Zafar Ivaev on 08/08/23.
//

import Foundation

public extension Endpoint {
    static var quotes: Self {
        Endpoint(path: "quotes")
    }
    
    static func quotes(count: Int) -> Self {
        Endpoint(
            path: "quotes",
            queryItems: [
                URLQueryItem(name: "count", value: "\(count)")
            ]
        )
    }
}
