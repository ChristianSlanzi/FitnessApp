//
//  AppDataManager.swift
//  FitnessApp
//
//  Created by Christian Slanzi on 28.10.20.
//

class AppDataManager {
    
    private var onBoardingData: OnBoardingData?
    
    private var profileCreationQuestions: [ProfileQuestion] = [ProfileQuestion]()
    
    private init() {
        initialise()
    }
    
    // MARK: - SHARED INSTANCE
    static let shared = AppDataManager()
    
    public func getOnBoardingData() -> OnBoardingData? {
        return onBoardingData
    }
    
    public func getProfileCreationQuestions() -> [ProfileQuestion] {
        return profileCreationQuestions
    }
    
}

extension AppDataManager {
    private func initialise() {
        initialiseOnBoarding()
        initialiseProfileQuestions()
    }
    
    private func initialiseOnBoarding() {
        
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
    
    private func initialiseProfileQuestions() {
        
        var profileQuestions = [ProfileQuestion]()
        
        //question 1
        var identifier = "gender"
        var smallTitle = "What is"
        var bigTitle = "YOUR SEX?"
        var answerType: ProfileQuestionAnswerType = .images
        var answers = ["man", "woman"]
        //TODO: we could have a resource resolver... we say man/woman and it retrieves the right resources for us
        var question = ProfileQuestion(questionIdentifier: identifier,
                                       smallTitleText: smallTitle,
                                       bigTitleText: bigTitle,
                                       answerType: answerType,
                                       answers: answers)
        
        profileQuestions.append(question)

        //question 2
        identifier = "age"
        smallTitle = "What is"
        bigTitle = "YOUR AGE?"
        answerType = .input
        answers = ["30", "0", "99"]
        //TODO: we could have a resource resolver... we say man/woman and it retrieves the right resources for us
        question = ProfileQuestion(questionIdentifier: identifier,
                                   smallTitleText: smallTitle,
                                   bigTitleText: bigTitle,
                                   answerType: answerType,
                                   answers: answers)
        
        profileQuestions.append(question)
        
        //question 3
        identifier = "height"
        smallTitle = "What is"
        bigTitle = "YOUR HEIGHT?"
        answerType = .input
        answers = ["170", "100", "250"]
        //TODO: we could have a resource resolver... we say man/woman and it retrieves the right resources for us
        question = ProfileQuestion(questionIdentifier: identifier,
                                   smallTitleText: smallTitle,
                                   bigTitleText: bigTitle,
                                   answerType: answerType,
                                   answers: answers)
        
        profileQuestions.append(question)
        
        //question 4
        identifier = "weight"
        smallTitle = "What is"
        bigTitle = "YOUR WEIGHT?"
        answerType = .input
        answers = ["70", "50", "150"]
        //TODO: we could have a resource resolver... we say man/woman and it retrieves the right resources for us
        question = ProfileQuestion(questionIdentifier: identifier,
                                   smallTitleText: smallTitle,
                                   bigTitleText: bigTitle,
                                   answerType: answerType,
                                   answers: answers)
        
        profileQuestions.append(question)
        
        profileCreationQuestions = profileQuestions
    }
}
