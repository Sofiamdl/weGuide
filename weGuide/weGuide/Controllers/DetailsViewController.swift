//
//  DetailsViewController.swift
//  UNATI
//
//  Created by sml on 18/05/22.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var courseImage: UIImageView!
    
    @IBOutlet weak var day1: UILabel!
    @IBOutlet weak var day2: UILabel!
    @IBOutlet weak var hour: UILabel!
    @IBOutlet weak var courseTitle: UILabel!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var courseDescription: UILabel!
    @IBOutlet weak var stackView: UIStackView!
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var iconAddress: UIImageView!
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var dot1: UIImageView!
    @IBOutlet weak var dot2: UIImageView!
    
    @IBOutlet weak var navigationBar: UINavigationItem!
    @IBOutlet weak var subScrollView: UIView!
    @IBOutlet weak var buttonRegister: UIButton!
    var courseObject: CourseCard = CourseCard(image: "", day1: "", day2: "", hour: "", title: "", address: "", descriptionText: "", link:"");

    
    override func viewDidLoad() {
        super.viewDidLoad()
        constraints()
        stylization()
        navigationController?.navigationBar.barTintColor = UIColor(red: 255/255.0, green: 90/255.0, blue: 90/255.0, alpha: 0.0)
        
        navigationController?.navigationBar.tintColor = UIColor.white
        // Do any additional setup after loading the view.
        changeInformations()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    @IBAction func clickRegister(_ sender: UIButton) {
        print(courseObject.link)
        if let url = URL(string: courseObject.link) {
                UIApplication.shared.open(url)
        }
    }

    private func constraints(){
        
        let views = [
            courseImage,
            topView,
            stackView,
            courseTitle,
            address,
            iconAddress,
            descriptionLabel,
            courseDescription,
            buttonRegister,
            scrollView,
            subScrollView,
            dot1,
            dot2
        ];
        
        views.forEach { view in
            view?.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            topView.heightAnchor.constraint(equalToConstant: 94),
            topView.topAnchor.constraint(equalTo: self.view.topAnchor),
            topView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            topView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            
            scrollView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            scrollView.topAnchor.constraint(equalTo: topView.bottomAnchor),
            scrollView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            scrollView.bottomAnchor.constraint(equalTo: buttonRegister.topAnchor, constant: -10),
                        
            subScrollView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            subScrollView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            subScrollView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            subScrollView.bottomAnchor.constraint(equalTo: courseDescription.bottomAnchor, constant: 140),
                   
            
            courseImage.topAnchor.constraint(equalTo: subScrollView.topAnchor, constant: 20),
            courseImage.leftAnchor.constraint(equalTo: subScrollView.leftAnchor, constant: 24),
            courseImage.rightAnchor.constraint(equalTo: subScrollView.rightAnchor, constant: -24),
            courseImage.heightAnchor.constraint(equalToConstant: 208),
            
            stackView.topAnchor.constraint(equalTo: courseImage.bottomAnchor, constant: 24),
            stackView.leftAnchor.constraint(equalTo: subScrollView.leftAnchor, constant: 24),
            
            courseTitle.topAnchor.constraint(equalTo: stackView.bottomAnchor,constant: 24),
            courseTitle.leftAnchor.constraint(equalTo: subScrollView.leftAnchor, constant: 24),
            courseTitle.trailingAnchor.constraint(equalTo: subScrollView.trailingAnchor, constant: -24),
            
            iconAddress.topAnchor.constraint(equalTo: courseTitle.bottomAnchor, constant: 24),
            iconAddress.heightAnchor.constraint(equalToConstant: 26),
            iconAddress.widthAnchor.constraint(equalToConstant: 27),
            iconAddress.leftAnchor.constraint(equalTo: subScrollView.leftAnchor, constant: 24),
            
            address.topAnchor.constraint(equalTo: iconAddress.topAnchor, constant: 3),
            address.leftAnchor.constraint(equalTo: iconAddress.rightAnchor, constant: 16),
            address.rightAnchor.constraint(equalTo: subScrollView.rightAnchor, constant: -24),
            
            descriptionLabel.topAnchor.constraint(equalTo: address.bottomAnchor, constant: 48),
            descriptionLabel.leftAnchor.constraint(equalTo: subScrollView.leftAnchor, constant: 24),
            
            courseDescription.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 20),
            courseDescription.leftAnchor.constraint(equalTo: subScrollView.leftAnchor, constant: 24),
            courseDescription.rightAnchor.constraint(equalTo: subScrollView.rightAnchor, constant: -24),
            
            buttonRegister.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 24),
            buttonRegister.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -24),
            buttonRegister.heightAnchor.constraint(equalToConstant: 72),
            buttonRegister.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -50),
            
            dot1.widthAnchor.constraint(equalToConstant: 7),
            dot2.widthAnchor.constraint(equalToConstant: 7)

        ])
    }
    
    private func changeInformations() {
        courseImage.image = UIImage(named: courseObject.image)
        courseTitle.text = courseObject.title
        day2.text = courseObject.day2
        hour.text = courseObject.hour
        day1.text = courseObject.day1
        address.text = courseObject.address
        courseDescription.text = courseObject.descriptionText
    }
    
    private func stylization() {
        buttonRegister.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        buttonRegister.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        buttonRegister.layer.shadowOpacity = 1.0
        
        courseTitle.numberOfLines = 0
        courseDescription.numberOfLines = 0
        address.numberOfLines = 0

    }
}
