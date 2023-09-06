//
//  DetailView.swift
//  RickAndMorty
//
//  Created by Максим Зыкин on 18.08.2023.
//

import UIKit

class DetailView: UIViewController {
    
    var character: RickAndMorty!
    
    private var scrollView: UIScrollView = {
        let view = UIScrollView()
        view.showsVerticalScrollIndicator = false
        view.isDirectionalLockEnabled = true
        view.showsHorizontalScrollIndicator = false
        return view
    }()

    private let contentView: UIView = {
        let view = UIView()
        return view
    }()
    
     var imagePerson: UIImageView = {
         var image = UIImageView()
         image.frame.size = CGSize(width: 148, height: 148)
         image.layer.cornerRadius = 16
         image.layer.masksToBounds = true
         return image
    }()
    
    var namePerson = CustomLabel(text: "", textAlignment: .center, size: 25, color: .white, font: .bold)
    
    var statusPerson = CustomLabel(text: "", textAlignment: .center, size: 20, color: UIColor(red: 71/255, green: 198/255, blue: 11/22, alpha: 255/255), font: .regular)
    
    var infoLabel = CustomLabel(text: "Info", size: 22, color: .white, font: .bold)
    
    var speciesPerson = CustomLabel(text: "", size: 20, color: .white, font: .regular)

    var typePerson = CustomLabel(text: "Type: None", size: 20, color: .white, font: .regular)
    
    var genderPerson = CustomLabel(text: "", size: 20, color: .white, font: .regular)

    var originLabel = CustomLabel(text: "Orign", size: 22, color: .white, font: .bold)
    
    var originPerson = CustomLabel(text: "", size: 20, color: .white, font: .regular)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        
        view.backgroundColor = UIColor(
            red: 4/255,
            green: 12/255,
            blue: 30/255,
            alpha: 255/255
        )
        
        self.view.addSubview(scrollView)
        self.scrollView.addSubview(contentView)
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            scrollView.topAnchor.constraint(equalTo: self.view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            
            contentView.topAnchor.constraint(equalTo: self.scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor),
            contentView.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor),
            ])
    
        self.view.addSubview(imagePerson)
        self.view.addSubview(namePerson)
        self.view.addSubview(statusPerson)
        self.view.addSubview(infoLabel)
        self.view.addSubview(speciesPerson)
        self.view.addSubview(typePerson)
        self.view.addSubview(genderPerson)
        self.view.addSubview(originLabel)
        self.view.addSubview(originPerson)
        
        namePerson.translatesAutoresizingMaskIntoConstraints = false
        imagePerson.translatesAutoresizingMaskIntoConstraints = false
        statusPerson.translatesAutoresizingMaskIntoConstraints = false
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        speciesPerson.translatesAutoresizingMaskIntoConstraints = false
        typePerson.translatesAutoresizingMaskIntoConstraints = false
        genderPerson.translatesAutoresizingMaskIntoConstraints = false
        originLabel.translatesAutoresizingMaskIntoConstraints = false
        originPerson.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([

            imagePerson.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            imagePerson.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
            imagePerson.widthAnchor.constraint(equalToConstant: 170),
            imagePerson.heightAnchor.constraint(equalToConstant: 170),
            
            namePerson.topAnchor.constraint(equalTo: imagePerson.bottomAnchor, constant: 20),
            namePerson.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            namePerson.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
        
            statusPerson.topAnchor.constraint(equalTo: namePerson.bottomAnchor, constant: 10),
            statusPerson.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            statusPerson.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),

            infoLabel.topAnchor.constraint(equalTo: statusPerson.bottomAnchor, constant: 10),
            infoLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 24),
            infoLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            
            speciesPerson.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: 10),
            speciesPerson.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 34),
            speciesPerson.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            
            typePerson.topAnchor.constraint(equalTo: speciesPerson.bottomAnchor, constant: 10),
            typePerson.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 34),
            typePerson.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            
            genderPerson.topAnchor.constraint(equalTo: typePerson.bottomAnchor, constant: 10),
            genderPerson.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 34),
            genderPerson.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            
            originLabel.topAnchor.constraint(equalTo: genderPerson.bottomAnchor, constant: 10),
            originLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 24),
            originLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            
            originPerson.topAnchor.constraint(equalTo: originLabel.bottomAnchor, constant: 10),
            originPerson.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 34),
            originPerson.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            
            originPerson.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -20),
        ])
    }
}
