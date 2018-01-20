//
//  SearchCell.swift
//  Search Demo
//
//  Created by Øyvind Sørensen on 20/01/2018.
//  Copyright © 2018 Øyvind Sørensen. All rights reserved.
//

import UIKit

class SearchCell: UITableViewCell {
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 22)
        label.textColor = UIColor.red
        label.numberOfLines = 1
        return label
    }()
    
    func setupViews() {
        
        addSubview(titleLabel)
        
        titleLabel.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: 0, height: 50)
    }
    
    var car: Car!
    
    func configureCell(_ car: Car) {
        
        self.car = car
        
        titleLabel.text = " " + self.car.name
        
    }
}
