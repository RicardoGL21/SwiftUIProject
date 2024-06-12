//
//  ButtonExample.swift
//  CursoiOS
//
//  Created by Ricardo Garcia on 10/06/24.
//

import SwiftUI

struct ButtonExample: View {
    var body: some View {
        Button("Hola") {
            print("Holiwi")
        }
        Button(action: {print("Holiwi")}, label: {
            Text("Hola")
                .frame(width: 100,height: 50)
                .foregroundColor(.white)
                .background(.blue)
                .cornerRadius(30)
        })
    }
}

struct Counter:View {
    @State var subscriberNumber = 0
    var body: some View {
        Button(action: {
            subscriberNumber += 1
        }, label: {
            Text("Suscriptores: \(subscriberNumber)")
                .bold()
                .font(.title)
                .frame(height: 50)
                .foregroundColor(.white)
                .background(.red)
                .cornerRadius(30)
        })
    }
}

#Preview {
    Counter()
}
