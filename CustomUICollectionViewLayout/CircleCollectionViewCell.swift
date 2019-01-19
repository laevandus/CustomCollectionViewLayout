//
//  CircleCollectionViewCell.swift
//  CustomUICollectionViewLayout
//
//  Created by Toomas Vahter on 19/01/2019.
//  Copyright © 2019 Augmented Code. All rights reserved.
//

import UIKit

final class CircleCollectionViewCell: UICollectionViewCell {
    let titleLabel: UILabel
    
    override init(frame: CGRect) {
        titleLabel = {
            let label = UILabel(frame: .zero)
            label.textAlignment = .center
            label.textColor = .white
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        super.init(frame: frame)
        
        backgroundView = {
            let view = CircleView(frame: .zero)
            view.backgroundColor = .lightGray
            return view
        }()
        
        contentView.addSubview(titleLabel)
        titleLabel.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor, constant: 4.0).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor, constant: -4.0).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: contentView.layoutMarginsGuide.centerYAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

final class CircleView: UICollectionReusableView {
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = bounds.width / 2.0
    }
}
