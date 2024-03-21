//
//  SearchCoordinator.swift
//  FindJob
//
//  Created by Vasiliy Vygnych on 21.03.2024.
//

import UIKit

protocol SearchCoordinatorProtocol {
    
    func presentDetailView(model: Vacancy?)
    
}

class SearchCoordinator: SearchCoordinatorProtocol {
    
    var navigationController: UINavigationController?
    var assembler: SearchAssemblerProtocol
    
    init(navigationController: UINavigationController?,
         assembler: SearchAssemblerProtocol = SearchAssembler()) {
        self.navigationController = navigationController
        self.assembler = assembler
    }
    
    func presentDetailView(model: Vacancy?) {
        if let navigationController = navigationController {
            navigationController.pushViewController(assembler.createDetailController(model: model),
                                                    animated: true)
        }
    }

}
