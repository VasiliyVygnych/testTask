//
//  SearchController.swift
//  FindJob
//
//  Created by Vasiliy Vygnych on 14.03.2024.
//

import UIKit
import UIKit

final class SearchController: BaseViewController {
    
    var viewModel: SearchViewModelProtocol?
   
    private var model: FindJob? {
        didSet {
            collectionView.reloadData()
        }
    }
    
    private var buttonImage: UIImageView = {
       let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "settings")
        return image
    }()
    private var searchImage: UIImageView = {
       let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.image = UIImage(named: "search")
        return image
    }()
//MARK: UIView
    private var topCollectionView: HorizintalCollectionView = {
       let view = HorizintalCollectionView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private var searchView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        return view
    }()
//MARK: UISearchBar
    private var searchBar: UISearchBar = {
        let view = UISearchBar()
        view.layer.cornerRadius = 15
        view.backgroundColor = .white
        view.searchTextField.backgroundColor = UIColor(named: "basikGray")
        view.barTintColor = .clear
        view.searchTextField.textColor = .white
        return view
    }()
//MARK: UIButton
    private lazy var settingsButton: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .white
        button.backgroundColor = UIColor(named: "basikGray")
        button.layer.cornerRadius = Constants.CornerRadius.radius_10
        return button
    }()
    private var moreVacanciesButton: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .white
        button.backgroundColor = UIColor(named: "specialBlue")
        button.layer.cornerRadius = Constants.CornerRadius.radius_10
        return button
    }()
//MARK: UILabel
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 22,
                                 weight: .bold)
        label.text = "Вакансии для вас"
        label.textColor = .white
       return label
    }()
    private var searchLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightGray
        label.text = Constants.Text.textLoginLabel
        label.font = .systemFont(ofSize: 16,
                                 weight: .regular)
        label.text = "Должность, ключевые слова"
        return label
    }()
//MARK: - collectionView & FlowLayout
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
        setupeButton()
        viewModel?.viewDidLoad()
        viewModel?.model.bind({ [weak self] data in
            guard let model = data else { return }
            self?.model = model
        })
        searchBar.delegate = self
    }
//MARK: viewWillAppear
    override func viewWillAppear(_ animated: Bool) {
        settingUpTheView(.search)
        navigationController?.navigationBar.isHidden = true
    }
//MARK: addSubview
    private func addSubview() {
        view.addSubview(searchView)
        searchView.addSubview(settingsButton)
        searchView.addSubview(searchBar)
        searchBar.addSubview(searchImage)
        searchBar.addSubview(searchLabel)
        view.addSubview(topCollectionView)
        view.addSubview(titleLabel)
        view.addSubview(collectionView)
        view.addSubview(moreVacanciesButton)
        settingsButton.addSubview(buttonImage)
    }
//MARK: setupeCollectionView
    private func setupeCollectionView() {
        collectionView.backgroundColor = .clear
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(VCollectionViewCell.self,
                                forCellWithReuseIdentifier: "viewCell")
    }
//MARK: сreatedConstraints
    private func сreatedConstraints() {
        searchView.snp.makeConstraints { make in
            make.top.equalTo(48)
            make.width.equalToSuperview()
            make.height.equalTo(50)
        }
        searchBar.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(Constants.Constraints.gap_16)
            make.right.equalTo(settingsButton.snp.left).inset(-5)
            make.height.equalTo(40)
        }
        settingsButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.width.height.equalTo(40)
            make.right.equalTo(-Constants.Constraints.gap_16)
        }
        buttonImage.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.width.height.equalTo(24)
        }
        topCollectionView.snp.makeConstraints { make in
            make.top.equalTo(searchView.snp.bottom).inset(-10)
            make.width.equalToSuperview()
            make.height.equalTo(140)
        }
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(topCollectionView.snp.bottom).inset(-10)
            make.width.equalToSuperview()
            make.left.equalTo(Constants.Constraints.gap_16)
            make.height.equalTo(24)
        }
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).inset(-20)
            make.width.equalToSuperview()
            make.bottom.equalTo(moreVacanciesButton.snp.top).inset(-20)
        }
        moreVacanciesButton.snp.makeConstraints { make in
            make.width.equalToSuperview().inset(Constants.Constraints.gap_16)
            make.left.equalTo(Constants.Constraints.gap_16)
            make.bottom.equalToSuperview().inset(95)
            make.height.equalTo(48)
        }
        searchImage.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(20)
            make.width.height.equalTo(24)
        }
        searchLabel.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
    }
//MARK: setupeButton
    private func setupeButton() { 
        settingsButton.addTarget(self,
                                 action: #selector(settings),
                                 for: .touchUpInside)
        moreVacanciesButton.addTarget(self,
                                      action: #selector(moreVacancies),
                                      for: .touchUpInside)
    }
}
extension SearchController {
    @objc func settings() {
        viewModel?.clickAnimate(button: settingsButton)
        print("settings")
    }
    @objc func moreVacancies() {
        print("moreVacancies")
    }
}
//MARK: - extension for UICollectionView
extension SearchController: UICollectionViewDataSource,
                            UICollectionViewDelegate,
                            UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        model?.vacancies.count ?? 0
    }
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "viewCell",
                                                      for: indexPath) as? VCollectionViewCell,
              let model = self.model?.vacancies[indexPath.item],
              var count = self.model?.vacancies.count else { return UICollectionViewCell() }
        cell.configure(data: model)
        cell.viewModel = self.viewModel
        cell.respondButton.tag = indexPath.item
        cell.favoritButton.tag = indexPath.row
        moreVacanciesButton.setTitle("Еще \(count) вакансий",
                                           for: .normal)
        return cell
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
extension SearchController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar,
                   textDidChange searchText: String) {
        searchLabel.isHidden = true
        searchImage.isHidden = true
    }
}
