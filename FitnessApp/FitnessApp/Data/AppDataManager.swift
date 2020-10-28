//
//  AppDataManager.swift
//  FitnessApp
//
//  Created by Christian Slanzi on 28.10.20.
//

class FitGoalDataManager {
    
    private var onBoardingData: OnBoardingData?
    
    private init() {
        initialise()
    }
    
    // MARK: - SHARED INSTANCE
    static let shared = FitGoalDataManager()
    
    public func getOnBoardingData() -> OnBoardingData? {
        return onBoardingData
    }
    
}

extension FitGoalDataManager {
    private func initialise() {
        
        var onBoardingPages = [OnBoardingData.Page]()
        
        onBoardingPages.append(OnBoardingData.Page(imageName: "onb_step1",
                                                   title: "TRANSFORM",
                                                   subtitle: "Your life",
                                                   text: "Create your own fitness Routine where ever you are."))
        
        onBoardingPages.append(OnBoardingData.Page(imageName: "onb_step2",
                                                   title: "TRANSFORM",
                                                   subtitle: "Your style",
                                                   text: "Control your own fitness Routine where ever you are."))
        
        onBoardingPages.append(OnBoardingData.Page(imageName: "onb_step3",
                                                   title: "TRANSFORM",
                                                   subtitle: "Your health",
                                                   text: "Feel better like never before start today."))
        
        self.onBoardingData = OnBoardingData(pages: onBoardingPages)
        
    }
}
