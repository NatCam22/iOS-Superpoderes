//
//  ResultSerie.swift
//  MarvelHeros
//
//  Created by Natalia Hernandez on 19/11/23.
//

import Foundation

struct ResultSerie: Codable{
    let data: DataClass
}

struct DataClass: Codable{
    let results: [Serie]
}
