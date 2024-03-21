//
//  FavoriteController.swift
//  FindJob
//
//  Created by Vasiliy Vygnych on 14.03.2024.
//

import UIKit
import SnapKit

class FavoriteController: BaseViewController {
    
    var viewModel: FavoritesViewModelProtocol?
    let viewModelSearch: SearchViewModelProtocol = SearchViewModel()
 
    private var model: FindJob? {
        didSet {
            collectionView.reloadData()
        }
    }
    
//MARK: UILabel
    private var headerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 22,
                                 weight: .bold)
        label.text = "Избранное"
        label.textColor = .white
       return label
    }()
    private var countLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 14,
                                 weight: .regular)
        label.textColor = .lightGray
       return label
    }()
//MARK: collectionView & FlowLayout
    private lazy var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 10
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
        collectionView.showsVerticalScrollIndicator = false
        return collectionView
   }()
//MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubview()
        setupeCollectionView()
        сreatedConstraints()
        viewModel?.viewDidLoad()
        viewModel?.model.bind({ data in
            guard let model = data else { return }
            self.model = model
        })
    }
//MARK: addSubview
    private func addSubview() {
        view.addSubview(collectionView)
        view.addSubview(countLabel)
        view.addSubview(headerLabel)
    }
//MARK: setupeCollectionView
    private func setupeCollectionView() {
        collectionView.backgroundColor = .clear
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(VCollectionViewCell.self,
                                forCellWithReuseIdentifier: "viewCell")
    }
    private func сreatedConstraints() {
        headerLabel.snp.makeConstraints { make in
            make.top.equalTo(100)
            make.width.equalToSuperview()
            make.left.equalTo(Constants.Constraints.gap_16)
            make.height.equalTo(30)
        }
        countLabel.snp.makeConstraints { make in
            make.top.equalTo(headerLabel.snp.bottom).inset(-10)
            make.width.equalToSuperview()
            make.left.equalTo(Constants.Constraints.gap_16)
            make.height.equalTo(20)
        }
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(countLabel.snp.bottom).inset(-10)
            make.width.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
//MARK: viewWillAppear
    override func viewWillAppear(_ animated: Bool) {
        settingUpTheView(.favorites)
        collectionView.reloadData()
        countLabel.text = "\(favoriteModel.count) вакансий"
    }
}
//MARK: - extension for UICollectionView
extension FavoriteController: UICollectionViewDataSource,
                            UICollectionViewDelegate,
                            UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        favoriteModel.count
    }
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "viewCell",
                                                      for: indexPath) as? VCollectionViewCell
        let model = favoriteModel[indexPath.item]
        cell?.configure(data: model)
        cell?.favoritButton.tag = indexPath.item
        cell?.viewModel = viewModelSearch
        cell?.respondButton.tag = indexPath.item
        cell?.favoritButton.isFavorite = true
        cell?.favoritButton.setupeButton()
        return cell ?? UICollectionViewCell()
    }
// MARK: - didSelectItemAt
    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
        let collectionView = self.collectionView.cellForItem(at: indexPath)
        guard let model = self.model?.vacancies[indexPath.item] else { return }
        UIView.animate(withDuration: 0.3,
                       delay: 0,
                       options: .curveEaseOut,
                       animations: {
            collectionView?.transform = CGAffineTransform(scaleX: 0.75,
                                                          y: 0.75)
        }, completion: { finished in
            self.viewModel?.presentDetailView(model: model)
        })
        UIView.animate(withDuration: 0.4,
                       delay: 0,
                       options: .curveEaseOut,
                       animations: {
            collectionView?.transform = CGAffineTransform(scaleX: 1,
                                                          y: 1)
        }, completion: nil)
    }
//MARK: - sizeForItemAt
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width  = collectionView.frame.width - 16
        return CGSize(width: width,
                      height: 286)
    }
}
