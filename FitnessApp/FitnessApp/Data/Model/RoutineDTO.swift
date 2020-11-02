//
//  Routine.swift
//  FitGoal
//
//  Created by Christian Slanzi on 12.03.20.
//  Copyright © 2020 Christian Slanzi. All rights reserved.
//

import Foundation

struct SessionInfos {
   var sessionTitle: String
    var description: String
    var difficulty: String
}

struct RoutineDTO {
    var imageName: String
    var title: String
    var badgeText: String
    var previewName: String
    var exercises: [ExerciseDTO] //TODO: or dictionary day:workout?
    var currentExercise: Int
    
    var session: SessionInfos
    
    init(_ imageName: String, _ title: String, _ badgeText: String, _ session: SessionInfos, _ exercises: [ExerciseDTO]) {
        self.imageName = imageName
        self.title = title
        self.badgeText = badgeText
        self.previewName = imageName + "Preview"
        self.exercises = exercises
        self.session = session
        self.currentExercise = 0
    }
}
