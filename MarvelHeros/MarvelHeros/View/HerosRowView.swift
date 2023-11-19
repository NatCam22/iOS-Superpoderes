//
//  HerosRowView.swift
//  HerosClass
//
//  Created by Natalia Hernandez on 18/11/23.
//

import SwiftUI

struct HerosRowView: View {
    var hero: Hero
    
    var body: some View {
        ZStack{
           RoundedRectangle(cornerRadius: 40)
                .fill(.gray)
                .frame(width: 320, height: 350)
                .shadow(radius: 10, x:20, y:30)
            VStack{
                AsyncImage(url: URL(string: "\(hero.photo.path).\(hero.photo.ext)")){
                    photo in
                    photo
                        .resizable()
                        .cornerRadius(20)
                        .opacity(0.8)
                        .frame(width: 300, height: 250)
                } placeholder: {
                    Image(systemName: "photo")
                        .resizable()
                        .cornerRadius(20)
                        .opacity(0.8)
                        .frame(width: 300, height: 200)
                }
                Text(hero.name)
                    .font(.title)
                    .foregroundStyle(.black)
                    .bold()
                    .padding([.top, .leading], 20)
            }
        }
    }
}

#Preview {
    HerosRowView(hero: Hero(id: 123, name: "Hulk", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", photo: Photo(path:"https://depor.com/resizer/TbgBlDkU68JqQJ313GRhT8Dit3E=/1200x900/smart/filters:format(jpeg):quality(75)/cloudfront-us-east-1.images.arcpublishing.com/elcomercio/4J3O574FLRBHLLC2JZCENFYPHI", ext:.jpg), series: Series(items: [SerieItem(resourceURI: "http://gateway.marvel.com/v1/public/comics/10225")])))
}
