//
//  CategoryCell.swift
//  DiscourseClient
//
//  Created by Freddy A. on 8/1/21.
//

import UIKit

class CategoryCell: UITableViewCell {
   
    
    lazy var labelNameValue: UILabel =  {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var labelIdValue: UILabel =  {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var descripcionStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [labelIdValue, labelNameValue])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 16
        
        NSLayoutConstraint.activate([
            labelIdValue.widthAnchor.constraint(equalToConstant: 20)
        ])
        
        return stackView
    }()
    
    var viewModel: CategoryCellViewModel? {
        didSet {
            guard let viewModel = viewModel else { return  }
            
            viewModel.view = self
            
            self.backgroundColor = UIColor(hex: viewModel.category.color)
            
            labelIdValue.text = "\(viewModel.category.id)" + ": "
            labelIdValue.textColor = UIColor(hex: viewModel.category.textColor)
            
            labelNameValue.text = viewModel.category.name
            labelNameValue.textColor = UIColor(hex: viewModel.category.textColor)
            
            self.addSubview(descripcionStackView)
            NSLayoutConstraint.activate([
                descripcionStackView.topAnchor.constraint(equalTo: self.topAnchor),
                descripcionStackView.leftAnchor.constraint(equalTo: self.leftAnchor),
                descripcionStackView.rightAnchor.constraint(equalTo: self.rightAnchor),
                descripcionStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
                descripcionStackView.heightAnchor.constraint(equalToConstant: 40)
            ])
        }
    }
}

extension CategoryCell: CategoryCellViewProtocol{
    
}


