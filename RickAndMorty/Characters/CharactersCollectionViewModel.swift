//
//  CharactersCollectionViewControllerModel.swift
//  RickAndMorty
//
//  Created by Максим Зыкин on 17.08.2023.
//

import Foundation

protocol CharactersCollectionViewControllerModelProtocol {
    var characters: [Characters] { get }
    func fetchCharacters(completion: @escaping() -> Void)
    func numberOfRows() -> Int
    func cellViewModel(at indexPath: IndexPath) -> CharactersCollectionViewModelCellProtocol
    func viewModelForSelectedRow(at indexPath: IndexPath) -> DetailViewModelProtocol
}

class CharactersCollectionViewControllerModel: CharactersCollectionViewControllerModelProtocol {
    
    private let url = "https://rickandmortyapi.com/api/character"
    
    var characters: [Characters] = []
    
    func fetchCharacters(completion: @escaping () -> Void) {
        NetworkManager<RickAndMorty>.fetchData(urlJSON: url) { [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                self.characters = response.results
                completion()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func numberOfRows() -> Int {
        characters.count
    }
    
    func cellViewModel(at indexPath: IndexPath) -> CharactersCollectionViewModelCellProtocol {
        let characters = characters[indexPath.row]
        return CharactersCollectionViewModelCell(characters: characters)
    }
    
    func viewModelForSelectedRow(at indexPath: IndexPath) -> DetailViewModelProtocol {
        let detail = characters[indexPath.row]
        return DetailViewModel(characters: detail)
    }
}


