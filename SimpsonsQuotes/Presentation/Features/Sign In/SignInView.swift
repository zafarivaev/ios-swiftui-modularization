//
//  SignInView.swift
//  Sign In
//
//  Created by Zafar Ivaev on 20/08/23.
//  
//

import SwiftUI

public struct SignInView: View {
    
    init(viewModel: SignInViewModel) {
        self.viewModel = viewModel
    }

    @ObservedObject private var viewModel: SignInViewModel

    public var body: some View {
        ZStack {
            Color(.systemGray3)
                .edgesIgnoringSafeArea(.all)
            if viewModel.isLoading {
                ProgressView()
                    .scaleEffect(2)
            } else {
                Button {
                    viewModel.onSignInTap()
                } label: {
                    Text("Sign In!")
                        .font(.largeTitle)
                }
            }
        }
    }
}

struct SignInView_Preview: PreviewProvider {
    static var previews: some View {
        SignInAssembly.assemble(navigation: nil)
    }
}
