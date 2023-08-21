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
    
     var namePerson: UILabel = {
        var label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 25, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
      var statusPerson: UILabel = {
        var label = UILabel()
        label.textColor = UIColor(red: 71/255, green: 198/255, blue: 11/22, alpha: 255/255)
        label.font = .systemFont(ofSize: 20, weight: .regular)
        label.textAlignment = .center
        return label
    }()
    
    var infoLabel = CustomLabel(text: "Info", size: 22, color: .white, font: .bold)
    
    var speciesPerson: UILabel = {
        var label = UILabel()
        label.textColor = UIColor.white
        label.font = .systemFont(ofSize: 20, weight: .regular)
        label.textAlignment = .left
        return label
    }()
    
    var typePerson: UILabel = {
        var label = UILabel()
        label.textColor = UIColor.white
        label.font = .systemFont(ofSize: 20, weight: .regular)
        label.textAlignment = .left
        label.text = "Type: None"
        return label
    }()
    
    var genderPerson: UILabel = {
        var label = UILabel()
        label.textColor = UIColor.white
        label.font = .systemFont(ofSize: 20, weight: .regular)
        label.textAlignment = .left
        return label
    }()
    
    var viewModel: DetailViewModelProtocol!
    
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
    
        self.view.addSubview(imagePerson)
        self.view.addSubview(namePerson)
        self.view.addSubview(statusPerson)
        self.view.addSubview(infoLabel)
        self.view.addSubview(speciesPerson)
        self.view.addSubview(typePerson)
        self.view.addSubview(genderPerson)
        
        namePerson.translatesAutoresizingMaskIntoConstraints = false
        imagePerson.translatesAutoresizingMaskIntoConstraints = false
        statusPerson.translatesAutoresizingMaskIntoConstraints = false
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        speciesPerson.translatesAutoresizingMaskIntoConstraints = false
        typePerson.translatesAutoresizingMaskIntoConstraints = false
        genderPerson.translatesAutoresizingMaskIntoConstraints = false

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
            
            imagePerson.topAnchor.constraint(equalTo: self.view.layoutMarginsGuide.topAnchor),
            imagePerson.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 30),
            imagePerson.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -30),

            namePerson.topAnchor.constraint(equalTo: imagePerson.bottomAnchor, constant: 20),
            namePerson.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            namePerson.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
        
            statusPerson.topAnchor.constraint(equalTo: namePerson.bottomAnchor, constant: 10),
            statusPerson.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            statusPerson.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),

            infoLabel.topAnchor.constraint(equalTo: statusPerson.bottomAnchor, constant: 10),
            infoLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 24),
            infoLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            
            speciesPerson.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: 10),
            speciesPerson.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 34),
            speciesPerson.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            
            typePerson.topAnchor.constraint(equalTo: speciesPerson.bottomAnchor, constant: 10),
            typePerson.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 34),
            typePerson.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            
            genderPerson.topAnchor.constraint(equalTo: typePerson.bottomAnchor, constant: 10),
            genderPerson.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 34),
            genderPerson.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
    }
}
