//
//  AuthAssembler.swift
//  FindJob
//
//  Created by Vasiliy Vygnych on 21.03.2024.
//

import UIKit

class AuthAssembler: AuthAssemblerProtocol {
    
    func createValidateController(coordinator: AuthCoordinatorProtocol) -> UIViewController {
        let controller = ValidateController()
        var viewModel: AuthViewModelProtocol = AuthViewModel()
        let newtwork: NetworkServisProtocol = NetworkServis()
        controller.viewModel = viewModel
        viewModel.network = newtwork
        viewModel.coordinator = coordinator
        return controller
    }
    
    func createSearchController(coordinator: SearchCoordinatorProtocol) -> UIViewController {
        let controller = SearchController()
        var viewModel: SearchViewModelProtocol = SearchViewModel()
        let newtwork: NetworkServisProtocol = NetworkServis()
        controller.viewModel = viewModel
        viewModel.network = newtwork
        viewModel.coordinator = coordinator
        return controller
    }
}
