//
//  RoutineInfoContent.swift
//  FitGoal
//
//  Created by Christian Slanzi on 16.03.20.
//  Copyright © 2020 Christian Slanzi. All rights reserved.
//

import CS_Common_UI

class RoutineInfoContent: CustomView {
    
    var routine: RoutineDTO
    
    lazy var titleLabel: UILabel = {
       let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textColor = UIColor(hexString: "#626363")
        titleLabel.font = .boldSystemFont(ofSize: 14)
        titleLabel.textAlignment = .left
        return titleLabel
    }()
    
    lazy var routineDifficultyView: RoutineDifficultyView = {
        var view = RoutineDifficultyView()
        //view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var descriptionLabel: UILabel = {
       let subtitleLabel = UILabel()
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.textColor = UIColor(hexString: "#858891")
        subtitleLabel.font = .systemFont(ofSize: 15)
        subtitleLabel.textAlignment = .left
        return subtitleLabel
    }()
    
    // MARK: Init & Setup
    init(routine: RoutineDTO) {
        self.routine = routine
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setupViews() {
        super.setupViews()
        addSubview(titleLabel)
        addSubview(routineDifficultyView)
        addSubview(descriptionLabel)
         
        titleLabel.text = routine.session.sessionTitle
        titleLabel.sizeToFit()
        descriptionLabel.text = routine.session.description
        routineDifficultyView.valueLabel.text = routine.session.difficulty
        routineDifficultyView.valueLabel.textColor = UIColor(hexString: "#F74444")
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        
        titleLabel.anchor(top: topAnchor, paddingTop: 0, bottom: nil, paddingBottom: 0,
                          left: leftAnchor, paddingLeft: 0, right: nil, paddingRight: 0, width: 0, height: 30)
        
        routineDifficultyView.anchor(top: topAnchor, paddingTop: 0, bottom: nil, paddingBottom: 0,
                                     left: titleLabel.rightAnchor, paddingLeft: 0, right: rightAnchor, paddingRight: 0, width: 0, height: 30)
        
        descriptionLabel.anchor(top: nil, paddingTop: 0, bottom: bottomAnchor, paddingBottom: 0,
                                left: leftAnchor, paddingLeft: 0, right: rightAnchor, paddingRight: 0, width: 0, height: 30)
    }
}
