//
//  AppDataManager.swift
//  FitnessApp
//
//  Created by Christian Slanzi on 28.10.20.
//
import CS_Common_UI

class AppDataManager {
    
    private var onBoardingData: OnBoardingData?
    
    private var profileCreationQuestions: [ProfileQuestion] = [ProfileQuestion]()
    
    private var dailyEntries: [DataEntry] = [DataEntry]()
    
    private var routines: [RoutineDTO] = [RoutineDTO]() // a dictionary [day:workout]
    //TODO: workouts? // a list of exercises
    private var exercises: [ExerciseDTO] = [ExerciseDTO]()
    
    
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
    
    public func getDailyEntries() -> [DataEntry] {
        return dailyEntries
    }
    
    //routines
    public func getRoutines() -> [RoutineDTO] {
        return routines
    }
    
    public func getExercises() -> [ExerciseDTO] {
        return exercises
    }
    
}

extension AppDataManager {
    private func initialise() {
        initialiseOnBoarding()
        initialiseProfileQuestions()
        initialiseDailyEntries()
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
    
    private func initialiseDailyEntries() {
        let dataEntries = DataEntryGenerator().generateRandomDataEntries()
        self.dailyEntries = dataEntries
    }
}
