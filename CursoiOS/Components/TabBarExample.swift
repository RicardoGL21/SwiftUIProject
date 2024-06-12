//
//  TabBarExample.swift
//  CursoiOS
//
//  Created by Ricardo Garcia on 12/06/24.
//

import SwiftUI

struct TabBarExample: View {
    
    @State var index:Int = 0
    
    var body: some View {
        VStack{
            
            ZStack {
                if self.index == 0 {
                    Color.black.opacity(0.05)
                } else if self.index == 1 {
                    Color.red
                } else if self.index == 2 {
                    Color.green
                } else if self.index == 3 {
                    Color.blue
                }
            }
            
            CustomTabs(index: $index)
        }
        .background(.black.opacity(0.05))
    }
}

#Preview {
    TabBarExample()
}

struct CustomTabs:View {
    
    @Binding var index:Int
    
    var body: some View {
        HStack{
            Button(action: {
                self.index = 0
            }) {
                VStack {
                    Image(systemName: "music.note")
                    Text("Inicio")
                }
            }
            .foregroundColor(Color.black.opacity(index == 0 ? 1 : 0.2))
            
            Spacer(minLength: 0)
            
            Button(action: {
                self.index = 1
            }) {
                VStack {
                    Image(systemName: "music.note")
                    Text("Buscar")
                }
            }
            .foregroundColor(Color.black.opacity(index == 1 ? 1 : 0.2))
            
            Spacer(minLength: 0)
            
            Button(action: {
                
            }, label: {
                Image(systemName: "music.note").renderingMode(.original)
            })
            .offset(y:-25)
            
            Spacer(minLength: 0)
            
            Button(action: {
                self.index = 2
            }) {
                VStack {
                    Image(systemName: "music.note")
                    Text("Ayuda")
                }
            }
            .foregroundColor(Color.black.opacity(index == 2 ? 1 : 0.2))
            
            Spacer(minLength: 0)
            
            Button(action: {
                self.index = 3
            }) {
                VStack {
                    Image(systemName: "music.note")
                    Text("Ver mas")
                }
            }
            .foregroundColor(Color.black.opacity(index == 3 ? 1 : 0.2))
        }
        .padding(.horizontal,35)
        .background(.white)
    }
}
