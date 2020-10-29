//
//  ProfileQuestion.swift
//  FitGoal
//
//  Created by Christian Slanzi on 29.03.20.
//  Copyright © 2020 Christian Slanzi. All rights reserved.
//

import Foundation

enum ProfileQuestionAnswerType {
    case images
    case texts
    case input
}

struct ProfileQuestion {
    //header
    var questionIdentifier: String
    var smallTitleText: String
    var bigTitleText: String
    //content? depends on the content! Images, Texts, InputRange
    var answerType: ProfileQuestionAnswerType
    //let's start with strings for anything
    var answers: [String]
    var selectedAnswer: String?
}
