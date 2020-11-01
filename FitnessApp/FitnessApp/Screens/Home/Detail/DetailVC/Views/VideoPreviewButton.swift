//
//  VideoPreviewButton.swift
//  FitGoal
//
//  Created by Christian Slanzi on 15.03.20.
//  Copyright © 2020 Christian Slanzi. All rights reserved.
//

import CS_Common_UI

class VideoPreviewButton: CustomView {
    
    //public var autoplay: Bool = false
    
    private let imageView: UIImageView = {
       let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .clear
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let iconPlayView: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "PlayButton")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .clear
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    // TODO: extract in a VideoPlayerViewModel to inject together with VideoData
    private let videoPlayerView: VideoPlayerView = {
        
        let name = "bulletTrain"
        let title = "Bullet Train Adventure"
        let subtitle = "Enjoying the soothing view of passing towns in Japan"
        
        // TODO: make video parameter as optional
        let urlPath = Bundle.main.path(forResource: name, ofType: "mp4")!
        let url = URL(fileURLWithPath: urlPath)
        let thumbURLPath = Bundle.main.path(forResource: name, ofType: "png")!
        let thumbURL = URL(fileURLWithPath: thumbURLPath)
        
        let video = Video(url: url, thumbURL: thumbURL, title: title, subtitle: subtitle)
        
        let view = VideoPlayerView(clip: video)
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(imageView)
        addSubview(iconPlayView)
        //addSubview(videoPlayerView)
        
    }
    
    override func setupActions() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapView))
        addGestureRecognizer(tapGesture)
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        
        NSLayoutConstraint.activate([
        imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
        imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
        imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
        imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0)
        ])
        
        NSLayoutConstraint.activate([
        iconPlayView.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0),
        iconPlayView.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0),
        iconPlayView.widthAnchor.constraint(equalToConstant: 72),
        iconPlayView.heightAnchor.constraint(equalToConstant: 72)
        ])
        
    }
    
    public func setImage(_ imageName: String) {
        imageView.image = UIImage(named: imageName)
    }
    
    @objc private func didTapView() {
        play()
    }
    
    //TODO: or better an autoplay flag?
    public func play() {
        addSubview(videoPlayerView)
        NSLayoutConstraint.activate([
        videoPlayerView.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0),
        videoPlayerView.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0),
        videoPlayerView.widthAnchor.constraint(equalTo: self.widthAnchor),
        videoPlayerView.heightAnchor.constraint(equalTo: self.heightAnchor)
        ])
        
        //TODO
        //videoPlayerView.play()
    }
    
    public func pause() {
        //TODO
        //videoPlayerView.pause()
    }
    
}
