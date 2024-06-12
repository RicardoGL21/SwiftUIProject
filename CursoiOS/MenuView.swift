//
//  MenuView.swift
//  CursoiOS
//
//  Created by Ricardo Garcia on 10/06/24.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        NavigationStack{
            List {
                NavigationLink(destination:IMCView()) {
                    Text("IMC Calculator")
                }
                NavigationLink(destination:SuperHeroSearcher()) {
                    Text("Superhero finder")
                }
                NavigationLink(destination:FavPlaces()) {
                    Text("Fav Places")
                }
                NavigationLink(destination:ViewPager()) {
                    Text("View Pager")
                }
            }
        }
    }
}

#Preview {
    MenuView()
}
