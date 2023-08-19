//
//  DetailViewModel.swift
//  RickAndMorty
//
//  Created by Максим Зыкин on 18.08.2023.
//

import Foundation

protocol DetailViewModelProtocol: AnyObject {
    var image: Data? { get }
    var nameLabel: String { get }
    var statusLabel: String { get }
   // var infoLabel: String { get }
    var speciesLabel: String { get }
   // var typeLabel: String { get }
    var genderLabel: String { get }
    var locationLabel: String { get }
    var episodeLabel: [String] { get }
    init(characters: Characters)
}

class DetailViewModel: DetailViewModelProtocol {

    var image: Data? {
        ImageManager.shared.fetchImage(from: characters.image)
    }
    
    var nameLabel: String {
        characters.name
    }
    
    var statusLabel: String {
        characters.status
    }
    
    var speciesLabel: String {
        characters.species
    }
    
//    var typeLabel: String {
//        characters.
//    }
    
    var genderLabel: String {
        characters.gender
    }
    
    var locationLabel: String {
        "characters.location"
    }
    
    var episodeLabel: [String] {
        characters.episode
    }
    
    private var characters: Characters
    
    required init(characters: Characters) {
        self.characters = characters
    }
    
}
