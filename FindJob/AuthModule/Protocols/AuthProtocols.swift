//
//  AuthProtocols.swift
//  FindJob
//
//  Created by Vasiliy Vygnych on 14.03.2024.
//

import UIKit

protocol AuthViewModelProtocol {
    var network: NetworkServisProtocol? { get set }
    var coordinator: AuthCoordinatorProtocol? { get set }
    
    func presentView()
    func presentSearchView()
    func clickAnimate(button: UIButton)
}

protocol AuthCoordinatorProtocol {
    func presentValidateView()
    func presentSearchView()
}

protocol AuthAssemblerProtocol {
    func createValidateController(coordinator: AuthCoordinatorProtocol) -> UIViewController
    func createSearchController(coordinator: SearchCoordinatorProtocol) -> UIViewController
}
