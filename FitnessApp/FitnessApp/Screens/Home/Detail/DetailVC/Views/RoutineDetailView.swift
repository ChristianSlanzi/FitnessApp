//
//  RoutineDetailView.swift
//  FitnessApp
//
//  Created by Christian Slanzi on 31.10.20.
//

import CS_Common_UI

// RoutineDetailView
//      RoutineInfo
//          Badge
//          Content
//              Title
//              Difficulty
//                  Icon
//                  Value
//              Description
//      RoutineExerciseTable
//          RoutineExerciseRow
//              StatusIndicator
//              Image
//              Title
//              Sets
//              Time
//              Divider

class RoutineDetailView: CustomView {
    
    var routine: RoutineDTO
    
    lazy var routineInfoView: RoutineInfoView = {
        var view = RoutineInfoView(routine: routine)
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 7
        return view
    }()
    
    lazy var routineExerciseTable: RoutineExerciseTable = {
        var view = RoutineExerciseTable()
        view.items = self.routine.exercises
//        view.backgroundColor = .red
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
        
        addSubview(routineInfoView)
        addSubview(routineExerciseTable)
        
    }
    override func setupConstraints() {
        super.setupConstraints()
        
        NSLayoutConstraint.activate([
            routineInfoView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            routineInfoView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.9),
            routineInfoView.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
            routineInfoView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.3)
        ])
        
        NSLayoutConstraint.activate([
            routineExerciseTable.topAnchor.constraint(equalTo: routineInfoView.bottomAnchor, constant: 0),
            routineExerciseTable.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            routineExerciseTable.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            routineExerciseTable.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)
        ])
    }
}
