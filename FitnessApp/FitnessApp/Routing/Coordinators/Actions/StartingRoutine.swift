//
//  StartingRoutine.swift
//  FitnessApp
//
//  Created by Christian Slanzi on 31.10.20.
//

import Foundation

protocol StartingRoutine: AnyObject {
    func startRoutineCountdown(with routine: RoutineDTO)//TODO: (with routine: Routine)
    func startRoutinePlay(with routine: RoutineDTO)
    func stopRoutine()
    func completeRoutine()
}
