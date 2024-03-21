//
//  FavoritesProtocols.swift
//  FindJob
//
//  Created by Vasiliy Vygnych on 17.03.2024.
//

import UIKit

protocol  FavoritesViewModelProtocol {
    var network: NetworkServisProtocol? { get set }
    var coordinator: SearchCoordinatorProtocol? { get set }
    var model: Box<FindJob?> { get set }
    
    func viewDidLoad()
    func removeFavorite(index: Int?)
    func presentDetailView(model: Vacancy?)
    
}
