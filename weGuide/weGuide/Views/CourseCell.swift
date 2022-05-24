//
//  CourseCell.swift
//  UNATI
//
//  Created by sml on 17/05/22.
//

import UIKit


class CourseCell: UICollectionViewCell {
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var day1: UILabel!
    @IBOutlet weak var day2: UILabel!
    @IBOutlet weak var hour: UILabel!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var dot1: UIImageView!
    @IBOutlet weak var shadowView: UIView!
    @IBOutlet weak var dot2: UIImageView!
    @IBOutlet weak var iconCell: UIImageView!
    @IBOutlet weak var contentOfCell: UIView!
    
    private func constraints(){
        
        let views = [
            image,
            title,
            address,
            day1,
            day2,
            hour,
            stackView,
            iconCell,
            shadowView
        ];
        
        views.forEach { view in
            view?.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            image.leftAnchor.constraint(equalTo: self.leftAnchor),
            image.rightAnchor.constraint(equalTo: self.rightAnchor),
            
            stackView.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 14),
            stackView.leftAnchor.constraint(equalTo: image.leftAnchor, constant: 8),
            
            title.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 18),
            title.rightAnchor.constraint(equalTo: image.rightAnchor, constant: 8),
            title.leftAnchor.constraint(equalTo: image.leftAnchor, constant: 8),
            
            iconCell.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 18),
            iconCell.leftAnchor.constraint(equalTo: image.leftAnchor, constant: 8),
            
            address.topAnchor.constraint(equalTo: iconCell.topAnchor, constant: 2),
            address.leftAnchor.constraint(equalTo: iconCell.rightAnchor, constant: 10),
            address.rightAnchor.constraint(equalTo: image.rightAnchor, constant: 8),
            
            dot1.widthAnchor.constraint(equalToConstant: 7),
            dot2.widthAnchor.constraint(equalToConstant: 7),
            
            contentOfCell.topAnchor.constraint(equalTo: image.topAnchor),
            contentOfCell.bottomAnchor.constraint(equalTo: address.bottomAnchor, constant: 10),
            contentOfCell.leftAnchor.constraint(equalTo: image.leftAnchor),
            contentOfCell.rightAnchor.constraint(equalTo: image.rightAnchor),

            shadowView.topAnchor.constraint(equalTo: image.topAnchor),
            shadowView.bottomAnchor.constraint(equalTo: address.bottomAnchor, constant: 6),
            shadowView.leftAnchor.constraint(equalTo: contentOfCell.leftAnchor),
            shadowView.rightAnchor.constraint(equalTo: contentOfCell.rightAnchor)
        ])
    }
    
    private func stylization() {
        title.numberOfLines = 0
        address.numberOfLines = 0
        
        shadowView.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        shadowView.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        shadowView.layer.shadowOpacity = 1.0

    }
    
    func draw(_ courseCard: CourseCard) {
        image.image = UIImage(named: courseCard.image)
        title.text = courseCard.title
        day2.text = courseCard.day2
        hour.text = courseCard.hour
        day1.text = courseCard.day1
        address.text = courseCard.address
        constraints()
        stylization()
    }
}
