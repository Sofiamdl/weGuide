//
//  ViewController.swift
//  UNATI
//
//  Created by sml on 16/05/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        courseCollection.dataSource = self
        courseCollection.delegate = self
        constraints()
        stylization()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    @IBOutlet weak var searchTextFieldView: UIView!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var courseCollection: UICollectionView!
    @IBOutlet weak var magnifyingGlassButton: UIButton!
    @IBOutlet weak var courseLabel: UILabel!
    
    @IBAction func testeButtton(_ sender: UIButton) {
        print("oi")

    }

    
    
    var coursesArray:[CourseCard] = [CourseCard(image: "theater", day1: "QUI", day2: "SEX", hour: "17:00", title: "TEATRO CORPO E SAÚDE - UNATI 2022.1", address: "Av. Jorn. Aníbal Fernandes - Cidade Universitária", descriptionText: "Curso de Teatro ministrado pela professora Graça. Orientação de matrícula UnATI para o primeiro semestre de 2022: Cada aluno só poderá se inscrever em 01(um) curso. As inscrições estão condicionadas ao número de vagas definidas por curso; A idade mínima exigida para inscrição no curso é de 60 anos; No primeiro dia de aula, o aluno deverá apresentar o RG.Anexar o comprovante de vacinação no formulário.", link:"https://docs.google.com/forms/d/e/1FAIpQLSdgVPzkfyHGfEOOF7Wz0ueE-CBgIJaKR1z53GlTIGCle79XHg/viewform"), CourseCard(image: "danca", day1: "SEG", day2: "QUA", hour: "15:00", title: "DANÇA DO VENTRE - UNATI 2022.1", address: "Av. Jorn. Aníbal Fernandes - Cidade Universitária", descriptionText: "Curso de Dança do Ventre, ministrado pela professora Wilma. Orientação de matrícula UnATI para o primeiro semestre de 2022: Cada aluno só poderá se inscrever em 01(um) curso. As inscrições estão condicionadas ao número de vagas definidas por curso; A idade mínima exigida para inscrição no curso é de 60 anos; No primeiro dia de aula, o aluno deverá apresentar o RG.Anexar o comprovante de vacinação no formulário.", link:"https://docs.google.com/forms/d/e/1FAIpQLSdgVPzkfyHGfEOOF7Wz0ueE-CBgIJaKR1z53GlTIGCle79XHg/viewform"), CourseCard(image: "espanhol", day1: "SEG", day2: "QUA", hour: "9:00", title: "ESPANHOL BÁSICO 1 - UNATI 2022.1", address: "Av. Jorn. Aníbal Fernandes - Cidade Universitária", descriptionText: "Curso de Espanhol Básico 1, ministrado pelo professor Silvio. Orientação de matrícula UnATI para o primeiro semestre de 2022: Cada aluno só poderá se inscrever em 01(um) curso. As inscrições estão condicionadas ao número de vagas definidas por curso; A idade mínima exigida para inscrição no curso é de 60 anos; No primeiro dia de aula, o aluno deverá apresentar o RG.Anexar o comprovante de vacinação no formulário.", link:"https://docs.google.com/forms/d/e/1FAIpQLSdgVPzkfyHGfEOOF7Wz0ueE-CBgIJaKR1z53GlTIGCle79XHg/viewform"), CourseCard(image: "coral", day1: "TER", day2: "QUI", hour: "14:00", title: "CORAL - UNATI 2022.1", address: "Av. Jorn. Aníbal Fernandes - Cidade Universitária", descriptionText: "Curso de Coral, ministrado pelo professor Fernando. Orientação de matrícula UnATI para o primeiro semestre de 2022: Cada aluno só poderá se inscrever em 01(um) curso. As inscrições estão condicionadas ao número de vagas definidas por curso; A idade mínima exigida para inscrição no curso é de 60 anos; No primeiro dia de aula, o aluno deverá apresentar o RG.Anexar o comprovante de vacinação no formulário.", link:"https://docs.google.com/forms/d/e/1FAIpQLSdgVPzkfyHGfEOOF7Wz0ueE-CBgIJaKR1z53GlTIGCle79XHg/viewform") ]
    
    
    private func constraints(){
        
        let views = [
            courseCollection,
            searchTextFieldView,
            searchTextField,
            magnifyingGlassButton,
            courseLabel
        ];
        
        views.forEach { view in
            view?.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            courseCollection.topAnchor.constraint(equalTo: courseLabel.bottomAnchor, constant: 24),
            courseCollection.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
//            courseCollection.heightAnchor.constraint(equalToConstant: 300),
            courseCollection.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            courseCollection.rightAnchor.constraint(equalTo: self.view.rightAnchor),

            searchTextFieldView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 54),
            searchTextFieldView.heightAnchor.constraint(equalToConstant: 56),
            searchTextFieldView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 24),
            searchTextFieldView.rightAnchor.constraint(equalTo: self.view.leftAnchor, constant: UIScreen.main.bounds.width - 24),

            searchTextField.leftAnchor.constraint(equalTo: searchTextFieldView.leftAnchor, constant: 24),
            searchTextField.centerYAnchor.constraint(equalTo: searchTextFieldView.centerYAnchor),
            searchTextField.rightAnchor.constraint(equalTo: magnifyingGlassButton.leftAnchor, constant: -6),

            magnifyingGlassButton.rightAnchor.constraint(equalTo: searchTextFieldView.rightAnchor, constant: -24),
            magnifyingGlassButton.centerYAnchor.constraint(equalTo: searchTextFieldView.centerYAnchor),
            magnifyingGlassButton.centerYAnchor.constraint(equalTo: searchTextFieldView.centerYAnchor),
            magnifyingGlassButton.heightAnchor.constraint(equalToConstant: 20),
            magnifyingGlassButton.widthAnchor.constraint(equalToConstant: 20),
            
            courseLabel.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 24),
            courseLabel.topAnchor.constraint(equalTo: searchTextFieldView.bottomAnchor, constant: 24),
            
        ])
    }
    
    private func stylization() {
        searchTextFieldView.layer.cornerRadius = 4
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "courseDetailsSegue" {
            let backItem = UIBarButtonItem()
            backItem.title = "Voltar"
            navigationItem.backBarButtonItem = backItem // This will show in the next view controller being pushed
            
            guard let indexPath = courseCollection.indexPathsForSelectedItems?.first else { return }
            let details = segue.destination as! DetailsViewController
            details.courseObject = coursesArray[indexPath.row]
            
        }
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    // qntd celulas
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return coursesArray.count
    }
    
    //desenhar celulas
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "courseCell", for: indexPath) as! CourseCell
            let card = coursesArray[indexPath.row]
            cell.draw(card)
            return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if (collectionView.cellForItem(at: indexPath) as? CourseCell) != nil {
                performSegue(withIdentifier: "courseDetailsSegue", sender: nil)
            }
            
        }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: self.view.frame.width - 48, height: 400)
    }
    
    
}
