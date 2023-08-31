//
//  QuotesNavigator.swift
//  Navigator
//
//  Created by Zafar Ivaev on 26/08/23.
//

import UIKit
import SwiftUI
import Quotes
import QuoteDetail
import Models

public final class QuotesNavigator: NavigatorProtocol, QuotesNavigation, QuoteDetailNavigatorDelegate {
    
    public init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    private unowned let navigationController: UINavigationController
    private weak var quotesViewController: UIViewController?
    private weak var quotesViewModel: QuotesViewModel?
    
    // MARK: - Protocol Methods
    
    public func start() {
        let quotesView = QuotesAssembly.assemble(navigation: self)
        self.quotesViewModel = quotesView.viewModel
        let quotesViewController = UIHostingController(rootView: quotesView)
        self.quotesViewController = quotesViewController
        self.navigationController.pushViewController(quotesViewController, animated: true)
    }
    
    public func performRoute(_ route: QuotesViewModel.Route) {
        switch route {
        case .quoteDetail(let quoteModel):
            let quoteDetailNavigator = QuoteDetailNavigator(
                navigationController: navigationController,
                quote: quoteModel,
                delegate: self
            )
            quoteDetailNavigator.start()
        }
    }
    
    public func didDeleteQuote(_ quote: QuoteModel) {
        quotesViewModel?.onQuoteDeleteSubject.send(quote)
    }
}
