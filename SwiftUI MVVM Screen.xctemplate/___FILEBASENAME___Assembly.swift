//
//  ___FILENAME___
//  ___PRODUCTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

import UIKit

@MainActor
public enum ___VARIABLE_ModuleName___Assembly {
    public static func assemble(
        navigation: ___VARIABLE_ModuleName___Navigation?
    ) -> ___VARIABLE_ModuleName___View {
        let worker: ___VARIABLE_ModuleName___WorkerProtocol = ___VARIABLE_ModuleName___Worker()
        let viewModel = ___VARIABLE_ModuleName___ViewModel(worker: worker, navigation: navigation)
        return ___VARIABLE_ModuleName___View(viewModel: viewModel)
    }
}
