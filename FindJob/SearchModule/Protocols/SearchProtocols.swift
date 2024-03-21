//
//  SearchProtocols.swift
//  FindJob
//
//  Created by Vasiliy Vygnych on 14.03.2024.
//

import UIKit

protocol  SearchViewModelProtocol {
    
    var network: NetworkServisProtocol? { get set }
    var coordinator: SearchCoordinatorProtocol? { get set }
    var model: Box<FindJob?> { get set }
    
    func presentDetailView(model: Vacancy?)
    func viewDidLoad()
    func clickAnimate(button: UIButton)
}
