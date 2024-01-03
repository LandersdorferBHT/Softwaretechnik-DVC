
//  DetailTableViewCell.swift
//  SpaceX Project
//
//  Created by Anton Landersdorfer on 21.12.19.
//  Copyright © 2019 Anton Landersdorfer. All rights reserved.
//

import UIKit

struct Detail {
    var title: String
    var description: String
}

class DetailTableViewCell: UITableViewCell {
        
    var titleLabel: UILabel!
    var descriptiveLabel: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureCell() {
        
        titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        descriptiveLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        
        self.addSubview(titleLabel)
        self.addSubview(descriptiveLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptiveLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let insetConstant: CGFloat = 16
        let viewSpacing: CGFloat = 4
        
        NSLayoutConstraint.activate([
            
            titleLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: insetConstant),
            titleLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: insetConstant),
            titleLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -insetConstant),
            titleLabel.bottomAnchor.constraint(equalTo: descriptiveLabel.topAnchor, constant: -viewSpacing),

            descriptiveLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: viewSpacing),
            descriptiveLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: insetConstant),
            descriptiveLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -insetConstant),
            descriptiveLabel.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -insetConstant)
        ])

        let textColor = UIColor.label
        
        titleLabel.font = UIFont.boldSystemFont(ofSize: 18)
        titleLabel.textColor = textColor
        titleLabel.numberOfLines = 0
        
        descriptiveLabel.font = UIFont(descriptor: .preferredFontDescriptor(withTextStyle: .body), size: 15)
        descriptiveLabel.textColor = textColor
        descriptiveLabel.numberOfLines = 0
    }
    
    func populateData(with detail: Detail) {
        titleLabel?.text = detail.title
        descriptiveLabel?.text = detail.description
    }
    
    override func prepareForReuse() {
        titleLabel?.text = ""
        descriptiveLabel?.text = ""
    }
}
