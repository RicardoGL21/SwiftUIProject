//
//  ImageExample.swift
//  CursoiOS
//
//  Created by Ricardo Garcia on 10/06/24.
//

import SwiftUI

struct ImageExample: View {
    var body: some View {
        Image("swiftui")
            .resizable()
            .scaledToFit()
            .frame(width: 50,height: 50)
        Image(systemName: "figure.walk")
            .resizable()
    }
}

#Preview {
    ImageExample()
}
