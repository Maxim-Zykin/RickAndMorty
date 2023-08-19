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

    convenience init(textAlignment: NSTextAlignment = .left, size: CGFloat = 20, color: UIColor = .label, numberOfLines: Int = 0) {
        self.init(frame: .zero)
        self.textAlignment = textAlignment
        self.numberOfLines = numberOfLines
        self.font = .systemFont(ofSize: size, weight: .regular)
        self.textColor = color
    }
}
