//
//  SeriesView.swift
//  MarvelHeros
//
//  Created by Natalia Hernandez on 19/11/23.
//

import SwiftUI

struct SeriesView: View {
    @StateObject var seriesViewModel: SeriesViewModel
    
    var body: some View {
        NavigationStack{
            List{
                if let series = seriesViewModel.series{
                    ForEach(series){
                        serie in
                        NavigationLink{
                            //destino
                            DetailSerieView(serie: serie)
                        } label: {
                            SerieView(serie: serie)
                        }
                    }
                }
            }
            .scrollContentBackground(.hidden)
            .navigationTitle("Series")
        }
    }
}

#Preview {
    SeriesView(seriesViewModel: SeriesViewModel(testing: true, hero: Hero(id: 1, name: "", description: "", photo: Photo(path: "", ext: Extension.gif), series: Series(items: []))))
}
