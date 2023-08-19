//
//  DetailView.swift
//  RickAndMorty
//
//  Created by Максим Зыкин on 18.08.2023.
//

import UIKit

class DetailView: UIViewController {
    
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
        image.bounds.size = CGSize(width: 100, height: 100)
        image.layer.cornerRadius = image.frame.size.height / 16
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
    
    var viewModel: DetailViewModelProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        imagePerson.frame.size = CGSize(width: 20, height: 20)
    }

    override func viewDidAppear(_ animated: Bool) {
        imagePerson.frame.size = CGSize(width: 148, height: 148)
    }
    
    private func setupUI() {
        
        imagePerson.frame.size = CGSize(width: 148, height: 148)
        imagePerson.layer.cornerRadius = imagePerson.frame.size.height / 16

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
        
        namePerson.translatesAutoresizingMaskIntoConstraints = false
        imagePerson.translatesAutoresizingMaskIntoConstraints = false
        statusPerson.translatesAutoresizingMaskIntoConstraints = false
        
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
            
            self.imagePerson.topAnchor.constraint(equalTo: self.view.layoutMarginsGuide.topAnchor),
            self.imagePerson.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 30),
            self.imagePerson.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -30),

            self.namePerson.topAnchor.constraint(equalTo: imagePerson.bottomAnchor, constant: 20),
            self.namePerson.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.namePerson.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
        
            self.statusPerson.topAnchor.constraint(equalTo: namePerson.bottomAnchor, constant: 10),
            self.statusPerson.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.statusPerson.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),

        ])
    }
}
