//
//  TableViewCell.swift
//  FindJob
//
//  Created by Vasiliy Vygnych on 17.03.2024.
//

import UIKit
import SnapKit

class TableViewCell: UITableViewCell {
    
//MARK: - UIView
    private var titleView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "basikGray")
        view.layer.cornerRadius = 15
        return view
    }()
//MARK: - UILabel
     var titleLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 17,
                                 weight: .semibold)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
//MARK: - init
    override init(style: UITableViewCell.CellStyle,
                  reuseIdentifier: String?) {
        super.init(style: style,
                   reuseIdentifier: reuseIdentifier)
        addSubview()
        сreatedConstraints()
        self.backgroundColor = .clear
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
private extension TableViewCell {
//MARK: - addSubview
    func addSubview() {
        contentView.addSubview(titleView)
        titleView.addSubview(titleLabel)
    }
//MARK: - setupeConstraint
    func сreatedConstraints() {
        titleView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.width.greaterThanOrEqualTo(40)
            make.height.equalTo(33)
            make.left.equalTo(Constants.Constraints.gap_16)
        }
        titleLabel.snp.makeConstraints { make in
            make.centerY.centerX.equalToSuperview()
            make.width.equalToSuperview().inset(10)
            make.height.equalTo(24)
            make.left.equalTo(10)
        }
    }
}
