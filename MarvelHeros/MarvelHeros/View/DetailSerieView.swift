//
//  DetailSerieView.swift
//  MarvelHeros
//
//  Created by Natalia Hernandez on 19/11/23.
//

import SwiftUI

struct DetailSerieView: View {
    var serie: Serie
    
    var body: some View {
        ZStack{
            AsyncImage(url: URL(string: "\(serie.photo.path).\(serie.photo.ext)")){
                photo in
                photo
                    .resizable()
                    .cornerRadius(20)
                    .opacity(0.3)
                    .ignoresSafeArea()
            } placeholder: {
                Image(systemName: "photo")
                    .resizable()
                    .cornerRadius(20)
                    .opacity(0.3)
                    .ignoresSafeArea()
            }.id(0)
            VStack(alignment: .leading, content: {
                Text(serie.title)
                    .font(.title)
                    .bold()
                    .padding()
                    .id(1)
                if let description = serie.description{
                    Text(description)
                        .font(.headline)
                        .padding()
                        .id(2)
                }
            })
        }
    }
}

#Preview {
    DetailSerieView(serie: Serie(id: 12, title: "Nada mejor que Hulk 2", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", photo: Photo(path:"https://depor.com/resizer/TbgBlDkU68JqQJ313GRhT8Dit3E=/1200x900/smart/filters:format(jpeg):quality(75)/cloudfront-us-east-1.images.arcpublishing.com/elcomercio/4J3O574FLRBHLLC2JZCENFYPHI", ext:.jpg)))
}
