//
//  VCollectionViewCell.swift
//  FindJob
//
//  Created by Vasiliy Vygnych on 15.03.2024.
//

import UIKit
import SnapKit


class VCollectionViewCell: UICollectionViewCell {
    
    var viewModel: SearchViewModelProtocol?
    var favoritButton = CustomFavoriteButton()
    
//MARK: UILabel
    private var watchingCountLabel: UILabel = {
        let label = UILabel()
         label.translatesAutoresizingMaskIntoConstraints = false
         label.numberOfLines = 3
        label.textColor = UIColor(named: "basikGreen")
         return label
     }()
    private var vacancyTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 22,
                                 weight: .semibold)
        label.textColor = .white
        return label
    }()
    private var salaryTitle: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 24,
                                 weight: .bold)
        label.textColor = .white
        return label
    }()
    private var cityLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 17,
                                 weight: .regular)
        label.textColor = .white
        return label
    }()
    private var employerNameLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 17,
                                 weight: .regular)
        label.textColor = .white
        return label
    }()
    private var requirementsLabel: UILabel = {
        let label = UILabel()
         label.translatesAutoresizingMaskIntoConstraints = false
         label.font = .systemFont(ofSize: 15,
                                  weight: .regular)
         label.textColor = .white
         return label
     }()
    private var dataLabel: UILabel = {
        let label = UILabel()
         label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(named: "lightBasikGray")
        label.font = .systemFont(ofSize: 15,
                                 weight: .regular)
         return label
     }()
    var respondButton: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(Constants.Text.respond,
                        for: .normal)
        button.backgroundColor = UIColor(named: "basikGreen")
        button.layer.cornerRadius = 15
        return button
    }()
//MARK: UIimageView
    private let briefCase: UIImageView = {
       let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "briefcase")
        image.tintColor = .white
        return image
    }()
//MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(vacancyTitle)
        contentView.addSubview(salaryTitle)
        contentView.addSubview(cityLabel)
        contentView.addSubview(employerNameLabel)
        contentView.addSubview(requirementsLabel)
        contentView.addSubview(dataLabel)
        contentView.addSubview(watchingCountLabel)
        self.addSubview(respondButton)
        contentView.addSubview(favoritButton)
        contentView.addSubview(briefCase)
        setupeView()
        setupeConstraint()
        setupeButton()
        
//        favoritButton.setupeButton()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
//MARK: - setupeView
    private func setupeView() {
        contentView.backgroundColor = UIColor(named: "basikGray")
        contentView.layer.cornerRadius = 10
    }
//MARK: configure
    func configure(data: Vacancy?) {
        favoritButton.mainFavoriteModel = data
        if data?.lookingNumber == nil {
            watchingCountLabel.text = nil
        } else {
            watchingCountLabel.text = "\(Constants.Text.watchingCount) \(data?.lookingNumber ?? 0) \(Constants.Text.persons)"
        }
        vacancyTitle.text = data?.title
        salaryTitle.text = data?.salary.short
        cityLabel.text = data?.address.town
        employerNameLabel.text = data?.company
        requirementsLabel.text = data?.experience.previewText
        dataLabel.text = data?.publishedDate
    }
//MARK: - setupeConstraint
    private func setupeConstraint() {
        watchingCountLabel.snp.makeConstraints { make in
            make.top.equalTo(20)
            make.left.equalTo(Constants.Constraints.gap_16)
            make.width.equalToSuperview().inset(Constants.Constraints.gap_16)
        }
        vacancyTitle.snp.makeConstraints { make in
            make.top.equalTo(watchingCountLabel.snp.bottom).inset(-10)
            make.left.equalTo(Constants.Constraints.gap_16)
            make.width.equalTo(300)
        }
        salaryTitle.snp.makeConstraints { make in
            make.top.equalTo(vacancyTitle.snp.bottom).inset(-10)
            make.left.equalTo(Constants.Constraints.gap_16)
            make.width.equalToSuperview().inset(Constants.Constraints.gap_16)
            make.height.equalTo(24)
        }
        cityLabel.snp.makeConstraints { make in
            make.top.equalTo(salaryTitle.snp.bottom).inset(-10)
            make.left.equalTo(Constants.Constraints.gap_16)
            make.width.equalTo(200)
        }
        employerNameLabel.snp.makeConstraints { make in
            make.top.equalTo(cityLabel.snp.bottom).inset(-10)
            make.left.equalTo(Constants.Constraints.gap_16)
            make.width.equalTo(270)
        }
        requirementsLabel.snp.makeConstraints { make in
            make.top.equalTo(employerNameLabel.snp.bottom).inset(-10)
            make.left.equalTo(briefCase.snp.right).inset(-5)
            make.width.equalTo(270)
        }
        briefCase.snp.makeConstraints { make in
            make.top.equalTo(employerNameLabel.snp.bottom).inset(-11)
            make.left.equalTo(Constants.Constraints.gap_16)
            make.width.equalTo(20)
            make.height.equalTo(15)
        }
        dataLabel.snp.makeConstraints { make in
            make.top.equalTo(requirementsLabel.snp.bottom).inset(-10)
            make.left.equalTo(Constants.Constraints.gap_16)
            make.width.equalTo(360)
        }
        favoritButton.snp.makeConstraints { make in
            make.top.equalTo(10)
            make.right.equalTo(-Constants.Constraints.gap_16)
            make.width.equalTo(30)
            make.height.equalTo(28)
        }
        respondButton.snp.makeConstraints { make in
            make.width.equalTo(350)
            make.height.equalTo(35)
            make.centerX.equalToSuperview()
            make.bottom.equalTo(-15)
        }
    }
//MARK: setupeButton
    private func setupeButton() {
        respondButton.addTarget(self,
                                action: #selector(tapCell),
                                for: .touchUpInside)
    }
    @objc func tapCell() {
        print("tap \(respondButton.tag) cell")
    }
}
