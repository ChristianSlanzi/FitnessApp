//
//  MyGoalViewModel.swift
//  FitnessApp
//
//  Created by Christian Slanzi on 06.11.20.
//

import CS_Common_UI

class MyGoalViewModel {
    var dataManager: AppDataManager
    var navigationBarViewModel: NavigationBarModelView
    
    init(dataManager: AppDataManager,
         navigationBarViewModel: NavigationBarModelView) {
        self.dataManager = dataManager
        self.navigationBarViewModel = navigationBarViewModel
    }
    
    func getNavigationBarViewModel() -> NavigationBarModelView {
        return navigationBarViewModel
    }
}
