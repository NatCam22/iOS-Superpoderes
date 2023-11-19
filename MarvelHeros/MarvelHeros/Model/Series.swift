//
//  Series.swift
//  MarvelHeros
//
//  Created by Natalia Hernandez on 19/11/23.
//

import Foundation

struct Series: Codable, Equatable{
    static func == (lhs: Series, rhs: Series) -> Bool {
        return lhs.items == lhs.items
    }
    
    let items: [SerieItem]
}

struct SerieItem: Codable, Equatable{
    let resourceURI: String
}

struct Serie: Codable, Identifiable{
    let id: Int
    let title: String
    let description: String?
    let photo: Photo
    
    enum CodingKeys: String, CodingKey{
        case id
        case title
        case description
        case photo = "thumbnail"
    }
}
