//
//  UserCell.swift
//  DiscourseClient
//
//  Created by Freddy A. on 7/28/21.
//

import UIKit

class UserCell: UITableViewCell {
    var viewModel: UserCellViewModel? {
        didSet {
            guard let viewModel = viewModel else { return  }
            
            viewModel.view = self
            textLabel?.text = viewModel.textLabel
            imageView?.image = viewModel.userImage
        }
    }
}

extension UserCell: UserCellViewProtocol{
    func userImageFetched() {
        imageView?.image = viewModel?.userImage
        setNeedsLayout()
        
    }
}
