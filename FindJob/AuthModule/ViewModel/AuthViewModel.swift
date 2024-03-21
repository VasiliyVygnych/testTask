//
//  AuthViewModel.swift
//  FindJob
//
//  Created by Vasiliy Vygnych on 14.03.2024.
//

import UIKit

class AuthViewModel: AuthViewModelProtocol {
    
    var network: NetworkServisProtocol?
    var coordinator: AuthCoordinatorProtocol?
    
    
//MARK: presentView
    func presentView() {
        coordinator?.presentValidateView()
    }
    
    func presentSearchView() {
        coordinator?.presentSearchView()
    }
//MARK: clickAnimate
    func clickAnimate(button: UIButton) {
        UIView.animate(withDuration: 0.2,
                       delay: 0,
                       options: .curveEaseOut,
                       animations: {
            button.transform = CGAffineTransform(scaleX: 0.70,
                                                 y: 0.70)
            }, completion: nil)
        UIView.animate(withDuration: 0.3,
                       delay: 0,
                       options: .curveEaseOut,
                       animations: {
            button.transform = CGAffineTransform(scaleX: 1,
                                                 y: 1)
        }, completion: nil)
    }
}
