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
        initialiseExercises()
        initialiseRoutines()
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
    
    private func initialiseExercises() {
        //TODO: this should be workouts
        let exercises: [ExerciseDTO] = [
            ExerciseDTO(title: "NEW WORKOUT FOR YOU", description: "12 new", series: 3, duration: 60, totCalories: 300, imageName: "Workout1"),
            ExerciseDTO(title: "NEW WORKOUT FOR YOU", description: "12 new", series: 3, duration: 60, totCalories: 300, imageName: "Workout2"),
            ExerciseDTO(title: "NEW WORKOUT FOR YOU", description: "12 new", series: 3, duration: 60, totCalories: 300, imageName: "Workout3"),
            ExerciseDTO(title: "NEW WORKOUT FOR YOU", description: "12 new", series: 3, duration: 60, totCalories: 300, imageName: "Workout4"),
            ExerciseDTO(title: "NEW WORKOUT FOR YOU", description: "12 new", series: 3, duration: 60, totCalories: 300, imageName: "Workout5")]
        
        self.exercises = exercises
    }
    
    private func initialiseRoutines() {
        let items1 = [
            ExerciseDTO(title: "HEATING WITH STAIRS", description: ".....", series: 3, duration: 30, totCalories: 300, imageName: "RoutinePreview1"),
            ExerciseDTO(title: "WALKING LUNGES", description: ".....", series: 3, duration: 30, totCalories: 300, imageName: "RoutinePreview2"),
            ExerciseDTO(title: "STRAIGH MIX LUNGES", description: ".....", series: 3, duration: 30, totCalories: 300, imageName: "RoutinePreview3")]
        
        let items2 = [
            ExerciseDTO(title: "HEATING WITH STAIRS", description: ".....", series: 3, duration: 60, totCalories: 300, imageName: "RoutinePreview1"),
            ExerciseDTO(title: "LARRY SCOTT", description: ".....", series: 3, duration: 60, totCalories: 300, imageName: "RoutinePreview2"),
            ExerciseDTO(title: "STRAIGH MIX LUNGES", description: ".....", series: 3, duration: 60, totCalories: 300, imageName: "RoutinePreview3")]
        
        let items3 = [
            ExerciseDTO(title: "HEATING WITH STAIRS", description: ".....", series: 3, duration: 60, totCalories: 300, imageName: "RoutinePreview1"),
            ExerciseDTO(title: "BREAST PRESS", description: ".....", series: 3, duration: 60, totCalories: 300, imageName: "RoutinePreview2"),
            ExerciseDTO(title: "STRAIGH MIX LUNGES", description: ".....", series: 3, duration: 60, totCalories: 300, imageName: "RoutinePreview3")]
        
        let items4 = [
            ExerciseDTO(title: "HEATING WITH STAIRS", description: ".....", series: 3, duration: 60, totCalories: 300, imageName: "RoutinePreview1"),
            ExerciseDTO(title: "SHOULDER PRESS", description: ".....", series: 3, duration: 60, totCalories: 300, imageName: "RoutinePreview2"),
            ExerciseDTO(title: "STRAIGH MIX LUNGES", description: ".....", series: 3, duration: 60, totCalories: 300, imageName: "RoutinePreview3")]
        
        let items5 = [
            ExerciseDTO(title: "HEATING WITH STAIRS", description: ".....", series: 3, duration: 60, totCalories: 300, imageName: "RoutinePreview1"),
            ExerciseDTO(title: "BACK PULLS", description: ".....", series: 3, duration: 60, totCalories: 300, imageName: "RoutinePreview2"),
            ExerciseDTO(title: "STRAIGH MIX LUNGES", description: ".....", series: 3, duration: 60, totCalories: 300, imageName: "RoutinePreview3")]
        
        let items6 = [
            ExerciseDTO(title: "HEATING WITH STAIRS", description: ".....", series: 3, duration: 60, totCalories: 300, imageName: "RoutinePreview1"),
            ExerciseDTO(title: "SIX PACKS PRESS", description: ".....", series: 3, duration: 60, totCalories: 300, imageName: "RoutinePreview2"),
            ExerciseDTO(title: "STRAIGH MIX LUNGES", description: ".....", series: 3, duration: 60, totCalories: 300, imageName: "RoutinePreview3")]
        
        let items7 = [
            ExerciseDTO(title: "HEATING WITH STAIRS", description: ".....", series: 3, duration: 60, totCalories: 300, imageName: "RoutinePreview1"),
            ExerciseDTO(title: "TRICEPS PULLS", description: ".....", series: 3, duration: 60, totCalories: 300, imageName: "RoutinePreview2"),
            ExerciseDTO(title: "STRAIGH MIX LUNGES", description: ".....", series: 3, duration: 60, totCalories: 300, imageName: "RoutinePreview3")]
        
        let session1Infos = SessionInfos(sessionTitle: "DAY 1",
                                         description: "The objective of this set is to form your legs",
                                         difficulty: "HIGH")
        let session2Infos = SessionInfos(sessionTitle: "DAY 2",
                                         description: "The objective of this set is to form your biceps",
                                         difficulty: "HIGH")
        let session3Infos = SessionInfos(sessionTitle: "DAY 3",
                                         description: "The objective of this set is to form your breast",
                                         difficulty: "HIGH")
        let session4Infos = SessionInfos(sessionTitle: "DAY 4",
                                         description: "The objective of this set is to form your shoulders",
                                         difficulty: "HIGH")
        let session5Infos = SessionInfos(sessionTitle: "DAY 5",
                                         description: "The objective of this set is to form your back",
                                         difficulty: "HIGH")
        let session6Infos = SessionInfos(sessionTitle: "DAY 6",
                                         description: "The objective of this set is to form your tummy",
                                         difficulty: "HIGH")
        let session7Infos = SessionInfos(sessionTitle: "DAY 7",
                                         description: "The objective of this set is to form your triceps",
                                         difficulty: "HIGH")
        
        let routines: [RoutineDTO] = [RoutineDTO("Routine1", "WALKING LUNGES", "Today", session1Infos, items1),
        RoutineDTO("Routine2", "WALKING LUNGES", "Tomorrow", session2Infos, items2),
        RoutineDTO("Routine3", "WALKING LUNGES", "Wednesday", session3Infos, items3),
        RoutineDTO("Routine1", "WALKING LUNGES", "Thursday", session4Infos, items4),
        RoutineDTO("Routine2", "WALKING LUNGES", "Friday", session5Infos, items5),
        RoutineDTO("Routine3", "WALKING LUNGES", "Saturday", session6Infos, items6),
        RoutineDTO("Routine1", "WALKING LUNGES", "Sunday", session7Infos, items7)]
        
        self.routines = routines
    }
}
