//
//  DetailViewController.swift
//  FindJob
//
//  Created by Vasiliy Vygnych on 15.03.2024.
//

import UIKit
import SnapKit

class DetailViewController: BaseViewController {
    
    var viewModel: SearchViewModelProtocol?
    var favoriteButton = CustomFavoriteButton()
    private lazy var height = 0
    private lazy var rowHeight: CGFloat = 45
    
    var model: Vacancy? {
        didSet {
            configure(model: model)
            tableView.reloadData()
            let count = model?.questions.count ?? 0
            height = (count * Int(rowHeight))
            favoriteButton.mainFavoriteModel = model
        }
    }
    
//MARK: UIScrollView
    private var scrollView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.showsVerticalScrollIndicator = false
        view.alwaysBounceVertical = true
        view.contentSize = CGSize(width: view.frame.width,
                                  height: view.frame.height)
        return view
    }()
//MARK: UILabel
    private var vacancyTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 24,
                                 weight: .bold)
        label.textColor = .white
        return label
    }()
    private var salaryTitle: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16,
                                 weight: .bold)
        label.textColor = .white
        return label
    }()
    private var requirementsLabel: UILabel = {
        let label = UILabel()
         label.translatesAutoresizingMaskIntoConstraints = false
         label.font = .systemFont(ofSize: 12,
                                  weight: .regular)
         label.textColor = .white
         return label
     }()
    private var experienceLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 17,
                                 weight: .regular)
        label.textColor = .white
        return label
    }()
    private var employerLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16,
                                 weight: .bold)
        label.textColor = .white
        return label
    }()
    private var addressLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14,
                                 weight: .regular)
        label.textColor = .white
        return label
    }()
    private var infoLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14,
                                 weight: .regular)
        label.textColor = .white
        label.numberOfLines = 0
        return label
    }()
    private var firstinfoLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14,
                                 weight: .regular)
        label.textColor = .white
        label.numberOfLines = 0
        return label
    }()
    private var secondinfoLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14,
                                 weight: .regular)
        label.textColor = .white
        label.numberOfLines = 0
        return label
    }()
    private var dutiesLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 24,
                                 weight: .bold)
        label.textColor = .white
        label.text = Constants.Text.dutiesLabel
        return label
    }()
    private var dutiesTitle: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14,
                                 weight: .regular)
        label.textColor = .white
        label.numberOfLines = 0
        return label
    }()
    private var questionEmployerLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16,
                                 weight: .bold)
        label.textColor = .white
        return label
    }()
    private var questionTitle: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16,
                                 weight: .regular)
        label.textColor = UIColor(named: "lightBasikGray")
        return label
    }()
//MARK: UITableView
    private var tableView: UITableView = {
       let view = UITableView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
//MARK: UIView
    private var firstInfoView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "darkGreen")
        view.layer.cornerRadius = 10
        return view
    }()
    private var secondInfoView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "darkGreen")
        view.layer.cornerRadius = 10
        return view
    }()
    private var employerInfoView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "basikGray")
        view.layer.cornerRadius = 10
        return view
    }()
    private var mapInfoView: UIImageView = { //test
       let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.layer.cornerRadius = 10
        view.image = UIImage(named: "map")
        return view
    }()
//MARK: UIImageView
    private var firstimageView: UIImageView = {
       let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 8
        image.image = UIImage(named: "person")
        return image
    }()
    private var secondimageView: UIImageView = {
       let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 8
        image.image = UIImage(named: "eye")
        return image
    }()
//MARK: UIButton
    private var respondButton: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(Constants.Text.respond,
                        for: .normal)
        button.backgroundColor = UIColor(named: "basikGreen")
        button.layer.cornerRadius = 10
        return button
    }()
    private var hideButton: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(UIImage(named: "detailEye"),
                                  for: .normal)
        button.tintColor = .white
        return button
    }()
//MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubview()
        setupeTableView()
        сreatedConstraints()
        setupeButton()
    }
//MARK: viewWillAppear
    override func viewWillAppear(_ animated: Bool) {
        settingUpTheView(.none)
//        favoriteButton.setupeButton()
    }
//MARK: addSubview
    private func addSubview() {
        view.addSubview(scrollView)
        scrollView.addSubview(vacancyTitle)
        scrollView.addSubview(salaryTitle)
        scrollView.addSubview(requirementsLabel)
        scrollView.addSubview(experienceLabel)
        scrollView.addSubview(firstInfoView)
        scrollView.addSubview(secondInfoView)
        firstInfoView.addSubview(firstimageView)
        secondInfoView.addSubview(secondimageView)
        firstInfoView.addSubview(firstinfoLabel)
        secondInfoView.addSubview(secondinfoLabel)
        scrollView.addSubview(employerInfoView)
        employerInfoView.addSubview(employerLabel)
        employerInfoView.addSubview(mapInfoView)
        employerInfoView.addSubview(addressLabel)
        scrollView.addSubview(infoLabel)
        scrollView.addSubview(dutiesLabel)
        scrollView.addSubview(dutiesTitle)
        scrollView.addSubview(questionEmployerLabel)
        questionEmployerLabel.text = Constants.Text.questionEmployerLabel
        scrollView.addSubview(questionTitle)
        questionTitle.text = Constants.Text.questionTitle
        scrollView.addSubview(tableView)
        scrollView.addSubview(respondButton)
    }
