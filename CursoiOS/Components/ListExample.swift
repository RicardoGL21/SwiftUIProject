//
//  ListExample.swift
//  CursoiOS
//
//  Created by Ricardo Garcia on 11/06/24.
//

import SwiftUI

var pokemons = [Pokemon(name: "Pikachu"),
                Pokemon(name: "Charmander"),
                Pokemon(name: "Charmeleon"),
                Pokemon(name: "Bulbasaur"),
                Pokemon(name: "Ricardo")
]

var digimons = [
    Digimon(name: "Agumon"),
    Digimon(name:"Graymon"),
    Digimon(name: "Ricardomon"),
    Digimon(name: "Ricardomon")
]

struct ListExample: View {
    var body: some View {
        /*List {
            Text("Prueba")
            Text("Prueba")
            Text("Prueba")
        }*/
        
        /*List {
            ForEach(pokemons, id:\.name) { pokemon in
                Text(pokemon.name)
            }
        }*/
        
        /*List(digimons) { digimon in
            Text(digimon.name)
        }*/
        
        /*List {
            ForEach(digimons) { digimon in
                Text(digimon.name)
                
            }
        }*/
        
        List {
            Section(header: Text("Pokemons")) {
                ForEach(pokemons, id:\.name) { pokemon in
                    Text(pokemon.name)
                }
            }
            Section(header: Text("Digimons")) {
                ForEach(digimons) { digimon in
                    Text(digimon.name)
                    
                }
            }
        }.listStyle(.automatic)
        
    }
}

struct Pokemon {
    let name:String
}

struct Digimon: Identifiable {
    var id = UUID()
    
    let name:String
}

#Preview {
    ListExample()
}
