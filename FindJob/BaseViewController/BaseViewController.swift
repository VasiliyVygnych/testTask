//
//  BaseViewController.swift
//  FindJob
//
//  Created by Vasiliy Vygnych on 14.03.2024.
//

import UIKit

class BaseViewController: UIViewController {
    
    private var navigationTitle = UILabel()
    private let appearance = UINavigationBarAppearance()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.titleView = navigationTitle
        navigationTitle.textColor = .white
        navigationController?.navigationBar.isHidden = false
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .white
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.standardAppearance = appearance
    }
}
//MARK: - Navigations
extension BaseViewController {
    func backButtonNavBar(with selector: Selector,
                          image: UIImage?,
                          tintColor: UIColor?) {
        let backButton = UIButton(type: .custom)
        backButton.tintColor = tintColor
        backButton.setImage(image,
                            for: .normal)
        backButton.addTarget(self,
                             action: selector,
                             for: .touchUpInside)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
    }
}
//MARK: - setting up the view
extension BaseViewController {
    func settingUpTheView(_ controller: Controllers) {
        switch controller {
        case .auth:
            navigationController?.navigationBar.backgroundColor = .clear
            view.backgroundColor = .black
            navigationTitle.text = Constants.Text.navtitleAuth
            navigationTitle.font = .systemFont(ofSize: 16,
                                               weight: .bold)
            appearance.backgroundColor = .black
            navigationController?.navigationBar.scrollEdgeAppearance = appearance
        case .search:
            view.backgroundColor = .black
        case .favorites:
            navigationController?.navigationBar.backgroundColor = .clear
            view.backgroundColor = .black
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = .black
            navigationController?.navigationBar.scrollEdgeAppearance = appearance
            navigationController?.navigationBar.standardAppearance = appearance
        case .responses:
            appearance.backgroundColor = .black
            navigationController?.navigationBar.scrollEdgeAppearance = appearance
            view.backgroundColor = .red
        case .messages:
            appearance.backgroundColor = .black
            navigationController?.navigationBar.scrollEdgeAppearance = appearance
            view.backgroundColor = .green
        case .profile:
            appearance.backgroundColor = .black
            navigationController?.navigationBar.scrollEdgeAppearance = appearance
            view.backgroundColor = .blue
        case .none:
            view.backgroundColor = .black
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = .black
            navigationController?.navigationBar.scrollEdgeAppearance = appearance
            navigationController?.navigationBar.standardAppearance = appearance
        }
    }
}
