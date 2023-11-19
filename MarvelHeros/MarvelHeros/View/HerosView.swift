//
//  HerosView.swift
//  MarvelHeros
//
//  Created by Natalia Hernandez on 19/11/23.
//

import SwiftUI

struct HerosView: View {
    @StateObject var heroViewModel: HeroViewModel
    
    var body: some View {
        NavigationStack{
            List{
                if let heros = heroViewModel.heros{
                    ForEach(heros){
                        hero in
                        NavigationLink{
                            //destino
                            SeriesView(seriesViewModel: SeriesViewModel(hero: hero))
                        } label: {
                            HerosRowView(hero: hero)
                        }
                    }
                }
            }
            .scrollContentBackground(.hidden)
            .navigationTitle("Heroes")
        }
    }
}

#Preview {
    HerosView(heroViewModel: HeroViewModel(testing: true))
}
