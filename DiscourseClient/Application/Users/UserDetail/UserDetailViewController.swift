//
//  File.swift
//  DiscourseClient
//
//  Created by Freddy A. on 7/31/21.
//

import UIKit

class UserDetailViewController: UIViewController {
    lazy var labelUserIDValue: UILabel =  {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var userIDStackView: UIStackView = {
        let labelUserID = UILabel()
        
        labelUserID.translatesAutoresizingMaskIntoConstraints = false
        labelUserID.text = "User ID: "
        
        let stackView = UIStackView(arrangedSubviews: [labelUserID, labelUserIDValue])
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
        labelName.text = "User Name: "
        
        let stackView = UIStackView(arrangedSubviews: [labelName, labelNameValue])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 16
        
        return stackView
    }()
    
    lazy var updateNameButton: UIButton = {
        let updateButton = UIButton(type: .system)
        updateButton.translatesAutoresizingMaskIntoConstraints = false
        updateButton.setTitle("Update name", for: .normal)
        updateButton.setTitleColor(.black, for: .normal)
        updateButton.backgroundColor = .green
        updateButton.layer.cornerRadius = 10
        updateButton.addTarget(self, action: #selector(updateNameButtonTapped), for: .touchUpInside)
        
        return updateButton
    }()
    
    lazy var textFieldUserName: UITextField = {
        let textFieldUserName = UITextField()
        
        textFieldUserName.borderStyle = .line
        textFieldUserName.translatesAutoresizingMaskIntoConstraints = false
        
        return textFieldUserName
    }()
    
    lazy var newUserNameStackView: UIStackView = {
        let labelNewName = UILabel()
        
        labelNewName.translatesAutoresizingMaskIntoConstraints = false
        labelNewName.text = "New User Name: "
        
        let stackView = UIStackView(arrangedSubviews: [labelNewName, textFieldUserName])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 16
        
        return stackView
    }()
    
    let viewModel: UserDetailViewModel
    
    init(viewModel: UserDetailViewModel) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = .white
        
        view.addSubview(userIDStackView)
        NSLayoutConstraint.activate([
            userIDStackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            userIDStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 64)
        ])
        
        view.addSubview(nameStackView)
        NSLayoutConstraint.activate([
            nameStackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            nameStackView.topAnchor.constraint(equalTo: userIDStackView.bottomAnchor, constant: 32)
        ])
        
        view.addSubview(newUserNameStackView)
        NSLayoutConstraint.activate([
            newUserNameStackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            newUserNameStackView.topAnchor.constraint(equalTo: nameStackView.bottomAnchor, constant: 32),
            textFieldUserName.widthAnchor.constraint(equalToConstant: 150)
        ])
        
        view.addSubview(updateNameButton)
        NSLayoutConstraint.activate([
            updateNameButton.topAnchor.constraint(equalTo: newUserNameStackView.bottomAnchor, constant: 32),
            updateNameButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            updateNameButton.heightAnchor.constraint(equalToConstant: 40),
            updateNameButton.widthAnchor.constraint(equalToConstant: 150)
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.viewDidLoad()
        
        //DispatchQueue.main.asyncAfter(deadline: .now() + 0.1){
        //    self.showLoader()
        //}
    }
    
    override func viewWillAppear(_ animated: Bool) {
        showLoader()
    }
    
    @objc func updateNameButtonTapped(){
        
    }
    
    private func updateData(userDetail: UserDetailViewStruct){
        labelUserIDValue.text = userDetail.userId
        labelNameValue.text = userDetail.nameLabel
        
        updateNameButton.isHidden = !userDetail.canEditName
        newUserNameStackView.isHidden = !userDetail.canEditName
    }
    
    private func showErrorFetchingUser(){
        showAlert(title: "Error fetching user", message: "")
    }
}

extension UserDetailViewController: UserDetailViewProtocol {
    func onGetUserSuccess(userDetail: UserDetailViewStruct) {
        hideLoader()
        updateData(userDetail: userDetail)
    }
    
    func onGetUserFail() {
        hideLoader()
        showErrorFetchingUser()
    }
    
    
}
