//
//  Networker.swift
//  Networker
//
//  Created by Zafar Ivaev on 08/08/23.
//

import Foundation

public protocol NetworkerProtocol: AnyObject {
    typealias Headers = [String: Any]
    
    func get<T: Decodable>(type: T.Type, url: URL, headers: Headers) async throws -> T
}

public final class Networker: NetworkerProtocol {
    
    public init () {}
    
    public func get<T: Decodable>(type: T.Type, url: URL, headers: Headers) async throws -> T {
        var request = URLRequest(url: url)
        
        headers.forEach { (key, value) in
            if let value = value as? String {
                request.setValue(value, forHTTPHeaderField: key)
            }
        }
        
        let (data, _) = try await URLSession.shared.data(for: request)
        return try JSONDecoder().decode(type, from: data)
    }
}