//MARK: configure
    func configure(model: Vacancy?) {
        guard let data = model else {  return }
        let address = "\(data.address.town), \(data.address.street) \(data.address.house)"
        vacancyTitle.text = model?.title
        salaryTitle.text = model?.salary.full
        requirementsLabel.text = model?.experience.previewText
        experienceLabel.text = model?.schedules.first
        employerLabel.text = model?.company
        addressLabel.text = address
        infoLabel.text = model?.description
        dutiesTitle.text = model?.responsibilities
        
        if model?.lookingNumber == nil {
            secondInfoView.isHidden = true
        } else {
            secondinfoLabel.text = "\(model?.lookingNumber ?? 0) \(Constants.Text.textLookingNumber)"
        }
        if model?.appliedNumber == nil {
            firstInfoView.isHidden = true
        } else {
            firstinfoLabel.text = "\(model?.appliedNumber ?? 0) \(Constants.Text.textAppliedNumber)"
        }
    }
//MARK: setupeTableView
    private func setupeTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = rowHeight
        tableView.backgroundColor = .clear
        tableView.separatorColor = .clear
        tableView.bounces = false
        tableView.allowsSelection = false
        tableView.register(TableViewCell.self,
                           forCellReuseIdentifier: "cell")
    }
//MARK: сreatedConstraints
    private func сreatedConstraints() {
        scrollView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(100)
            make.width.equalToSuperview()
            make.bottom.equalToSuperview().inset(100)
        }
        vacancyTitle.snp.makeConstraints { make in
            make.top.equalTo(10)
            make.left.equalTo(Constants.Constraints.gap_16)
            make.width.equalToSuperview().inset(Constants.Constraints.gap_16)
            make.height.greaterThanOrEqualTo(26)
        }
        salaryTitle.snp.makeConstraints { make in
            make.top.equalTo(vacancyTitle.snp.bottom).inset(-10)
            make.left.equalTo(Constants.Constraints.gap_16)
            make.width.equalToSuperview().inset(Constants.Constraints.gap_16)
            make.height.greaterThanOrEqualTo(26)
        }
        requirementsLabel.snp.makeConstraints { make in
            make.top.equalTo(salaryTitle.snp.bottom).inset(-10)
            make.left.equalTo(Constants.Constraints.gap_16)
            make.width.equalToSuperview().inset(Constants.Constraints.gap_16)
            make.height.greaterThanOrEqualTo(26)
        }
        experienceLabel.snp.makeConstraints { make in
            make.top.equalTo(requirementsLabel.snp.bottom).inset(-10)
            make.left.equalTo(Constants.Constraints.gap_16)
            make.width.equalToSuperview().inset(Constants.Constraints.gap_16)
            make.height.greaterThanOrEqualTo(26)
        }
        firstInfoView.snp.makeConstraints { make in
            make.top.equalTo(experienceLabel.snp.bottom).inset(-10)
            make.left.equalTo(Constants.Constraints.gap_16)
            make.right.equalTo(experienceLabel.snp.centerX).offset(-10)
            make.height.greaterThanOrEqualTo(50)
        }
        secondInfoView.snp.makeConstraints { make in
            make.top.equalTo(experienceLabel.snp.bottom).inset(-10)
            make.right.equalTo(experienceLabel.snp.right)
            make.left.equalTo(experienceLabel.snp.centerX).offset(10)
            make.height.greaterThanOrEqualTo(50)
        }
        firstimageView.snp.makeConstraints { make in
            make.top.equalTo(8)
            make.right.equalTo(-8)
            make.height.width.equalTo(16)
        }
        secondimageView.snp.makeConstraints { make in
            make.top.equalTo(8)
            make.right.equalTo(-8)
            make.height.width.equalTo(16)
        }
        firstinfoLabel.snp.makeConstraints { make in
            make.top.equalTo(8)
            make.left.equalTo(8)
            make.width.equalToSuperview().inset(8)
            make.height.greaterThanOrEqualTo(34)
        }
        secondinfoLabel.snp.makeConstraints { make in
            make.top.equalTo(8)
            make.left.equalTo(8)
            make.width.equalTo(110)
            make.height.greaterThanOrEqualTo(34)
        }
        employerInfoView.snp.makeConstraints { make in
            make.top.equalTo(firstInfoView.snp.bottom).inset(-25)
            make.left.equalTo(Constants.Constraints.gap_16)
            make.width.equalToSuperview().inset(Constants.Constraints.gap_16)
            make.height.greaterThanOrEqualTo(134)
        }
        employerLabel.snp.makeConstraints { make in
            make.top.equalTo(10)
            make.left.equalTo(Constants.Constraints.gap_16)
            make.width.equalToSuperview().inset(Constants.Constraints.gap_16)
            make.height.equalTo(19)
        }
        mapInfoView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(Constants.Constraints.gap_16)
            make.width.equalToSuperview().inset(Constants.Constraints.gap_16)
            make.height.equalTo(58)
        }
        addressLabel.snp.makeConstraints { make in
            make.left.equalTo(Constants.Constraints.gap_16)
            make.width.equalToSuperview().inset(Constants.Constraints.gap_16)
            make.height.equalTo(19)
            make.bottom.equalTo(-10)
        }
        infoLabel.snp.makeConstraints { make in
            make.top.equalTo(employerInfoView.snp.bottom).inset(-10)
            make.left.equalTo(Constants.Constraints.gap_16)
            make.width.equalToSuperview().inset(Constants.Constraints.gap_16)
            make.height.lessThanOrEqualToSuperview()
        }
        dutiesLabel.snp.makeConstraints { make in
            make.top.equalTo(infoLabel.snp.bottom).inset(-10)
            make.left.equalTo(Constants.Constraints.gap_16)
            make.width.equalToSuperview().inset(Constants.Constraints.gap_16)
            make.height.equalTo(24)
        }
        dutiesTitle.snp.makeConstraints { make in
            make.top.equalTo(dutiesLabel.snp.bottom).inset(-10)
            make.left.equalTo(Constants.Constraints.gap_16)
            make.width.equalToSuperview().inset(Constants.Constraints.gap_16)
            make.height.lessThanOrEqualToSuperview()
        }
        questionEmployerLabel.snp.makeConstraints { make in
            make.top.equalTo(dutiesTitle.snp.bottom).inset(-30)
            make.left.equalTo(Constants.Constraints.gap_16)
            make.width.equalToSuperview().inset(Constants.Constraints.gap_16)
            make.height.greaterThanOrEqualTo(17)
        }
        questionTitle.snp.makeConstraints { make in
            make.top.equalTo(questionEmployerLabel.snp.bottom).inset(-5)
            make.left.equalTo(Constants.Constraints.gap_16)
            make.width.equalToSuperview().inset(Constants.Constraints.gap_16)
            make.height.greaterThanOrEqualTo(17)
        }
        favoriteButton.snp.makeConstraints { make in
            make.width.height.equalTo(30)
        }
        tableView.snp.makeConstraints { make in
            make.top.equalTo(questionTitle.snp.bottom).inset(-5)
            make.width.equalToSuperview()
            make.height.equalTo(height)
        }
        respondButton.snp.makeConstraints { make in
            make.top.equalTo(tableView.snp.bottom).inset(-20)
            make.left.equalTo(Constants.Constraints.gap_16)
            make.width.equalToSuperview().inset(Constants.Constraints.gap_16)
            make.height.equalTo(48)
            make.bottom.equalToSuperview()
        }
    }
