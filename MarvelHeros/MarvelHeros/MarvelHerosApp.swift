//
//  MarvelHerosApp.swift
//  MarvelHeros
//
//  Created by Natalia Hernandez on 19/11/23.
//

import SwiftUI

@main
struct MarvelHerosApp: App {
    @StateObject var heroViewModel = HeroViewModel()
    
    var body: some Scene {
        WindowGroup {
            HerosView(heroViewModel: heroViewModel)
                .environmentObject(heroViewModel)
        }
    }
}
