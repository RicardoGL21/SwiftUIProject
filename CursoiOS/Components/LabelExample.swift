//
//  LabelExample.swift
//  CursoiOS
//
//  Created by Ricardo Garcia on 10/06/24.
//

import SwiftUI

struct LabelExample: View {
    var body: some View {
        Label("SUSCRIBETE", systemImage: "figure.badminton")
        Label(
            title: { Text("Label") },
            icon: { Image("swiftui").resizable().scaledToFit().frame(height: 30) }
        )
        
    }
}

#Preview {
    LabelExample()
}
