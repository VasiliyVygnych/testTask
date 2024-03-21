//
//  HCollectionViewCell.swift
//  FindJob
//
//  Created by Vasiliy Vygnych on 15.03.2024.
//

import UIKit
import SnapKit

class HCollectionViewCell: UICollectionViewCell {
    
    var viewModel: SearchViewModelProtocol?
    
//MARK: UIImageView
    var imageView: UIImageView = {
       let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 15
        return image
    }()
//MARK: UILabel
     var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 15,
                                 weight: .regular)
        return label
     }()
//MARK: UIButton
    var cellButton: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("button",
                        for: .normal)
        button.setTitleColor(UIColor(named: "basikGreen"),
                             for: .normal)
        return button
    }()
//MARK: init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupeView()
        setupeConstraint()
        setupeButton()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
//MARK: configure
    func configure(data: Model) {
        titleLabel.text = data.title
        var buttonTitle = data.subtitle
        cellButton.setTitle(buttonTitle,
                            for: .normal)
        if buttonTitle == nil {
            cellButton.isHidden = true
        } else {
            cellButton.isHidden = false
        }
    }
//MARK: setupeView
   private func setupeView() {
       contentView.backgroundColor = UIColor(named: "basikGray")
       contentView.layer.cornerRadius = 10
       contentView.addSubview(imageView)
       contentView.addSubview(titleLabel)
       contentView.addSubview(cellButton)
    }
//MARK: setupeConstraint
    private func setupeConstraint() {
        imageView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(Constants.Constraints.gap_10)
            make.left.equalTo(Constants.Constraints.gap_10)
            make.width.height.equalTo(32)
        }
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).inset(-5)
            make.left.equalTo(Constants.Constraints.gap_10)
            make.width.equalTo(120)
            make.height.greaterThanOrEqualTo(34)
        }
        cellButton.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).inset(-5)
            make.left.equalTo(Constants.Constraints.gap_10)
            make.width.lessThanOrEqualTo(100)
            make.height.equalTo(17)
        }
    }
//MARK: setupeButton
    private func setupeButton() {
        cellButton.addTarget(self,
                             action: #selector(tapCell),
                             for: .touchUpInside)
    }
    @objc func tapCell() {
        print("tap \(cellButton.tag) cell")
    }
}
