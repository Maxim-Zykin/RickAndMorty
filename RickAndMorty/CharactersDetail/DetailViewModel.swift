//
//  DetailViewModel.swift
//  RickAndMorty
//
//  Created by Максим Зыкин on 18.08.2023.
//

import Foundation

protocol DetailViewModelProtocol {
    var imade: Data? { get }
    var nameLabel: String { get }
    var statusLabel: String { get }
   // var infoLabel: String { get }
    var speciesLabel: String { get }
    var typeLabel: String { get }
    var genderLabel: String { get }
    var locationLabel: String { get }
}

//class DetailViewModel: DetailViewModelProtocol {
//    
//}
