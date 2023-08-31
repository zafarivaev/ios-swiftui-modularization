//
//  QuoteModel.swift
//  Models
//
//  Created by Zafar Ivaev on 19/08/23.
//

import Foundation
import Entities

public struct QuoteModel: Hashable {
    public let id: UUID
    public let text: String
    public let character: String
    public let imageURL: URL?
    
    public init(text: String, character: String, imageURL: URL?) {
        self.id = UUID()
        self.text = text
        self.character = character
        self.imageURL = imageURL
    }
    
    public init?(dto: Quote) {
        guard
            let text = dto.quote,
            let character = dto.character
        else { return nil }
        
        self.init(text: text, character: character, imageURL: URL(string: dto.image ?? ""))
    }
}
