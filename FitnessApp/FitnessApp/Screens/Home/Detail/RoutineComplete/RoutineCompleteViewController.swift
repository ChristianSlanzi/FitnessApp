//
//  RoutineCompleteViewController.swift
//  FitnessApp
//
//  Created by Christian Slanzi on 02.11.20.
//

import CS_Common_UI

class RoutineCompleteViewController: BaseViewController {
    
    private let danceImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "dance")//, for: .normal)
        imageView.backgroundColor = .clear
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let messageView: MessageView = {
        var view = MessageView()
    //      view.backgroundColor = .yellow
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let shareOptionsView: ShareOptionsView = {
        var view = ShareOptionsView()
    //      view.backgroundColor = .yellow
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func setupViews() {
        super.setupViews()
        view.addSubview(danceImageView)
        view.addSubview(messageView)
        view.addSubview(shareOptionsView)
        
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        
        NSLayoutConstraint.activate([
            danceImageView.topAnchor.constraint(equalTo: view.safeTopAnchor, constant: 65),
            //videoPreviewButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            //videoPreviewButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 10),
            danceImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            danceImageView.widthAnchor.constraint(equalToConstant: 89),
            danceImageView.heightAnchor.constraint(equalToConstant: 101)
        ])
        
        NSLayoutConstraint.activate([
            messageView.topAnchor.constraint(equalTo: danceImageView.bottomAnchor, constant: 25),
            messageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            messageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0)
        ])
        
        NSLayoutConstraint.activate([
            shareOptionsView.topAnchor.constraint(equalTo: view.safeBottomAnchor, constant: -260),
            shareOptionsView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            shareOptionsView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0)
        ])
        
    }
    
}
