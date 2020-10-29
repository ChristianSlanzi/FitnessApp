//
//  ProfileCreationViewController.swift
//  FitnessApp
//
//  Created by Christian Slanzi on 29.10.20.
//

import UIKit
import CS_Common_UI

class ProfileCreationViewController: BaseViewController {
    
    public weak var signupCoordinator: CreatingAccount?
    var dataManager: AppDataManager
    
    //////////////////////////////////////////////////////
    //TODO: export in a viewmodel
    let dbManager: DataManager
    let userRepo: UserRepositoryProtocol
    
    init(dbManager: DataManager = RealmDataManager(RealmProvider.default), dataManager: AppDataManager) {
        self.dbManager = dbManager
        self.userRepo = UserRepository(dbManager: dbManager)
        self.dataManager = dataManager
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //////////////////////////////////////////////////////
    /*
     lazy var backgroundImageView: UIImageView = {
     let backgroundImageView = UIImageView()
     backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
     backgroundImageView.image = UIImage(named: "Background")
     backgroundImageView.contentMode = .scaleAspectFill
     return backgroundImageView
     }() */
    lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .blue
        return view
    }()
    lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textColor = .white
        titleLabel.font = .systemFont(ofSize: 14)
        titleLabel.text = "CREATE YOUR PROFILE"
        titleLabel.textAlignment = .left
        return titleLabel
    }()
    lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        return pageControl
    }()
    lazy var nextButton: UIButton = {
        let button = UIButton()
        button.isEnabled = false//true//false //TODO
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "ButtonArrowRight"), for: .normal)
        button.addTarget(self, action: #selector(didTapNextButton), for: .touchUpInside)
        return button
    }()
    
    lazy var profileCreationWizard: ProfileCreationWizard = {
        let profileCreationWizard = ProfileCreationWizard(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        profileCreationWizard.profileCreationQuestions = dataManager.getProfileCreationQuestions()
        profileCreationWizard.view.translatesAutoresizingMaskIntoConstraints = false
        profileCreationWizard.profileCreationWizardDelegate = self
        return profileCreationWizard
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
        pageControl.addTarget(self, action: #selector(didChangePageControlValue), for: .valueChanged)
    }
    
    /*
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     if let profileCreationWizard = segue.destination as? ProfileCreationWizard {
     self.profileCreationWizard = profileCreationWizard
     }
     }
     */
    
    override func setupViews() {
        super.setupViews()
        //        view.addSubview(backgroundImageView)
        //view.sendSubviewToBack(backgroundImageView)
    
        pageControl.numberOfPages = profileCreationWizard.profileCreationQuestions?.count ?? 0
        pageControl.currentPage = 0
        view.addSubview(titleLabel)
        view.addSubview(pageControl)
        
        //containerView.addSubview(profileCreationWizard.view)
        //containerView = profileCreationWizard.view
        view.addSubview(profileCreationWizard.view)
        //containerView.bringSubviewToFront(profileCreationWizard.view)
        view.addSubview(nextButton)
        
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        /*        NSLayoutConstraint.activate([
         backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
         backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
         backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
         backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
         ])
         */
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeTopAnchor, constant: 60),
            titleLabel.leadingAnchor.constraint(equalTo: view.safeLeadingAnchor, constant: 20)
        ])
        NSLayoutConstraint.activate([
            pageControl.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor, constant: 0),
            pageControl.trailingAnchor.constraint(equalTo: view.safeTrailingAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            nextButton.bottomAnchor.constraint(equalTo: view.safeBottomAnchor),
            nextButton.trailingAnchor.constraint(equalTo: view.safeTrailingAnchor),
            nextButton.widthAnchor.constraint(equalToConstant: 96),
            nextButton.heightAnchor.constraint(equalToConstant: 96)
        ])
        //        NSLayoutConstraint.activate([
        //        containerView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 60),
        //        containerView.widthAnchor.constraint(equalTo: view.widthAnchor)       ])
        
        NSLayoutConstraint.activate([
            profileCreationWizard.view.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 60),
            profileCreationWizard.view.widthAnchor.constraint(equalTo: view.widthAnchor),
            profileCreationWizard.view.bottomAnchor.constraint(equalTo: nextButton.topAnchor)
        ])
        
        /*
         NSLayoutConstraint.activate([
         containerView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
         containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
         containerView.trailingAnchor.constraint(equalTo: view.safeTrailingAnchor, constant: -20),
         containerView.bottomAnchor.constraint(equalTo: nextButton.topAnchor)
         ])
         */
        
        /*
         NSLayoutConstraint.activate([
         profileCreationWizard.view.topAnchor.constraint(equalTo: containerView.topAnchor),
         profileCreationWizard.view.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
         profileCreationWizard.view.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
         profileCreationWizard.view.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
         ])
         */
        /*
         NSLayoutConstraint.activate([
         profileCreationWizard.view.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
         profileCreationWizard.view.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
         profileCreationWizard.view.trailingAnchor.constraint(equalTo: view.safeTrailingAnchor, constant: -20),
         profileCreationWizard.view.bottomAnchor.constraint(equalTo: nextButton.topAnchor)
         ])
         */
        
    }
    //TODO:
    //    @IBAction func didTapNextButton(_ sender: Any) {
    //        profileCreationWizard?.scrollToNextViewController()
    //    }
    
    /**
     Fired when the user taps on the pageControl to change its current page.
     */
    @objc func didChangePageControlValue() {
        //TODO:
        profileCreationWizard.scrollToViewController(index: pageControl.currentPage)
    }
    
    @objc func didTapNextButton() {
        
        if let profileQuestion = profileCreationWizard.getSelectedOption() {
            print("selected option: \(String(describing: profileQuestion))")
            
            //TODO: export logic in a view model or manager.
            //update account profile
            userRepo.getAllUsers(on: nil, completionHandler: { (users) in
                guard let user = users.last else { return }
                
                var tempUser = user
                //TODO: add questionDbIdentifier to ProfileQuestion
                //add a mapping function from question to userProfile structure
                /*
                 if profileQuestion.questionDbIdentifier == genderId  //TODO: can we do reflection??
                 userProfile.gender = profileQuestion.selectedAnswer
                 
                 */
                
                var userProfile = user.userProfile ?? UserProfileDTO()
                
                if profileQuestion.questionIdentifier == "gender" {
                    if profileQuestion.selectedAnswer == "man" {
                        userProfile.gender = .man
                    }
                    if profileQuestion.selectedAnswer == "woman" {
                        userProfile.gender = .woman
                    }
                }
                
                if profileQuestion.questionIdentifier == "age" {
                    if let answer = profileQuestion.selectedAnswer, let age = Int(answer) {
                        userProfile.age = age
                    }
                }
                
                if profileQuestion.questionIdentifier == "height" {
                    if let answer = profileQuestion.selectedAnswer, let height = Int(answer) {
                        userProfile.height = height
                    }
                }
                
                if profileQuestion.questionIdentifier == "weight" {
                    if let answer = profileQuestion.selectedAnswer, let weight = Double(answer) {
                        userProfile.weight = weight
                    }
                }
                
                tempUser.userProfile = userProfile
                
                userRepo.updateUser(tempUser)
            })
        }
        
        if pageControl.currentPage < pageControl.numberOfPages - 1 {
            profileCreationWizard.scrollToNextViewController()
        } else {
            signupCoordinator?.showHomeVC()
            //TODO: better would be to call a generic next or route method passing the class identifier,
            //so that if we change the flow, we don't have to modifiy the controllers but only the router.
        }
    }
}

extension ProfileCreationViewController: ProfileCreationWizardDelegate {
    
    func profileCreationWizard(profileCreationWizard: ProfileCreationWizard, didUpdatePageCount count: Int) {
        pageControl.numberOfPages = count
    }
    
    func profileCreationWizard(profileCreationWizard: ProfileCreationWizard, didUpdatePageIndex index: Int) {
        pageControl.currentPage = index
    }
    
    //TODO: somehow complex both with delegate or injecting a closure... we could send a message with dispatch.
    
}

extension ProfileCreationViewController: AnswerAction {
    //func optionSelected(option: String) {
    func optionSelected(sender: AnyObject) {
        nextButton.isEnabled = true
    }
}

@objc protocol AnswerAction: AnyObject {
    //func optionSelected(option: String)
    func optionSelected(sender: AnyObject)
}
