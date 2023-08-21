//
//  CustomLabel.swift
//  RickAndMorty
//
//  Created by Максим Зыкин on 19.08.2023.
//

import UIKit

class CustomLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    convenience init(text: String, textAlignment: NSTextAlignment = .left, size: CGFloat = 20, color: UIColor = .label, numberOfLines: Int = 0, font: UIFont.Weight = .regular) {
        self.init(frame: .zero)
        self.text = text
        self.textAlignment = textAlignment
        self.numberOfLines = numberOfLines
        self.font = .systemFont(ofSize: size, weight: font)
        self.textColor = color
    }
}
