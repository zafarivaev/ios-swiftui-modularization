//
//  QuotesAssembly.swift
//  Quotes
//
//  Created by Zafar Ivaev on 08/08/23.
//

import UIKit
import Networker
import Services

@MainActor
public enum QuotesAssembly {
    public static func assemble(navigation: QuotesNavigation) -> QuotesView {
        let networker = Networker()
        let quotesService = QuotesService(networker: networker)
        let worker: QuotesWorkerProtocol = QuotesWorker(quotesService: quotesService)
        let viewModel = QuotesViewModel(worker: worker, navigation: navigation)
        return QuotesView(viewModel: viewModel)
    }
    
    public static func assembleForPreview() -> QuotesView {
        let worker: QuotesWorkerProtocol = QuotesWorker(quotesService: QuotesMockService())
        let viewModel = QuotesViewModel(worker: worker, navigation: nil)
        return QuotesView(viewModel: viewModel)
    }
}
