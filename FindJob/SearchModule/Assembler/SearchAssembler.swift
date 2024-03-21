//
//  SearchAssembler.swift
//  FindJob
//
//  Created by Vasiliy Vygnych on 21.03.2024.
//

import UIKit 

protocol SearchAssemblerProtocol {
    func createDetailController(model: Vacancy?) -> UIViewController
}

class SearchAssembler: SearchAssemblerProtocol {
    
    func createDetailController(model: Vacancy?) -> UIViewController {
        let controller = DetailViewController()
        let viewModel: SearchViewModelProtocol = SearchViewModel()
        controller.viewModel = viewModel
        controller.model = model
        return controller
    }
}
