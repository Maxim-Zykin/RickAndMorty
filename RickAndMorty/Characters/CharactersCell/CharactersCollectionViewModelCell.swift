//
//  CharactersCollectionViewModelCell.swift
//  RickAndMorty
//
//  Created by Максим Зыкин on 17.08.2023.
//

import Foundation

protocol CharactersCollectionViewModelCellProtocol {
    var name: String { get }
    var image: Data? { get }
    init(characters: Characters)
}

class CharactersCollectionViewModelCell: CharactersCollectionViewModelCellProtocol {
    
    var name: String {
        characters.name
    }
    
    var image: Data?{
        ImageManager.shared.fetchImage(from: characters.image)
    }
    
    private var characters: Characters
    
    required init(characters: Characters) {
        self.characters = characters
    }
}
