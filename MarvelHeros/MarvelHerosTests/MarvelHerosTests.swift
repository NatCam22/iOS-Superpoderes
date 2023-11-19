//
//  MarvelHerosTests.swift
//  MarvelHerosTests
//
//  Created by Natalia Hernandez on 19/11/23.
//

import XCTest
import SwiftUI
import Combine
import ViewInspector

@testable import MarvelHeros

final class MarvelHerosTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testModelos() throws {
        let modelHero = Hero(id: 1, name: "Hulk", description: "Lorem ipsum", photo: Photo(path: "www.google.com", ext: Extension.jpg), series: Series(items: []))
        XCTAssertNotNil(modelHero)
        XCTAssertEqual(modelHero.name, "Hulk")
        XCTAssertEqual(modelHero.id, 1)
        XCTAssertEqual(modelHero.description, "Lorem ipsum")
        XCTAssertEqual(modelHero.series, Series(items: []))
                
        let modelSerie = Serie(id: 1, title: "Hulk", description: "Lorem ipsum", photo: Photo(path: "www.google.com", ext: Extension.jpg))
        XCTAssertNotNil(modelSerie)
        XCTAssertEqual(modelSerie.title, "Hulk")
        XCTAssertEqual(modelSerie.id, 1)
        XCTAssertEqual(modelSerie.description, "Lorem ipsum")
        
        let modelPhoto = Photo(path: "www.google.com", ext: Extension.jpg)
        XCTAssertNotNil(modelPhoto)
        XCTAssertEqual(modelPhoto.path, "www.google.com")
        XCTAssertEqual(modelPhoto.ext, Extension.jpg)
        
        let modelSerieItem = SerieItem(resourceURI: "www.google.com")
        XCTAssertNotNil(modelSerieItem)
        XCTAssertEqual(modelSerieItem.resourceURI, "www.google.com")
        
        let modelSeries = Series(items: [modelSerieItem])
        XCTAssertNotNil(modelSerieItem)
        XCTAssertEqual(modelSeries.items, [modelSerieItem])
        
        let modelDataClassHero = DataClassHero(results: [modelHero])
        XCTAssertNotNil(modelDataClassHero)
        XCTAssertEqual(modelDataClassHero.results, [modelHero])
        
        let modelResultHero = ResultHero(data: modelDataClassHero)
        XCTAssertNotNil(modelResultHero)
        XCTAssertEqual(modelResultHero.data, modelDataClassHero)
        
    }

    func testHeroViewModel() throws{
        let expectation = self.expectation(description: "Descarga de heroes")
        var suscriptor = Set<AnyCancellable>()
        //Instancio el view model
        let vm = HeroViewModel(testing: true)
        XCTAssertNotNil(vm)
        //Creo el observadir
        vm.heros.publisher
            .sink { completion in
                switch completion{
                    case .finished:
                    XCTAssertEqual(1, 1)
                    expectation.fulfill()
                case .failure:
                    XCTAssertEqual(1,2)
                    expectation.fulfill()
                }
            } receiveValue: { data in
                XCTAssertEqual(1, 1)
            }
            .store(in: &suscriptor)
        
        vm.loadHeroTesting()

        self.waitForExpectations(timeout: 10)
    }
    func testSeriesViewModel() throws{
        let expectation = self.expectation(description: "Descarga de heroes")
        var suscriptor = Set<AnyCancellable>()
        let hero = Hero(id: 1, name: "", description: "", photo: Photo(path: "", ext: Extension.jpg), series: Series(items: [SerieItem(resourceURI: "http://gateway.marvel.com/v1/public/series/1945")]))
        //Instancio el view model
        let vm = SeriesViewModel(testing: true, hero: hero)
        XCTAssertNotNil(vm)
        //Creo el observadir
        vm.series.publisher
            .sink { completion in
                switch completion{
                    case .finished:
                    XCTAssertEqual(1, 1)
                    expectation.fulfill()
                case .failure:
                    XCTAssertEqual(1,2)
                    expectation.fulfill()
                }
            } receiveValue: { data in
                XCTAssertEqual(1, 1)
            }
            .store(in: &suscriptor)
        
        vm.loadSeriesTesting()

        self.waitForExpectations(timeout: 10)
    }
    func testUIViews(){
        let view = DetailSerieView(serie: Serie(id: 1, title: "El increible Hulk", description: "Pepito Perez es hulk", photo: Photo(path: "https://media.admagazine.com/photos/650a96a14e52ff077a4d305d/16:9/w_2560%2Cc_limit/flor-de-maga.jpg", ext: Extension.jpg)))
        
        XCTAssertNotNil(view)
        
        let numItems = try? view.inspect().count
        XCTAssertEqual(numItems, 1)
        
        let img = try? view.inspect().find(viewWithId: 0)
        XCTAssertNotNil(img)
        
        let name = try? view.inspect().find(viewWithId: 1)
        XCTAssertNotNil(name)
        let name_str = try? name?.text().string()
        XCTAssertEqual(name_str, "El increible Hulk")
    }
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
