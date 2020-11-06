//
//  HomeViewController.swift
//  FitnessApp
//
//  Created by Christian Slanzi on 30.10.20.
//

import CS_Common_UI

class HomeViewController: BaseViewController {
    
    var coordinator: ShowingRoutineDetail?
    var viewModel: HomeViewModel
    
    private typealias HomeContentContainer = ContainerController<RoutineDTO, RoutineContentCell, ExerciseDTO, ExerciseCell>
    
    private lazy var navigationBar: NavigationBar = {
        let view = NavigationBar(modelView: viewModel.getNavigationBarViewModel())
        view.translatesAutoresizingMaskIntoConstraints = false
        //view.backgroundColor = .systemBlue
        return view
    }()
    
    private lazy var barChart: BasicBarChart = { //TODO: create a BarChartViewModel
        let view = BasicBarChart()
        view.backgroundColor = .white
        view.layer.cornerRadius = 5
        view.updateDataEntries(dataEntries: viewModel.getDailyEntries(),
                               animated: false)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var contentVC: HomeContentContainer = {
        let rootVC = HomeContentContainer(model: viewModel.getHomeContentViewModel(), //TODO: move all inside view model
                                          collectionDatasource: viewModel.getRoutines(), // should viewModel contain even the coordinator?
                                          datasource: viewModel.getExercises(),
                                          coordinator: self.coordinator)
        rootVC.view.translatesAutoresizingMaskIntoConstraints = false
        return rootVC
    }()
    
    // MARK: Init & Setup
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setupViews() {
        super.setupViews()
        
        view.addSubviews(navigationBar, barChart)
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
