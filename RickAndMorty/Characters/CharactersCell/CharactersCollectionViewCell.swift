//
//  CharactersCollectionViewCell.swift
//  RickAndMorty
//
//  Created by Максим Зыкин on 17.08.2023.
//

import UIKit

class CharactersCollectionViewCell: UICollectionViewCell {
   
    static let cellID = "charactersCell"
    
    var viewC: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 16
        view.backgroundColor = UIColor(
            red: 38/255,
            green: 42/255,
            blue: 56/255,
            alpha: 255/255
        )
        return view
    }()
    
    let image = UIImageView()
    
    var name: UILabel! = {
        let label = UILabel()
        //label.textColor = .label
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 17, weight: .semibold)
        label.text = ""
        label.numberOfLines = 2
        label.textColor = .white
        return label
    }()
    
    var viewModel: CharactersCollectionViewModelCellProtocol! {
        didSet {
            self.name.text = viewModel.name
            DispatchQueue.global().async {
                guard let imageData = self.viewModel.image else { return }
                DispatchQueue.main.async {
                    self.image.image = UIImage(data: imageData)
                }
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews(){
        image.frame = CGRect(x: 12, y: 12, width: 140, height: 140)
    }

    private func setupUI() {
        image.clipsToBounds = true
        image.layer.cornerRadius = 10
        
        contentView.addSubview(viewC)
        contentView.addSubview(image)
        contentView.addSubview(name)
        
        viewC.translatesAutoresizingMaskIntoConstraints = false
        name.translatesAutoresizingMaskIntoConstraints = false

        viewC.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        viewC.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        viewC.topAnchor.constraint(equalTo: topAnchor).isActive = true
        viewC.heightAnchor.constraint(equalTo: heightAnchor).isActive = true

        image.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        image.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 10).isActive = true
        image.topAnchor.constraint(equalTo: topAnchor, constant: 20).isActive = true
        image.heightAnchor.constraint(equalTo: heightAnchor).isActive = true

        name.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 18).isActive = true
        name.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        name.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }
}
