//
//  StartView.swift
//  Start
//
//  Created by Zafar Ivaev on 20/08/23.
//  
//

import SwiftUI

public struct StartView: View {
    
    init(viewModel: StartViewModel) {
        self.viewModel = viewModel
    }

    @ObservedObject private var viewModel: StartViewModel

    public var body: some View {
        Color(.systemCyan)
            .edgesIgnoringSafeArea(.all)
            .onAppear {
                viewModel.onViewAppear()
            }
    }
}

struct StartView_Preview: PreviewProvider {
    static var previews: some View {
        StartAssembly.assemble(navigation: nil)
    }
}
