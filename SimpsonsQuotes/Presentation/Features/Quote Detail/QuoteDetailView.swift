//
//  QuoteDetailView.swift
//  QuoteDetail
//
//  Created by Zafar Ivaev on 07/08/23.
//

import SwiftUI

public struct QuoteDetailView: View {
    
    init(viewModel: QuoteDetailViewModel) {
        self.viewModel = viewModel
    }

    @ObservedObject private var viewModel: QuoteDetailViewModel
    
    public var body: some View {
        GeometryReader { geometry in
            VStack {
                AsyncImage(url: viewModel.quote.imageURL) { image in
                    image
                        .resizable()
                        .aspectRatio(1, contentMode: .fit)
                        .frame(maxWidth: .infinity)
                } placeholder: {
                    ProgressView()
                        .scaleEffect(2)
                        .frame(width: geometry.size.width, height: geometry.size.width)
                }
                Text(viewModel.quote.text)
                Spacer()
                Button {
                    viewModel.onDeleteTap()
                } label: {
                    Text("Delete quote")
                        .font(.title)
                }
                Spacer()
            }
        }
        .navigationTitle(viewModel.quote.character)
    }
}

struct QuoteDetailView_Preview: PreviewProvider {
    static var previews: some View {
        QuoteDetailAssembly.assembleForPreview()
    }
}
