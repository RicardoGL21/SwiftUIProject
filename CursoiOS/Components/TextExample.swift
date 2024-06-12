//
//  TextExample.swift
//  CursoiOS
//
//  Created by Ricardo Garcia on 10/06/24.
//

import SwiftUI

struct TextExample: View {
    var body: some View {
        VStack{
            Text("Hello, World!").font(.headline)
            Text("Custom")
                .font(.system(size: 40,weight: .light, design: .monospaced))
                .italic()
                .bold()
                .underline()
                .foregroundColor(.blue)
                .background(.red)
            Text("aris aris aris aris aris aris aris")
                .frame(width: 150)
                .lineLimit(3)
                .lineSpacing(20)
        }
    }
}

#Preview {
    TextExample()
}
