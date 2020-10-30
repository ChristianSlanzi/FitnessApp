//
//  HomeViewController.swift
//  FitnessApp
//
//  Created by Christian Slanzi on 30.10.20.
//

import CS_Common_UI

class HomeViewController: BaseViewController {
    
    var coordinator: ShowingRoutineDetail?
    var dataManager: AppDataManager
    
    private let navigationBar: NavigationBar = {
        
        //TODO!!!! ModelView must be injected!!!
        var modelView = NavigationBarModelView(titleText: "MY\nGOAL", subtitleText: "February", imageName: "Profile")
        
        let view = NavigationBar(modelView: modelView)
        view.translatesAutoresizingMaskIntoConstraints = false
        //view.backgroundColor = .systemBlue
        return view
    }()
    
    /*
    lazy var barChart: CustomCardView = {
        let view = CustomCardView()
        view.translatesAutoresizingMaskIntoConstraints = false
        //view.backgroundColor = .systemBlue
        return view
    }()
    */
    private let barChart: BasicBarChart = {
        let view = BasicBarChart()
        view.backgroundColor = .white
        view.layer.cornerRadius = 5
        let dataEntries = DataEntryGenerator().generateEmptyDataEntries()
        view.updateDataEntries(dataEntries: dataEntries, animated: false)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var contentVC: UIViewController = {
        let rootVC = UIViewController()
        rootVC.view.translatesAutoresizingMaskIntoConstraints = false
        return rootVC
    }()
    
    // MARK: Init & Setup
    init(dataManager: AppDataManager) {
        self.dataManager = dataManager
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setupViews() {
        super.setupViews()
        
        view.addSubview(navigationBar)
        view.addSubview(barChart)
        barChart.updateDataEntries(dataEntries: DataEntryGenerator().generateRandomDataEntries(), animated: false)

        add(childController: contentVC)
        
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        
        NSLayoutConstraint.activate([
            navigationBar.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            navigationBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            navigationBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            navigationBar.heightAnchor.constraint(equalToConstant: 140)
        ])
        
        NSLayoutConstraint.activate([
            barChart.topAnchor.constraint(equalTo: navigationBar.bottomAnchor, constant: 10),
            barChart.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            barChart.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            barChart.heightAnchor.constraint(equalToConstant: 200)
        ])
        
        NSLayoutConstraint.activate([
            contentVC.view.topAnchor.constraint(equalTo: barChart.bottomAnchor, constant: 20),
            contentVC.view.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            contentVC.view.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            contentVC.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
