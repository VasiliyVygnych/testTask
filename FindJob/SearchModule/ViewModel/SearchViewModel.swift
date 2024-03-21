//
//  SearchViewModel.swift
//  FindJob
//
//  Created by Vasiliy Vygnych on 14.03.2024.
//

import UIKit

class SearchViewModel: SearchViewModelProtocol {
    
    var network: NetworkServisProtocol?
    var coordinator: SearchCoordinatorProtocol?
    var model: Box<FindJob?> = Box(nil)

//MARK: viewDidLoad
    func viewDidLoad() {
        network?.vacancies(completion: { [weak self] data in
            DispatchQueue.main.async {
                self?.model.value = data
            }
        })
    }
//MARK: presentDetailView
    func presentDetailView(model: Vacancy?) {
        coordinator?.presentDetailView(model: model)
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
