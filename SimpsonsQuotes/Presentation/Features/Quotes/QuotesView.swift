//
//  QuotesView.swift
//  Quotes
//
//  Created by Zafar Ivaev on 07/08/23.
//

import SwiftUI

public struct QuotesView: View {
    
    init(viewModel: QuotesViewModel) {
        self.viewModel = viewModel
    }

    @ObservedObject public var viewModel: QuotesViewModel
    @State private var isViewLoaded = false

    public var body: some View {
        VStack {
            if viewModel.isListLoading {
                ProgressView()
                    .scaleEffect(2)
            } else {
                List(viewModel.quotes, id: \.self) { item in
                    Button {
                        viewModel.quoteTapped(item)
                    } label: {
                        Text(item.text)
                    }
                }
                .listStyle(.plain)
            }
        }
        .navigationTitle("Quotes")
        .onAppear {
            if !isViewLoaded {
                isViewLoaded.toggle()
                viewModel.viewAppeared()
            }
        }
    }
}

struct QuotesView_Preview: PreviewProvider {
    static var previews: some View {
        QuotesAssembly.assembleForPreview()
    }
}
