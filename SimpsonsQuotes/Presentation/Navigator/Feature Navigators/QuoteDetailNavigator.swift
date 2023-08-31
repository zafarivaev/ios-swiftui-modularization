//
//  QuoteDetailNavigator.swift
//  Navigator
//
//  Created by Zafar Ivaev on 26/08/23.
//

import Combine
import UIKit
import SwiftUI
import Models
import QuoteDetail

public protocol QuoteDetailNavigatorDelegate: AnyObject {
    func didDeleteQuote(_ quote: QuoteModel)
}

public final class QuoteDetailNavigator: NavigatorProtocol, QuoteDetailNavigation {
    
    public init(
        navigationController: UINavigationController,
        quote: QuoteModel,
        delegate: QuoteDetailNavigatorDelegate?
    ) {
        self.navigationController = navigationController
        self.quote = quote
        self.delegate = delegate
    }
    
    private unowned let navigationController: UINavigationController
    private let quote: QuoteModel
    private weak var quoteDetailViewController: UIViewController?
    private weak var delegate: QuoteDetailNavigatorDelegate?
    
    // MARK: - Protocol Methods
    
    public func start() {
        let quoteDetailView = QuoteDetailAssembly.assemble(
            navigation: self,
            quote: quote
        )
        let quoteDetailViewController = UIHostingController(rootView: quoteDetailView)
        navigationController.pushViewController(quoteDetailViewController, animated: true)
    }
    
    public func performRoute(_ route: QuoteDetailViewModel.Route) {
        switch route {
        case .quotes:
            navigationController.popViewController(animated: true)
        }
    }
    
    public func didDeleteQuote(_ quote: QuoteModel) {
        delegate?.didDeleteQuote(quote)
    }
}
