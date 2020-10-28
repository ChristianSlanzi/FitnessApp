//
//  OnBoardingViewController.swift
//  FitnessApp
//
//  Created by Christian Slanzi on 28.10.20.
//

import UIKit

class OnBoardingViewController: UIPageViewController, UIPageViewControllerDelegate {
    
    //coordinator
    public weak var coordinator: MovingToNextVC?
    var onBoardingData: OnBoardingData?
    
    lazy var backgroundImageView: UIImageView = {
       let backgroundImageView = UIImageView()
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        backgroundImageView.image = UIImage(named: "Background")
        backgroundImageView.contentMode = .scaleAspectFill
        return backgroundImageView
    }()
    
    lazy var skipButton: UIButton = {
        let button = UIButton()
        button.isEnabled = true//false //TODO
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("skip", for: .normal)
        //button.setImage(UIImage(named: "ButtonArrowRight"), for: .normal)
        button.addTarget(self, action: #selector(didTapSkipButton), for: .touchUpInside)
        return button
    }()
    
    lazy var nextButton: UIButton = {
        let button = UIButton()
        button.isEnabled = true//false //TODO
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("next", for: .normal)
        //button.setImage(UIImage(named: "ButtonArrowRight"), for: .normal)
        button.addTarget(self, action: #selector(didTapNextButton), for: .touchUpInside)
        return button
    }()
        
    fileprivate lazy var orderedViewController: [UIViewController] = {
        
        guard let onBoardingData = onBoardingData else { return [UIViewController]() }
        
        var pages = [UIViewController]()
        for page in onBoardingData.pages {
            pages.append(getViewController(withPageData: page))
        }
        return pages

    }()
    
    fileprivate func getViewController(withPageData data: OnBoardingData.Page) -> UIViewController {
        let viewController = OnBoardingPage()
        //viewController.backgroundColor = .clear//.random()
        viewController.titleText = data.title
        viewController.subtitleText = data.subtitle
        viewController.descriptionText = data.text
        viewController.imageName = data.imageName
        
        return viewController
        //return (storyboard?.instantiateViewController(withIdentifier: identifier))!
    }
    
    // MARK: LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
        self.delegate = self
        
        if let firstVC = orderedViewController.first {
            setViewControllers([firstVC], direction: .forward, animated: true, completion: nil)
        }
        
        setupViews()
        setupConstraints()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setupViews() {
        view.addSubview(backgroundImageView)
        view.sendSubviewToBack(backgroundImageView)
        view.backgroundColor = .clear
        view.addSubview(skipButton)
        view.addSubview(nextButton)
        view.bringSubviewToFront(skipButton)
    }
    
    func setupConstraints() {
       NSLayoutConstraint.activate([
        backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
        backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
        backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            skipButton.bottomAnchor.constraint(equalTo: view.safeBottomAnchor),
            skipButton.leadingAnchor.constraint(equalTo: view.safeLeadingAnchor),
            skipButton.widthAnchor.constraint(equalToConstant: 120),
            skipButton.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        NSLayoutConstraint.activate([
            nextButton.bottomAnchor.constraint(equalTo: view.safeBottomAnchor),
            nextButton.trailingAnchor.constraint(equalTo: view.safeTrailingAnchor),
            nextButton.widthAnchor.constraint(equalToConstant: 120),
            nextButton.heightAnchor.constraint(equalToConstant: 30)
        ])
        
    }
    
    func presentationCount(for: UIPageViewController) -> Int {
        return orderedViewController.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        view.sendSubviewToBack(backgroundImageView)
    }
    
    @objc func didTapSkipButton() {
        //profileCreationWizard?.scrollToNextViewController()
        AppSettingsManager.saveIsOnboardingComplete(true)
        coordinator?.next()
    }
    
    @objc func didTapNextButton() {
        //profileCreationWizard?.scrollToNextViewController()
    }
}

// MARK: UIPageViewControllerDataSource

extension OnBoardingViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewController.firstIndex(of: viewController) else { return nil }
        let previousIndex = viewControllerIndex - 1
        guard previousIndex >= 0 else { return orderedViewController.last }
        guard orderedViewController.count > previousIndex else { return nil }
        return orderedViewController[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewController.firstIndex(of: viewController) else { return nil }
        let nextIndex = viewControllerIndex + 1
        guard nextIndex < orderedViewController.count else { return orderedViewController.first }
        guard orderedViewController.count > nextIndex else { return nil }
        return orderedViewController[nextIndex]
    }
}

