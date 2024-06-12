//
//  SuperHeroSearcher.swift
//  CursoiOS
//
//  Created by Ricardo Garcia on 11/06/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct SuperHeroSearcher: View {
    @State var superheroName:String = ""
    @State var wrapper:ApiNetwork.Wrapper? = nil
    @State var loading:Bool = false
    
    var body: some View {
        VStack {
            TextField("",text: $superheroName, prompt: Text("Superman....").font(.title2).bold().foregroundColor(.gray)).font(.title2).bold().foregroundColor(.white)
                .padding(16)
                .border(.purple,width: 1.5)
                .padding(8)
                .autocorrectionDisabled()
                .onSubmit {
                    loading = true
                    Task{
                        do{
                            wrapper = try await ApiNetwork().getHeroesByQuery(query: superheroName)
                        }catch{
                            print("Error")
                        }
                        loading = false
                    }
                }
            
            if loading {
                ProgressView().tint(.white)
            }
            
            NavigationStack {
                List(wrapper?.results ?? []){ superhero in
                    ZStack {
                        SuperHeroItem(superhero:superhero)
                        NavigationLink(destination:SuperheroDetail(id: superhero.id)) {EmptyView()}.opacity(0)
                    }.listRowBackground(Color.backgroundApp)
                }.listStyle(.plain)
            }
            Spacer()
        }.frame(maxWidth: .infinity, maxHeight: .infinity).background(.backgroundApp)
    }
}

struct SuperHeroItem:View {
    let superhero:ApiNetwork.Superhero
    var body: some View {
        ZStack {
            
            WebImage(url: URL(string: superhero.image.url))
                .resizable()
                .indicator(.activity)
                .scaledToFill()
                .frame(height: 200)
            
            VStack {
                Spacer()
                Text(superhero.name).foregroundColor(.white)
                    .font(.title)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(.white.opacity(0.5))
            }
        }.frame(height: 200).cornerRadius(32)
    }
}

#Preview {
    SuperHeroSearcher()
}
