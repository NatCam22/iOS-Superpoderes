//
//  BaseNetwork.swift
//  MarvelHeros
//
//  Created by Natalia Hernandez on 19/11/23.
//

import Foundation


//constantes.
let server = "https://gateway.marvel.com"
let API_KEY = "dffa33d6087a3474338accd6ba5258f3"
let HASH = "43838211bf22aa3bafa3a71458523e36"
let TS = 1
//structs de metodos de red

struct HTTPMethods{
    static let post = "POST"
    static let get = "GET"
    static let put = "PUT"
    static let delete = "DELETE"
    
    static let content = "application/json"
}

enum endpoints: String{
    case characters = "/v1/public/characters"
    case series = "/v1/public/series"
}

struct BaseNetwork{
    func getSessionCharacters() -> URLRequest{
        let urlCad = "\(server)\(endpoints.characters.rawValue)"
        let params = "?ts=\(TS)&apikey=\(API_KEY)&hash=\(HASH)&limit=100"
        
        //Creamos el request
        var request: URLRequest = URLRequest(url: URL(string: "\(urlCad)\(params)")!)
        request.httpMethod = HTTPMethods.get
        print("Se creo el request")
        return request
    }
    
    func getSessionSerie(url: String) -> URLRequest{
        let urlCad = url
        let params = "?ts=\(TS)&apikey=\(API_KEY)&hash=\(HASH)"
        var request: URLRequest = URLRequest(url: URL(string: "\(urlCad)\(params)")!)
        request.httpMethod = HTTPMethods.get
        
        return request
    }
}
