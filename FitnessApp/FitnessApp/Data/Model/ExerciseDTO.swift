//
//  Exercise.swift
//  FitGoal
//
//  Created by Christian Slanzi on 12.03.20.
//  Copyright © 2020 Christian Slanzi. All rights reserved.
//

import Foundation

struct ExerciseDTO {
    var imageName: String
    var title: String
    var description: String
    
    init(_ imageName: String, _ title: String, _ description: String) {
        self.imageName = imageName
        self.title = title
        self.description = description
    }
}
