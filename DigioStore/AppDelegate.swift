//
//  AppDelegate.swift
//  DigioStore
//
//  Created by Johnatas Rodrigues on 15/06/23.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let productService = ProductService()
        let homeViewModel = HomeViewModel(productService: productService)
        let homeViewController = HomeViewController(viewModel: homeViewModel)
        window?.rootViewController = homeViewController
        window?.makeKeyAndVisible()

        return true
    }
}
