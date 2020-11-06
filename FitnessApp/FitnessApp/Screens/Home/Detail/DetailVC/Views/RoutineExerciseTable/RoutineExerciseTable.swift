//
//  RoutineExerciseTable.swift
//  FitGoal
//
//  Created by Christian Slanzi on 16.03.20.
//  Copyright © 2020 Christian Slanzi. All rights reserved.
//

import CS_Common_UI

class RoutineExerciseTable: CustomView {
    
    let tableView = UITableView()
    let cellId = "cellId"
    
    public var items = [ExerciseDTO]() {
        didSet {
            self.layoutIfNeeded()
        }
    }
    
    override func setupViews() {
        super.setupViews()
        addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(RoutineExerciseCell.self, forCellReuseIdentifier: cellId)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .clear
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        
        tableView.anchor(top: topAnchor, paddingTop: 9, bottom: bottomAnchor, paddingBottom: 9,
                         left: leftAnchor, paddingLeft: 13, right: rightAnchor, paddingRight: 13, width: 0, height: 0)
    }
}

extension RoutineExerciseTable: UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
            as? RoutineExerciseCell else { return UITableViewCell() }
//        cell.backgroundColor = self.view.backgroundColor
        let currentLastItem = items[indexPath.row]
        cell.item = currentLastItem
        return cell
    }
}

extension RoutineExerciseTable: UITableViewDelegate {

    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
