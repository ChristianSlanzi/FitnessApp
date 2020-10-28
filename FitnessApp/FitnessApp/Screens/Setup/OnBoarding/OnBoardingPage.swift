//
//  OnBoardingPage.swift
//  FitnessApp
//
//  Created by Christian Slanzi on 28.10.20.
//

import UIKit
import CS_Common_UI

//TODO: create the pages with a builder
// create a struct with the data we want in our pages
// text, image, bg color...

class OnBoardingPage: BaseViewController {
    
    public var imageName: String?
    public var titleText: String?
    public var subtitleText: String?
    public var descriptionText: String?
    
    public var backgroundColor: UIColor?
    
    lazy var imageView: UIImageView = {
       let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        if let name = imageName {
           imageView.image = UIImage(named: name)
        }
        imageView.backgroundColor = .clear
        imageView.contentMode = .bottomRight
        return imageView
    }()
    
    lazy var titleLabel: UILabel = {
       let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textColor = .white
        titleLabel.font = .systemFont(ofSize: 56)
        return titleLabel
    }()
    
    lazy var subtitleLabel: UILabel = {
       let subtitleLabel = UILabel()
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.textColor = .white
        subtitleLabel.font = .systemFont(ofSize: 44)
        subtitleLabel.textAlignment = .left
        return subtitleLabel
    }()
    
    lazy var descriptionLabel: UILabel = {
       let descriptionLabel = UILabel()
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.textColor = .white
        descriptionLabel.font = .systemFont(ofSize: 22)
        descriptionLabel.numberOfLines = 0
        descriptionLabel.lineBreakMode = .byWordWrapping
        return descriptionLabel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func setupViews() {
        self.view.backgroundColor = backgroundColor //UIColor.yellow
        
        //image
        self.view.addSubview(imageView)
        
        // title
        titleLabel.text = titleText
        self.view.addSubview(titleLabel)
        
        // subtitle
        subtitleLabel.text = subtitleText
        self.view.addSubview(subtitleLabel)
        
        // description
        descriptionLabel.text = descriptionText
        self.view.addSubview(descriptionLabel)
    }
    
    override func setupConstraints() {
        
        imageView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0).isActive = true
        imageView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        imageView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.4).isActive=true
        
        //imageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
        titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 5).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
        subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5).isActive = true
        subtitleLabel.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9).isActive = true
        subtitleLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
        descriptionLabel.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 20).isActive = true
        descriptionLabel.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9).isActive = true
        descriptionLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
