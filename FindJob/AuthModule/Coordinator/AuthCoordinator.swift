//
//  AuthCoordinator.swift
//  FindJob
//
//  Created by Vasiliy Vygnych on 21.03.2024.
//

import UIKit

class AuthCoordinator: AuthCoordinatorProtocol {
    
    var navigationController: UINavigationController?
    var assembler: AuthAssemblerProtocol
    
    init(navigationController: UINavigationController?,
         assembler: AuthAssemblerProtocol = AuthAssembler()) {
        self.navigationController = navigationController
        self.assembler = assembler
    }
    
    func presentValidateView() {
        if let navigationController = navigationController {
            navigationController.pushViewController(assembler.createValidateController(coordinator: self),
                                                    animated: true)
        }
    }
    
    func presentSearchView() {
        if let navigationController = navigationController {
            let coordinator: SearchCoordinatorProtocol = SearchCoordinator(navigationController: navigationController)
            let controller = assembler.createSearchController(coordinator: coordinator)
            navigationController.pushViewController(controller,
                                                    animated: true)
        }
    }
}
