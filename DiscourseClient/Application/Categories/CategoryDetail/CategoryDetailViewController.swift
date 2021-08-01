//
//  CategoryDetailViewController.swift
//  DiscourseClient
//
//  Created by Freddy A. on 8/1/21.
//

import UIKit

class CategoryDetailViewController: UIViewController {
    lazy var labelCategoryIDValue: UILabel =  {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var CategoryIDStackView: UIStackView = {
        let labelCategoryID = UILabel()
        
        labelCategoryID.translatesAutoresizingMaskIntoConstraints = false
        labelCategoryID.text = "Category ID: "
        
        let stackView = UIStackView(arrangedSubviews: [labelCategoryID, labelCategoryIDValue])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 16
        
        return stackView
    }()
    
    lazy var labelNameValue: UILabel =  {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var nameStackView: UIStackView = {
        let labelName = UILabel()
        
        labelName.translatesAutoresizingMaskIntoConstraints = false
        labelName.text = "Category Name: "
        
        let stackView = UIStackView(arrangedSubviews: [labelName, labelNameValue])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 16
        
        return stackView
    }()
    
    lazy var updateNameButton: UIButton = {
        let updateButton = UIButton(type: .system)
        updateButton.translatesAutoresizingMaskIntoConstraints = false
        updateButton.setTitleColor(.black, for: .normal)
        updateButton.backgroundColor = .white
        updateButton.layer.cornerRadius = 10
        
        return updateButton
    }()
           
    let viewModel: CategoryDetailViewModel
    
    init(viewModel: CategoryDetailViewModel) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = .white
        
        view.addSubview(CategoryIDStackView)
        NSLayoutConstraint.activate([
            CategoryIDStackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            CategoryIDStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 92)
        ])
        
        view.addSubview(nameStackView)
        NSLayoutConstraint.activate([
            nameStackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            nameStackView.topAnchor.constraint(equalTo: CategoryIDStackView.bottomAnchor, constant: 32)
        ])
        
        
        view.addSubview(updateNameButton)
        NSLayoutConstraint.activate([
            updateNameButton.topAnchor.constraint(equalTo: nameStackView.bottomAnchor, constant: 32),
            updateNameButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            updateNameButton.heightAnchor.constraint(equalToConstant: 40),
            updateNameButton.widthAnchor.constraint(equalToConstant: 150)
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        showLoader()
    }
    
    private func updateData(CategoryDetail: CategoryDetailViewStruct){
        labelCategoryIDValue.text = CategoryDetail.CategoryId
        labelNameValue.text = CategoryDetail.nameLabel
                
        updateNameButton.backgroundColor = UIColor(hex: CategoryDetail.colorCategory ?? "ffffff")
    }
    
    private func showErrorFetchingCategory(){
        showAlert(title: "Error fetching Category", message: "")
    }
}

extension CategoryDetailViewController: CategoryDetailViewProtocol {
    func onGetCategorySuccess(CategoryDetail: CategoryDetailViewStruct) {
        hideLoader()
        updateData(CategoryDetail: CategoryDetail)
    }
    
    func onGetCategoryFail() {
        hideLoader()
        showErrorFetchingCategory()
    }
    
    
}

