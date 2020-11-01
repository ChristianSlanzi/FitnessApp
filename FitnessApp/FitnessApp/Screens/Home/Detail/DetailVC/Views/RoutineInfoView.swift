//
//  RoutineInfoView.swift
//  FitGoal
//
//  Created by Christian Slanzi on 16.03.20.
//  Copyright © 2020 Christian Slanzi. All rights reserved.
//

import CS_Common_UI

class RoutineInfoView: CustomView {
    
    var routine: RoutineDTO
    
    var badge: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = UIColor(hexString: "#3EC7E6")
        label.layer.cornerRadius = 7.5
        label.layer.masksToBounds = true
        label.font = .systemFont(ofSize: 9)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    lazy var routineInfoContent: RoutineInfoContent = {
        var view = RoutineInfoContent(routine: routine)
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
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
        addSubview(badge)
        addSubview(routineInfoContent)
        
        badge.text = routine.badgeText
    }
    override func setupConstraints() {
        super.setupConstraints()
        
        badge.anchor(top: topAnchor, paddingTop: 9, bottom: nil, paddingBottom: 0,
                     left: leftAnchor, paddingLeft: 13, right: nil, paddingRight: 0, width: 93, height: 15)
        routineInfoContent.anchor(top: badge.bottomAnchor, paddingTop: 9, bottom: bottomAnchor, paddingBottom: 9,
                                  left: leftAnchor, paddingLeft: 13, right: rightAnchor, paddingRight: 13, width: 0, height: 0)
    }
}
