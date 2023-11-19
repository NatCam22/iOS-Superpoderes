//
//  SerieView.swift
//  MarvelHeros
//
//  Created by Natalia Hernandez on 19/11/23.
//

import SwiftUI

struct SerieView: View {
    var serie: Serie
    
    var body: some View {
        ZStack{
           RoundedRectangle(cornerRadius: 40)
                .fill(.gray)
                .frame(width: 250, height: 550)
                .shadow(radius: 10, x:20, y:30)
            VStack{
                AsyncImage(url: URL(string: "\(serie.photo.path).\(serie.photo.ext)")){
                    photo in
                    photo
                        .resizable()
                        .cornerRadius(20)
                        .opacity(0.8)
                        .frame(width: 200, height: 400)
                        .padding([.top], 30)
                } placeholder: {
                    Image(systemName: "photo")
                        .resizable()
                        .cornerRadius(20)
                        .opacity(0.8)
                        .frame(width: 200, height: 200)
                }
                Text(serie.title)
                    .font(.title3)
                    .foregroundStyle(.black)
                    .bold()
                    .frame(width: 150, height: 70)
                    .padding(.all, 20)
            }
        }
    }
    }

#Preview {
    SerieView(serie: Serie(id: 12, title: "Nada mejor que Hulk 2", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", photo: Photo(path:"https://depor.com/resizer/TbgBlDkU68JqQJ313GRhT8Dit3E=/1200x900/smart/filters:format(jpeg):quality(75)/cloudfront-us-east-1.images.arcpublishing.com/elcomercio/4J3O574FLRBHLLC2JZCENFYPHI", ext:.jpg)))
}
