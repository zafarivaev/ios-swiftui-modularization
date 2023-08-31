//
//  MainAssembly.swift
//  Main
//
//  Created by Zafar Ivaev on 19/08/23.
//  
//

import UIKit

@MainActor
public enum MainAssembly {
    public static func assemble(
        navigation: MainNavigation
    ) -> UITabBarController {
        return MainTabBarController(navigation: navigation)
    }
}
