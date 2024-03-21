//
//  ViewFavoriteButton.swift
//  FindJob
//
//  Created by Vasiliy Vygnych on 19.03.2024.
//

import UIKit
import SnapKit

class CustomFavoriteButton: UIButton {
    
    private var defaults = UserDefaults.standard
    var isFavorite = false
    var mainFavoriteModel: Vacancy?
   
//MARK: init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupeButton()
        self.addTarget(self,
                       action: #selector(favorite),
                       for: .touchUpInside)
        self.tintColor = defaults.colorForKey(key: "color")
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
//MARK: addFavorite
    func addFavorite(model: Vacancy?) {
        guard let newData = model else { return }
        favoriteModel.append(newData)
    }
//MARK: removeFavorite
    func removeFavorite(index: Int) {
        favoriteModel.remove(atOffsets: IndexSet(integer: index))
    }
//MARK: setupeButton
    func setupeButton() {
        if isFavorite == true {
            self.tintColor = UIColor(named: "specialBlue")
            self.setBackgroundImage(UIImage(systemName: "heart.fill"),
                                            for: .normal)
        } else {
            self.setBackgroundImage(UIImage(systemName: "heart"),
                                    for: .normal)
            self.tintColor = .white
        }
    }
}
extension CustomFavoriteButton {
    @objc func favorite() {
        if self.currentBackgroundImage == UIImage(systemName: "heart") {
            self.setBackgroundImage(UIImage(systemName: "heart.fill"),
                                            for: .normal)
            addFavorite(model: mainFavoriteModel)
            isFavorite = true
            setupeButton()
            } else {
                self.setBackgroundImage(UIImage(systemName: "heart"),
                                        for: .normal)
                removeFavorite(index: self.tag)
                isFavorite = false
                setupeButton()
        }
    }
}
