//
//  FavoritesViewModel.swift
//  FindJob
//
//  Created by Vasiliy Vygnych on 17.03.2024.
//

import Foundation

import UIKit

class FavoritesViewModel: FavoritesViewModelProtocol {

    var network: NetworkServisProtocol?
    var coordinator: SearchCoordinatorProtocol?
    var model: Box<FindJob?> = Box(nil)
    
//MARK: presentDetailView
    func presentDetailView(model: Vacancy?) {
        coordinator?.presentDetailView(model: model)
    }
//MARK: viewDidLoad
    func viewDidLoad() {
        network?.vacancies(completion: { [weak self] data in
            DispatchQueue.main.async {
                self?.model.value = data
            }
        })
    }
//MARK: removeFavorite
    func removeFavorite(index: Int?) {
        favoriteModel.remove(at: index ?? 0)
    }
}
