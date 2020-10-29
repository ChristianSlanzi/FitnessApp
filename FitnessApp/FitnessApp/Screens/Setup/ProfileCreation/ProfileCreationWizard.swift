//
//  ProfileCreationWizard.swift
//  FitGoal
//
//  Created by Christian Slanzi on 27.02.20.
//  Copyright © 2020 Christian Slanzi. All rights reserved.
//

import Foundation
import UIKit

class ProfileCreationWizard: UIPageViewController, UIPageViewControllerDelegate {
    
    weak var profileCreationWizardDelegate: ProfileCreationWizardDelegate?
    var profileCreationQuestions: [ProfileQuestion]?
        
    var answerCallback: (([String]) -> Void)?
    
    fileprivate lazy var orderedViewControllers: [UIViewController] = {
        var viewControllers = [UIViewController]()
        guard let questions = self.profileCreationQuestions else { return viewControllers }
        for index in 0..<questions.count {
            viewControllers.append(self.getViewController(withIdentifier: index))
        }

        return viewControllers
    }()
    
    fileprivate func getViewController(withIdentifier identifier: Int) -> UIViewController {
        
        var profileQuestion: ProfileQuestion!
        if let questions = profileCreationQuestions {
            profileQuestion = questions[identifier]
        }
        
        let viewController = ProfileCreationPage(question: profileQuestion)
        //viewController.backgroundColor = .random()
        
        return viewController
    }
    
    func getSelectedOption() -> ProfileQuestion? {
        guard let visibleViewController = viewControllers?.first as? ProfileCreationPage else { return nil }
        return visibleViewController.getSelectedOption()
    }
    
    /**
     Scrolls to the next view controller.
     */
    func scrollToNextViewController() {
        if let visibleViewController = viewControllers?.first,
            let nextViewController = pageViewController(self, viewControllerAfter: visibleViewController) {
                    scrollToViewController(viewController: nextViewController)
        }
    }
    
    /**
     Scrolls to the given 'viewController' page.
     
     - parameter viewController: the view controller to show.
     */
    private func scrollToViewController(viewController: UIViewController,
                                        direction: UIPageViewController.NavigationDirection = .forward) {
        setViewControllers([viewController],
            direction: direction,
            animated: true,
            completion: { (finished) -> Void in
                // Setting the view controller programmatically does not fire
                // any delegate methods, so we have to manually notify the
                // 'tutorialDelegate' of the new index.
                self.notifyTutorialDelegateOfNewIndex()
        })
    }
    
    /**
     Notifies '_tutorialDelegate' that the current page index was updated.
     */
    private func notifyTutorialDelegateOfNewIndex() {
        if let firstViewController = viewControllers?.first,
            let index = orderedViewControllers.firstIndex(of: firstViewController) {
            profileCreationWizardDelegate?.profileCreationWizard(profileCreationWizard: self, didUpdatePageIndex: index)
        }
    }
    
    /**
     Scrolls to the view controller at the given index. Automatically calculates
     the direction.
     
     - parameter newIndex: the new index to scroll to
     */
    func scrollToViewController(index newIndex: Int) {
        if let firstViewController = viewControllers?.first,
            let currentIndex = orderedViewControllers.firstIndex(of: firstViewController) {
            let direction: UIPageViewController.NavigationDirection = newIndex >= currentIndex ? .forward : .reverse
                let nextViewController = orderedViewControllers[newIndex]
                scrollToViewController(viewController: nextViewController, direction: direction)
        }
    }
    
    // MARK: LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //TODO:
//we don't want swipe gestures, so datasource won't be set.
//        self.dataSource = self
        
        self.delegate = self
        
        if let firstVC = orderedViewControllers.first {
            setViewControllers([firstVC], direction: .forward, animated: true, completion: nil)
        }
        
        setupViews()
        setupConstraints()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setupViews() {
        //view.backgroundColor = .clear
    }
    
    func setupConstraints() {
        
    }

    //we use a custom page control, so those two methods don't have to be implemented
/*
    func presentationCount(for: UIPageViewController) -> Int {
        return orderedViewControllers.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }
*/
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        //view.sendSubviewToBack(backgroundImageView)
    }
}

// MARK: UIPageViewControllerDataSource

extension ProfileCreationWizard: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.firstIndex(of: viewController) else { return nil }
        let previousIndex = viewControllerIndex - 1
        guard previousIndex >= 0 else { return orderedViewControllers.last }
        guard orderedViewControllers.count > previousIndex else { return nil }
        return orderedViewControllers[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.firstIndex(of: viewController) else { return nil }
        let nextIndex = viewControllerIndex + 1
        guard nextIndex < orderedViewControllers.count else { return orderedViewControllers.first }
        guard orderedViewControllers.count > nextIndex else { return nil }
        return orderedViewControllers[nextIndex]
    }
}

protocol ProfileCreationWizardDelegate: class {
    
    /**
     Called when the number of pages is updated.
     
     - parameter profileCreationWizard: the ProfileCreationWizard instance
     - parameter count: the total number of pages.
     */
    func profileCreationWizard(profileCreationWizard: ProfileCreationWizard,
                               didUpdatePageCount count: Int)
    
    /**
     Called when the current index is updated.
     
     - parameter profileCreationWizard: the ProfileCreationWizard instance
     - parameter index: the index of the currently visible page.
     */
    func profileCreationWizard(profileCreationWizard: ProfileCreationWizard,
                               didUpdatePageIndex index: Int)
    
    //func optionSelected(option: String)
    
}
