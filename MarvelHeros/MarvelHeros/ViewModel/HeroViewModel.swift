//
//  HeroViewModel.swift
//  MarvelHeros
//
//  Created by Natalia Hernandez on 19/11/23.
//

import Foundation
import Combine

final class HeroViewModel: ObservableObject{
    @Published var heros: [Hero]?
    
    var subs = Set<AnyCancellable>()
    
    init(testing: Bool = false){
        if(testing){
            self.heros = getHerosDesign()
        }
        else{
            self.loadHeros()
        }
    }
    
    func loadHeros(){
        print("Se estan cargando los heroes")
        URLSession.shared
            .dataTaskPublisher(for: BaseNetwork().getSessionCharacters())
            .tryMap {
                guard let response = $0.response as? HTTPURLResponse, response.statusCode == 200 else{
                    throw URLError(.badServerResponse)
                }
                print("obtuvimos respuesta")
                return $0.data
            }
            .decode(type: ResultHero.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion{
                case .failure:
                     print("Hubo un problema cargando los heroes")
                case .finished:
                    print("Se cargaron los heroes correctamente")
                     // Carga de heroes OK
                }
            } receiveValue: { data in
                print("Se cargan los heroes")
                self.heros = data.data.results
            }
            .store(in: &subs)
    }
    
    func loadHeroTesting() {
        self.heros = getHerosDesign()
    }
    func getHerosDesign() -> [Hero]{
        let hero1 = Hero(id: 123, name: "Hulk", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", photo: Photo(path:"https://depor.com/resizer/TbgBlDkU68JqQJ313GRhT8Dit3E=/1200x900/smart/filters:format(jpeg):quality(75)/cloudfront-us-east-1.images.arcpublishing.com/elcomercio/4J3O574FLRBHLLC2JZCENFYPHI", ext:.jpg), series: Series(items: [SerieItem(resourceURI: "http://gateway.marvel.com/v1/public/comics/10225")]))
        let hero2 = Hero(id: 1234, name: "Wanda", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", photo: Photo(path:"https://depor.com/resizer/TbgBlDkU68JqQJ313GRhT8Dit3E=/1200x900/smart/filters:format(jpeg):quality(75)/cloudfront-us-east-1.images.arcpublishing.com/elcomercio/4J3O574FLRBHLLC2JZCENFYPHI", ext:.jpg), series: Series(items: [SerieItem(resourceURI: "http://gateway.marvel.com/v1/public/comics/10225")]))
        let hero3 = Hero(id: 12345, name: "Iron Man", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", photo: Photo(path:"https://depor.com/resizer/TbgBlDkU68JqQJ313GRhT8Dit3E=/1200x900/smart/filters:format(jpeg):quality(75)/cloudfront-us-east-1.images.arcpublishing.com/elcomercio/4J3O574FLRBHLLC2JZCENFYPHI", ext:.jpg), series: Series(items: [SerieItem(resourceURI: "http://gateway.marvel.com/v1/public/comics/10225")]))
        let hero4 = Hero(id: 123456, name: "Capitana Marvel", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", photo: Photo(path:"https://depor.com/resizer/TbgBlDkU68JqQJ313GRhT8Dit3E=/1200x900/smart/filters:format(jpeg):quality(75)/cloudfront-us-east-1.images.arcpublishing.com/elcomercio/4J3O574FLRBHLLC2JZCENFYPHI", ext:.jpg), series: Series(items: [SerieItem(resourceURI: "http://gateway.marvel.com/v1/public/comics/10225")]))
        return [hero1, hero2, hero3, hero4]
    }
}
