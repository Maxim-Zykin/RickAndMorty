//
//  CharactersCollectionViewControllerModel.swift
//  RickAndMorty
//
//  Created by Максим Зыкин on 17.08.2023.
//

import Foundation

protocol CharactersCollectionViewControllerModelProtocol {
    var characters: [Characters] { get }
    var isLoading: Bool { get }
    var hasMoreData: Bool { get }
    func fetchCharacters(completion: @escaping() -> Void)
    func loadMoreCharacters(completion: @escaping() -> Void)
    func numberOfRows() -> Int
    func cellViewModel(at indexPath: IndexPath) -> CharactersCollectionViewModelCellProtocol
    func viewModelForSelectedRow(at indexPath: IndexPath) -> DetailViewModelProtocol
}

class CharactersCollectionViewControllerModel: CharactersCollectionViewControllerModelProtocol {
    
    private let url = "https://rickandmortyapi.com/api/character"
    private var nextPageURL: String?
    
    var characters: [Characters] = []
    var isLoading: Bool = false
    var hasMoreData: Bool = true
    
    func fetchCharacters(completion: @escaping () -> Void) {
        isLoading = true
        NetworkManager<RickAndMorty>.fetchData(urlJSON: url) { [weak self] (result) in
            guard let self = self else { return }
            self.isLoading = false
            switch result {
            case .success(let response):
                self.characters = response.results
                self.nextPageURL = response.info.next
                self.hasMoreData = response.info.next != nil
                completion()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func loadMoreCharacters(completion: @escaping () -> Void) {
        guard !isLoading, hasMoreData, let nextURL = nextPageURL else { return }
        
        isLoading = true
        NetworkManager<RickAndMorty>.fetchData(urlJSON: nextURL) { [weak self] (result) in
            guard let self = self else { return }
            self.isLoading = false
            switch result {
            case .success(let response):
                self.characters.append(contentsOf: response.results)
                self.nextPageURL = response.info.next
                self.hasMoreData = response.info.next != nil
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


