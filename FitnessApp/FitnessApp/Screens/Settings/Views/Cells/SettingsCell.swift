//
//  SettingsCell.swift
//  FitGoal
//
//  Created by Christian Slanzi on 19.03.20.
//  Copyright © 2020 Christian Slanzi. All rights reserved.
//

import Foundation
import UIKit

public class SettingsCell: UITableViewCell {
    var item: Settings? {
        didSet {
            if let item = item {
                icon.image = UIImage(named: item.iconName)
                titleLabel.text = item.title
                valueLabel.text = item.value
            }
        }
    }
    
    private let icon: UIImageView = {
        let imgView = UIImageView(image: UIImage(named: "EmptyStatus"))
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.contentMode = .scaleAspectFit
        imgView.clipsToBounds = true
        return imgView
    }()
    
    private let titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = UIColor(hexString: "#858891")
        lbl.font = UIFont.systemFont(ofSize: 15)
        lbl.textAlignment = .left
        //lbl.adjustsFontSizeToFitWidth = true
        return lbl
    }()
    
    private let valueLabel: UILabel = {
       let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textColor = UIColor(hexString: "#858891")
        titleLabel.font = .systemFont(ofSize: 15)
        titleLabel.textAlignment = .right
        return titleLabel
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupConstraints()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        backgroundColor = .clear

        addSubview(icon)
        addSubview(titleLabel)
        addSubview(valueLabel)
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            icon.leftAnchor.constraint(equalTo: leftAnchor, constant: 8),
            icon.widthAnchor.constraint(equalToConstant: 34),
            icon.heightAnchor.constraint(equalToConstant: 34),
            icon.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0)
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.leftAnchor.constraint(equalTo: icon.rightAnchor, constant: 8),
            titleLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.35),
            titleLabel.heightAnchor.constraint(equalToConstant: 48),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0)
        ])
        NSLayoutConstraint.activate([
            valueLabel.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            valueLabel.leftAnchor.constraint(equalTo: titleLabel.rightAnchor, constant: 0),
            valueLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
            valueLabel.heightAnchor.constraint(equalToConstant: 30),
            valueLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0)
        ])
    }

}
