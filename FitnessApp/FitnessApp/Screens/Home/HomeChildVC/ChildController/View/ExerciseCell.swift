//
//  ExerciseCell.swift
//  FitGoal
//
//  Created by Christian Slanzi on 07.03.20.
//  Copyright © 2020 Christian Slanzi. All rights reserved.
//

import CS_Common_UI

//TODO: create a ConfigurableCell protocol
//protocol ConfigurableCell {
//    func configure(with datasource: Exercise)//make it generic
//}

class ExerciseCell: UITableViewCell, ConfigurableCell {
    
    func configure(_ item: ExerciseDTO, at indexPath: IndexPath) {
        imageName = item.imageName
        titleLabel.text = item.title
        descriptionLabel.text = item.description
    }
    
    public var imageName: String? {
        didSet {
            if let name = imageName {
                contentImage.image = UIImage(named: name)
            }
            self.layoutIfNeeded()
        }
    }
    
    lazy var contentImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        if let name = imageName {
            imageView.image = UIImage(named: name)
        }
        imageView.backgroundColor = .clear
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    //TODO: create a gradient overlay on top of contentImage
    
    var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12)
        label.textColor = .white
        label.numberOfLines = 1
        return label
    }()
    var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 9)
        label.textColor = .white
        label.numberOfLines = 1
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupConstraints()
        
    }
    
    func setupViews() {
        addSubview(contentImage)
        addSubview(titleLabel)
        addSubview(descriptionLabel)
    }
    
    func setupConstraints() {
        contentImage.anchor(top: topAnchor, paddingTop: 5, bottom: bottomAnchor, paddingBottom: 5,
                            left: leftAnchor, paddingLeft: 0, right: rightAnchor, paddingRight: 0, width: 0, height: 0)
        
       titleLabel.anchor(top: nil, paddingTop: 0, bottom: descriptionLabel.topAnchor, paddingBottom: 0,
                         left: leftAnchor, paddingLeft: 30, right: rightAnchor, paddingRight: 40, width: 0, height: 20)
        
        descriptionLabel.anchor(top: nil, paddingTop: 0, bottom: contentImage.bottomAnchor, paddingBottom: 10,
                                left: leftAnchor, paddingLeft: 30, right: rightAnchor, paddingRight: 15, width: 0, height: 10)
        /*
         NSLayoutConstraint.activate([
         logoIconImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 120),
         logoIconImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
         logoIconImageView.widthAnchor.constraint(equalToConstant: 104),
         logoIconImageView.heightAnchor.constraint(equalToConstant: 104)
         ])
         */
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
