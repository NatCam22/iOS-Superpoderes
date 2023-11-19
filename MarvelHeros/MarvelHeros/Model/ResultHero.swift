//
//  Result.swift
//  MarvelHeros
//
//  Created by Natalia Hernandez on 19/11/23.
//

import Foundation

struct ResultHero: Codable, Equatable{
    let data: DataClassHero
}

struct DataClassHero: Codable, Equatable{
    let results: [Hero]
}