//MARK: setupeButton
    private func setupeButton() {
        backButtonNavBar(with: #selector(popView),
                         image: UIImage(named: "back"),
                         tintColor: .white)
        let favoriteNavButton = UIBarButtonItem(customView: favoriteButton)
        let shareButton = UIBarButtonItem(image: UIImage(named: "share"),
                                                        style: .plain,
                                                        target: self,
                                                        action: #selector(share))
        shareButton.tintColor = .white
        let hideNavButton = UIBarButtonItem(customView: hideButton)
        hideNavButton.tintColor = .white
        navigationItem.rightBarButtonItems = [favoriteNavButton, shareButton, hideNavButton]
        hideButton.addTarget(self,
                             action: #selector(isHide),
                             for: .touchUpInside)
    }
}
extension DetailViewController {
    @objc func popView() {
        navigationController?.popViewController(animated: true)
    }
    @objc func share() {
        print("share")
    }
    @objc func isHide() {
        if hideButton.currentBackgroundImage == UIImage(named: "detailEye") {
            hideButton.setBackgroundImage(UIImage(systemName: "eye.slash"),
                                             for: .normal)
             } else {
                 hideButton.setBackgroundImage(UIImage(named: "detailEye"),
                                             for: .normal)
                 hideButton.tintColor = .lightGray
        }
    }
}
//MARK: - extension UITableView
extension DetailViewController: UITableViewDelegate,
                                UITableViewDataSource {
    func tableView(_ tableView: UITableView, 
                   numberOfRowsInSection section: Int) -> Int {
        model?.questions.count ?? 0
    }
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell",
                                                 for: indexPath) as? TableViewCell
        let model = self.model?.questions[indexPath.row]
        cell?.titleLabel.text = model
        return cell ?? UITableViewCell()
    }
}

