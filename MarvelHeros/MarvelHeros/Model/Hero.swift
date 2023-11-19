//
//  Hero.swift
//  MarvelHeros
//
//  Created by Natalia Hernandez on 19/11/23.
//

import Foundation

struct Hero: Codable, Identifiable, Equatable{
    static func == (lhs: Hero, rhs: Hero) -> Bool {
        return lhs.id == rhs.id
    }
    
    let id: Int
    let name, description: String
    let photo: Photo
    let series: Series
    
    enum CodingKeys: String, CodingKey{
        case id
        case name
        case description
        case series
        case photo = "thumbnail"
    }
}
