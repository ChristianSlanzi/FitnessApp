//
//  Exercise.swift
//  FitGoal
//
//  Created by Christian Slanzi on 12.03.20.
//  Copyright © 2020 Christian Slanzi. All rights reserved.
//

import Foundation

struct ExerciseDTO {
    let title: String
    let description: String
    let series: Int
    let duration: Double //seconds
    let totCalories: Int
    let imageName: String
    
    init(title: String,
         description: String,
         series: Int,
         duration: Double,
         totCalories: Int,
         imageName: String) {
        self.title = title
        self.description = description
        self.series = series
        self.duration = duration
        self.totCalories = totCalories
        self.imageName = imageName
    }
}
