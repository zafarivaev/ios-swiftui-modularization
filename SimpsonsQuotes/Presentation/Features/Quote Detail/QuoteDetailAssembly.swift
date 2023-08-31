//
//  QuoteDetailAssembly.swift
//  QuoteDetail
//
//  Created by Zafar Ivaev on 10/08/23.
//

import UIKit
import Models
import Combine

@MainActor
public enum QuoteDetailAssembly {
    public static func assemble(
        navigation: QuoteDetailNavigation?,
        quote: QuoteModel
    ) -> QuoteDetailView {
        let viewModel = QuoteDetailViewModel(
            navigation: navigation,
            quote: quote
        )
        return QuoteDetailView(viewModel: viewModel)
    }
    
    public static func assembleForPreview() -> QuoteDetailView {
        let quote = QuoteModel(
            text: "Test Quote",
            character: "Test Character",
            imageURL: URL(
                string: "https://cdn.glitch.com/3c3ffadc-3406-4440-bb95-d40ec8fcde72%2FTroyMcClure.png?1497567511112"
            )
        )
        let viewModel = QuoteDetailViewModel(
            navigation: nil,
            quote: quote
        )
        return QuoteDetailView(viewModel: viewModel)
    }
}
