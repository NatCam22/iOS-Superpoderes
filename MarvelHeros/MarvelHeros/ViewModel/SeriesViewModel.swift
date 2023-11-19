//
//  SeriesViewModel.swift
//  MarvelHeros
//
//  Created by Natalia Hernandez on 19/11/23.
//

import Foundation
import Combine

final class SeriesViewModel: ObservableObject{
    @Published var series: [Serie]?
    @Published var hero: Hero?
    
    var subs = Set<AnyCancellable>()
    
    init(testing: Bool = false, hero: Hero){
        if(testing){
            self.series = getSeriesDesign()
        }else{
            self.hero = hero
            print("Hola ya llego el heroe y es \(hero.name)")
            self.loadSeries(hero: hero)
        }
    }
    
    func loadSeries(hero: Hero?){
        var seriesCargadas: [Serie] = []
        print("Se estan cargando las series")
        if let hero_ = hero{
            let items = hero_.series.items
            items.forEach({ serieItem in
                URLSession.shared.dataTaskPublisher(for: BaseNetwork().getSessionSerie(url: serieItem.resourceURI))
                    .tryMap {
                        guard let response = $0.response as? HTTPURLResponse, response.statusCode == 200 else{
                            throw URLError(.badServerResponse)
                        }
                        print("obtuvimos respuesta \($0.data)")
                        return $0.data
                    }
                    .decode(type: ResultSerie.self, decoder: JSONDecoder())
                    .receive(on: DispatchQueue.main)
                    .sink { completion in
                        switch completion{
                        case .failure:
                            print("Hubo un error en la carga de las series para este heroe")
                        case .finished:
                            print("La carga de las series es correcta")
                        }
                    } receiveValue: { data in
                        print("hola recibio lo de la serie")
                        if let newSerie = data.data.results.first{
                            seriesCargadas.append(newSerie)
                            self.series = seriesCargadas
                            print("appendeamos la nueva serie \(newSerie.title)")
                        }
                    }
                    .store(in: &subs)
            })
        }
        else{
            print("No hay heroe")
        }
                
    }
    
    func loadSeriesTesting(){
        self.series = getSeriesDesign()
    }
    
    func getSeriesDesign() -> [Serie]{
        let serie1 = Serie(id: 123, title: "El increible Hulk", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", photo: Photo(path:"https://depor.com/resizer/TbgBlDkU68JqQJ313GRhT8Dit3E=/1200x900/smart/filters:format(jpeg):quality(75)/cloudfront-us-east-1.images.arcpublishing.com/elcomercio/4J3O574FLRBHLLC2JZCENFYPHI", ext:.jpg))
        let serie2 = Serie(id: 12, title: "Nada mejor que Hulk 2", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", photo: Photo(path:"https://depor.com/resizer/TbgBlDkU68JqQJ313GRhT8Dit3E=/1200x900/smart/filters:format(jpeg):quality(75)/cloudfront-us-east-1.images.arcpublishing.com/elcomercio/4J3O574FLRBHLLC2JZCENFYPHI", ext:.jpg))
        return [serie1, serie2]
    }
}
