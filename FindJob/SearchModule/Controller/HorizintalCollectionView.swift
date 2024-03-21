//
//  HorizintalCollectionView.swift
//  FindJob
//
//  Created by Vasiliy Vygnych on 15.03.2024.
//

import UIKit
import SnapKit

class HorizintalCollectionView: UIView {
    
//MARK: - collectionView & FlowLayout
    private lazy var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = .init(width: 142,
                                height: 130)
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 5
        layout.sectionInset = .init(top: 10,
                                    left: 16,
                                    bottom: 10,
                                    right: 16)
        return layout
    }()
    private lazy var collectionView: UICollectionView = {
       let collectionView = UICollectionView(frame: .zero,
                                             collectionViewLayout: self.layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.contentMode = .scaleAspectFit
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
   }()
    init() {
        super.init(frame: .zero)
        setupeCollectionView()
        initialization()
        setupeConstraint()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
private extension HorizintalCollectionView {
//MARK: initialization
    func initialization() {
        self.addSubview(collectionView)
    }
//MARK: setupeCollectionView
    private func setupeCollectionView() {
        collectionView.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(HCollectionViewCell.self,
                                forCellWithReuseIdentifier: "cell")
    }
//MARK: setupeConstraint
    func setupeConstraint() {
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
// MARK: - extension for UICollectionView
extension HorizintalCollectionView: UICollectionViewDataSource,
                            UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        modelH.count
    }
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell",
                                                      for: indexPath) as? HCollectionViewCell
        let model = modelH[indexPath.item]
        cell?.configure(data: model)
        cell?.imageView.image = model.image[indexPath.item]
        cell?.cellButton.tag = indexPath.item
        return cell ?? UICollectionViewCell()
    }
}
