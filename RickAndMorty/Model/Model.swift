//
//  Model.swift
//  RickAndMorty
//
//  Created by Максим Зыкин on 17.08.2023.
//

import Foundation

struct RickAndMorty: Codable {
    let results: [Characters]
}

struct Characters: Codable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let origin: Location
    let location: Location
    let image: URL
    let episode: [String]
    let url: String
}

struct Location: Codable {
    let name: String
}

struct Episode: Codable {
    let name: String
    let date: String
    let episode: String
    let characters: [String]
}

enum Link: String {
    case rickAndMortyApi = "https://rickandmortyapi.com/api/character"
}
