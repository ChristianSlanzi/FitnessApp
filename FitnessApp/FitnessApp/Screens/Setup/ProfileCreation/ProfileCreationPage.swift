//
//  ProfileCreationPage.swift
//  FitGoal
//
//  Created by Christian Slanzi on 29.02.20.
//  Copyright © 2020 Christian Slanzi. All rights reserved.
//

import CS_Common_UI

class ProfileCreationPage: BaseViewController {
    
    var profileQuestion: ProfileQuestion!
    
    public var backgroundColor: UIColor?
    
    lazy var headerView: HeaderView = {
        let view = HeaderView(profileQuestion: profileQuestion)
        view.translatesAutoresizingMaskIntoConstraints = false
        //view.backgroundColor = .clear//.yellow
        return view
    }()
    
    lazy var contentView: UIView = {
        var view: UIView!
        switch profileQuestion.answerType {
        case .images:
            view = ContentView(profileQuestion: profileQuestion)
        case .texts:
            break
        case .input:
            view = InputContentView(profileQuestion: profileQuestion)
        }
         
        view.translatesAutoresizingMaskIntoConstraints = false
        //view.backgroundColor = .clear//.random()
        return view
    }()
    
    convenience init(question: ProfileQuestion) {
        self.init()
        profileQuestion = question
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func setupViews() {
        self.view.backgroundColor = backgroundColor //UIColor.yellow
        
        self.view.addSubview(headerView)
        self.view.addSubview(contentView)

    }
    
    override func setupConstraints() {
        
        headerView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0).isActive = true
        headerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        headerView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        headerView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.4).isActive=true
        
        contentView.topAnchor.constraint(equalTo: self.headerView.bottomAnchor, constant: 0).isActive = true
        contentView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        contentView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        contentView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.6).isActive=true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getSelectedOption() -> ProfileQuestion? {
        guard let contentView = contentView as? ContentViewProtocol else { return nil }
        return contentView.getSelectedOption()
    }
}
