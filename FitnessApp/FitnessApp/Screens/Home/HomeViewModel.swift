//
//  HomeViewModel.swift
//  FitnessApp
//
//  Created by Christian Slanzi on 03.11.20.
//

import CS_Common_UI //should be a data module, TODO: move DataEntry

class HomeViewModel {

    var dataManager: AppDataManager
    var navigationBarViewModel: NavigationBarModelView
    var contentViewModel: ContainerControllerModel
    
    init(dataManager: AppDataManager,
         navigationBarViewModel: NavigationBarModelView,
         contentViewModel: ContainerControllerModel) {
        self.dataManager = dataManager
        self.navigationBarViewModel = navigationBarViewModel
        self.contentViewModel = contentViewModel
    }
    
    func getNavigationBarViewModel() -> NavigationBarModelView {
        return navigationBarViewModel
    }
    
    func getDailyEntries() -> [DataEntry] {
        return dataManager.getDailyEntries()
    }
    
    func getHomeContentViewModel() -> ContainerControllerModel {
        return contentViewModel
    }
    
    //TODO: move datasources inside viewModel
    func getRoutines() -> [RoutineDTO] {
        return dataManager.getRoutines()
    }
    
    func getExercises() -> [ExerciseDTO] {
        return dataManager.getExercises()
    }
}
