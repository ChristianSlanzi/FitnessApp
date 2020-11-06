//
//  RoutineExerciseCell.swift
//  FitnessApp
//
//  Created by Christian Slanzi on 03.11.20.
//
import UIKit

public class RoutineExerciseCell: UITableViewCell {
    
    var item: ExerciseDTO? {
        didSet {
            //if(tintColor != nil){
            //    menuItem?.itemIcon = (menuItem?.itemIcon.withRenderingMode(.alwaysTemplate))!
            //}
            if let item = item {
                littleImage.image = UIImage(named: item.imageName)
                titleLabel.text = item.title
                setsLabel.text = "\(item.series)"
                timeLabel.text = item.duration.toString()//"00:00:60"//item.time
            }
        }
    }
    
    private let statusIcon: UIImageView = {
        let imgView = UIImageView(image: UIImage(named: "EmptyStatus"))
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.contentMode = .scaleAspectFit
        imgView.clipsToBounds = true
        return imgView
    }()
    
    private let littleImage: UIImageView = {
        let imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.contentMode = .scaleAspectFill
        imgView.clipsToBounds = true
        return imgView
    }()
    
    private let titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = UIColor(hexString: "#7C7E82")
        lbl.font = UIFont.boldSystemFont(ofSize: 12)
        lbl.textAlignment = .left
        //lbl.adjustsFontSizeToFitWidth = true
        return lbl
    }()
    
    private let setsLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = UIColor(hexString: "#7C7E82")
        lbl.font = UIFont.systemFont(ofSize: 12)
        lbl.textAlignment = .left
        //lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        return lbl
    }()
    
    private let timeLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = UIColor(hexString: "#7C7E82")
        lbl.font = UIFont.systemFont(ofSize: 12)
        lbl.textAlignment = .left
        //lbl.adjustsFontSizeToFitWidth = true
        return lbl
    }()
    
    //divider?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupConstraints()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        backgroundColor = .clear
        addSubview(statusIcon)
        addSubview(littleImage)
        addSubview(titleLabel)
        addSubview(setsLabel)
        addSubview(timeLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            statusIcon.leftAnchor.constraint(equalTo: leftAnchor, constant: 8),
            statusIcon.widthAnchor.constraint(equalToConstant: 34),
            statusIcon.heightAnchor.constraint(equalToConstant: 34),
            statusIcon.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0)
        ])
        
        NSLayoutConstraint.activate([
            littleImage.leftAnchor.constraint(equalTo: statusIcon.rightAnchor, constant: 8),
            littleImage.widthAnchor.constraint(equalToConstant: 48),
            littleImage.heightAnchor.constraint(equalToConstant: 48),
            littleImage.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0)
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.leftAnchor.constraint(equalTo: littleImage.rightAnchor, constant: 8),
            titleLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
            titleLabel.heightAnchor.constraint(equalToConstant: 48),
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 4)
        ])
        
        NSLayoutConstraint.activate([
            setsLabel.leftAnchor.constraint(equalTo: littleImage.rightAnchor, constant: 8),
 //           setsLabel.widthAnchor.constraint(equalToConstant: 70),
            setsLabel.heightAnchor.constraint(equalToConstant: 48),
            setsLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -4)
        ])
        
        NSLayoutConstraint.activate([
            timeLabel.leftAnchor.constraint(equalTo: setsLabel.rightAnchor, constant: 34),
 //           timeLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
            timeLabel.heightAnchor.constraint(equalToConstant: 48),
            timeLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -4)
        ])
 
    }
}
