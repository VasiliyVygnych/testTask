//
//  Tab.swift
//  FindJob
//
//  Created by Vasiliy Vygnych on 21.03.2024.
//

import UIKit
import SnapKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.modalPresentationStyle = .fullScreen
        self.tabBar.tintColor = UIColor(named: "basikBlue")
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .black
        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
        viewControllers = [createAuthСontroller(),
                           createFavoriteController(),
                           createResponsesController(),
                           createMessegerController(),
                           createProfileController()]  
    }
    
//MARK: createAuthСontroller
    func createAuthСontroller() -> UINavigationController {
        let controller = AuthController()
        var viewModel: AuthViewModelProtocol = AuthViewModel()
        let navController = UINavigationController(rootViewController: controller)
        let newtwork: NetworkServisProtocol = NetworkServis()
        let coordinator: AuthCoordinatorProtocol = AuthCoordinator(navigationController: navController)
        controller.viewModel = viewModel
        viewModel.network = newtwork
        viewModel.coordinator = coordinator
        controller.tabBarItem = UITabBarItem(title: "Поиск",
                                       image: UIImage(named: "search"),
                                       tag: 0)
        return navController
    }
//MARK: createFavoriteController
    func createFavoriteController() -> UINavigationController {
        let controller = FavoriteController()
        let navController = UINavigationController(rootViewController: controller)
        var viewModel: FavoritesViewModelProtocol = FavoritesViewModel()
        let newtwork: NetworkServisProtocol = NetworkServis()
        let coordinator: SearchCoordinatorProtocol = SearchCoordinator(navigationController: navController)
        controller.viewModel = viewModel
        viewModel.network = newtwork
        viewModel.coordinator = coordinator
        controller.tabBarItem = UITabBarItem(title: "Favorite",
                                             image: UIImage(systemName: "heart"),
                                             tag: 1)
        return navController
    }
//MARK: createResponsesController
    func createResponsesController() -> UINavigationController {
        let controller = ResponsesController()
        let navController = UINavigationController(rootViewController: controller)
        controller.tabBarItem = UITabBarItem(title: "Responses",
                                             image: UIImage(named: "responses"),
                                             tag: 2)
        return navController
    }
//MARK: createMessegerController
    func createMessegerController() -> UINavigationController {
        let controller = MessegerController()
        let navController = UINavigationController(rootViewController: controller)
        controller.tabBarItem = UITabBarItem(title: "Messeger",
                                             image: UIImage(named: "messegers"),
                                             tag: 3)
        return navController
    }
//MARK: createProfileController
    func createProfileController() -> UINavigationController {
        let controller = ProfileController()
        let navController = UINavigationController(rootViewController: controller)
        controller.tabBarItem = UITabBarItem(title: "Profile",
                                             image: UIImage(named: "profile"),
                                             tag: 4)
        return navController
    }
}
