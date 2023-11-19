//
//  Photo.swift
//  MarvelHeros
//
//  Created by Natalia Hernandez on 19/11/23.
//

import Foundation

struct Photo: Codable{
    let path: String
    let ext: Extension
    
    enum CodingKeys: String, CodingKey{
        case path
        case ext = "extension"
    }
}
enum Extension: String, Codable {
    case gif = "gif"
    case jpg = "jpg"
}
