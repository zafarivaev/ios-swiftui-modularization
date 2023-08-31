//
//  ___FILENAME___
//  ___PRODUCTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

import SwiftUI

public struct ___VARIABLE_ModuleName___View: View {
    
    init(viewModel: ___VARIABLE_ModuleName___ViewModel) {
        self.viewModel = viewModel
    }

    @ObservedObject private var viewModel: ___VARIABLE_ModuleName___ViewModel

    public var body: some View {
        Text("New module")
    }
}

struct ___VARIABLE_ModuleName___View_Preview: PreviewProvider {
    static var previews: some View {
        ___VARIABLE_ModuleName___Assembly.assemble(navigation: nil)
    }
}
