//
//  RoutineContentCell.swift
//  FitnessApp
//
//  Created by Christian Slanzi on 31.10.20.
//

import CS_Common_UI

class RoutineContentCell: UICollectionViewCell, ConfigurableCell, CoordinatedCell {
    func coordinatedBy(_ coordinator: AnyObject) {
        self.coordinator = coordinator as? ShowingRoutineDetail
    }
    
    var routine: RoutineDTO?
    
    func configure(_ item: RoutineDTO, at indexPath: IndexPath) {
        contentImage.image = UIImage(named: item.imageName)
        title.text = item.title
        badge.text = item.badgeText
        self.routine = item
    }
    
    var boundChanged = false
    
    var coordinator: ShowingRoutineDetail?
    
    lazy var contentImage: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 12
        
        //TODO: doesnt work, bounds not set yet
        /*
        let myLayer = CALayer()
        let myImage = UIImage(named: "Overlay")?.cgImage
        myLayer.frame = imageView.bounds
        myLayer.contents = myImage
        imageView.layer.addSublayer(myLayer)
        */
        return imageView
    }()
    var title: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12)
        label.textColor = .white
        label.numberOfLines = 2
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    var check: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    var badge: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor(hexString: "#3EC7E6")
        label.layer.cornerRadius = 7.5
        label.layer.masksToBounds = true
        label.font = .systemFont(ofSize: 9)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupViews()
        setupConstraints()
        setupActions()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        addSubview(contentImage)
        
        addSubview(title)
        addSubview(check)
        addSubview(badge)
    }
    
    func setupActions() {
        //createAccountButton.addTarget(self, action: #selector(onCreateAccountButtonSelected(_:)), for: .touchUpInside)

        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(cellTapped(tapGestureRecognizer:)))
        self.isUserInteractionEnabled = true
        self.addGestureRecognizer(tapGestureRecognizer)
    }
    
    func setupConstraints() {
        
        self.widthAnchor.constraint(equalToConstant: 124).isActive = true
        self.heightAnchor.constraint(equalToConstant: 155).isActive = true
        
        contentImage.anchor(top: topAnchor, paddingTop: 0, bottom: bottomAnchor, paddingBottom: 0,
                            left: leftAnchor, paddingLeft: 0, right: rightAnchor, paddingRight: 0, width: 0, height: 0)
        
        check.anchor(top: topAnchor, paddingTop: 8, bottom: nil, paddingBottom: 0,
                     left: nil, paddingLeft: 0, right: rightAnchor, paddingRight: 8, width: 25, height: 25)
        
        title.anchor(top: nil, paddingTop: 0, bottom: badge.topAnchor, paddingBottom: 0,
                     left: leftAnchor, paddingLeft: 5, right: rightAnchor, paddingRight: 40, width: 0, height: 40)
        
        badge.anchor(top: nil, paddingTop: 0, bottom: bottomAnchor, paddingBottom: 5,
                     left: leftAnchor, paddingLeft: 5, right: rightAnchor, paddingRight: 15, width: 0, height: 15)
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        //TODO: not nice!
        if !boundChanged {
            let myLayer = CALayer()
            let myImage = UIImage(named: "Overlay")?.cgImage
            myLayer.frame = contentImage.bounds
            myLayer.contents = myImage
            contentImage.layer.addSublayer(myLayer)
            boundChanged = true
        }
    }
    
    @objc func cellTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        guard let routine = routine else {
            return
        }
        coordinator?.showRoutineDetail(with: routine)
    }
}
