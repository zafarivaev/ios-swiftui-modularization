//
//  SettingsView.swift
//  Settings
//
//  Created by Zafar Ivaev on 19/08/23.
//  
//

import SwiftUI

public struct SettingsView: View {
    
    init(viewModel: SettingsViewModel) {
        self.viewModel = viewModel
    }

    @ObservedObject private var viewModel: SettingsViewModel

    public var body: some View {
        ZStack {
            Color(uiColor: .systemFill)
                .edgesIgnoringSafeArea(.all)
            if viewModel.isLoading {
                ProgressView()
                    .scaleEffect(2)
            } else {
                Button {
                    viewModel.onSignOutTapped()
                } label: {
                    Text("Sign Out")
                        .font(.largeTitle)
                }
            }
        }
    }
}

struct SettingsView_Preview: PreviewProvider {
    static var previews: some View {
        SettingsAssembly.assemble(navigation: nil)
    }
}
