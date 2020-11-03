//
//  RoutinePlayInfoView.swift
//  FitGoal
//
//  Created by Christian Slanzi on 20.03.20.
//  Copyright © 2020 Christian Slanzi. All rights reserved.
//

import CS_Common_UI

class RoutinePlayInfoView: CustomView {

    var routine: RoutineDTO
    var coordinator: StartingRoutine?

    private let caloriesLabel: UILabel = {
       let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textColor = UIColor(hexString: "#FFFFFF")
        titleLabel.font = .systemFont(ofSize: 19)
        titleLabel.textAlignment = .right
        return titleLabel
    }()
    
    private let countdownLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = UIColor(hexString: "#FFFFFF")
        lbl.font = UIFont.systemFont(ofSize: 81)
        lbl.textAlignment = .left
        //lbl.adjustsFontSizeToFitWidth = true
        return lbl
    }()
    
    private let nextExerciseLabel: UILabel = {
       let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textColor = UIColor(hexString: "#FFFFFF")
        titleLabel.font = .systemFont(ofSize: 19)
        titleLabel.textAlignment = .right
        return titleLabel
    }()
    
    private var currentExercise: ExerciseDTO {
        return routine.exercises[routine.currentExercise]
    }
    
    private lazy var countdown = Countdown(startTime: currentExercise.duration, timeUpdated: { [weak self] timeInterval in
        guard let strongSelf = self else { return }
        
        if timeInterval <= 0 {
            //Send alert to indicate "time's up!"
            //strongSelf.dismiss(animated: false)
            strongSelf.routine.currentExercise += 1
            strongSelf.coordinator?.stopRoutine()
            
            //TODO: who is the logic owner? not the view.. it should be the view model.. the interactor .. the manager...
            if strongSelf.routine.currentExercise >= strongSelf.routine.exercises.count {
                strongSelf.coordinator?.completeRoutine()
            } else {
                strongSelf.coordinator?.startRoutinePlay(with: strongSelf.routine)
            }
                
            return
        }
        
        strongSelf.countdownLabel.text = timeInterval.toString()//strongSelf.timeString(from: timeInterval)
        
    })
    
    internal init( routine: RoutineDTO, coordinator: StartingRoutine? = nil) {
        self.coordinator = coordinator
        self.routine = routine
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setupViews() {
        super.setupViews()
        
        //TODO: add pager
        addSubview(caloriesLabel)
        addSubview(countdownLabel)
        addSubview(nextExerciseLabel)
        
        //TODO: inject routine/exercise struct with the necessary data
        let totExercises = routine.exercises.count
        let currentExercise = routine.exercises[routine.currentExercise]
        let nextExercise = (routine.currentExercise == (totExercises - 1)) ? nil : routine.exercises[routine.currentExercise + 1]
        let totCalories = currentExercise.totCalories
        let duration = currentExercise.duration
        let next = nextExercise?.title

        caloriesLabel.text = "Calories burned \(totCalories)" //"Calories burned 323"
        countdownLabel.text = duration.toString()  //timeString(from: duration)//"00:30"
        nextExerciseLabel.text = next != nil  ? "Next: \(next!)" : ""//"Next: Walking Lunges"

    }
    override func setupConstraints() {
        super.setupConstraints()
        
        NSLayoutConstraint.activate([
            caloriesLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            caloriesLabel.topAnchor.constraint(equalTo: topAnchor, constant: 60)
        ])
        NSLayoutConstraint.activate([
            countdownLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            countdownLabel.topAnchor.constraint(equalTo: caloriesLabel.bottomAnchor, constant: 60)
        ])
        
        NSLayoutConstraint.activate([
            nextExerciseLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            nextExerciseLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)
        ])
    }
    
    public func toggleCountdown() {
        countdown.toggle()
    }
    
    /*
    private func timeString(from timeInterval: TimeInterval) -> String {
        let seconds = Int(timeInterval.truncatingRemainder(dividingBy: 60))
        let minutes = Int(timeInterval.truncatingRemainder(dividingBy: 60 * 60) / 60)
        //let hours = Int(timeInterval / 3600)
        //return String(format: "%.2d:%.2d:%.2d", hours, minutes, seconds)
        return String(format: "%.2d:%.2d", minutes, seconds)
    }*/
}

public extension TimeInterval {
    func toString() -> String {
        let seconds = Int(self.truncatingRemainder(dividingBy: 60))
        let minutes = Int(self.truncatingRemainder(dividingBy: 60 * 60) / 60)
        //let hours = Int(timeInterval / 3600)
        //return String(format: "%.2d:%.2d:%.2d", hours, minutes, seconds)
        return String(format: "%.2d:%.2d", minutes, seconds)
    }
}
