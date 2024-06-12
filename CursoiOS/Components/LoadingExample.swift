//
//  LoadingExample.swift
//  CursoiOS
//
//  Created by Ricardo Garcia on 12/06/24.
//

import SwiftUI

struct LoadingExample:View {
    @State var loading:Bool = false
    
    var body: some View {
        ZStack{
            VStack{
                Button("Iniciar loading"){
                    loading = true
                }
            }
            
            if loading {
                CustomLoading()
                let _ = timer()
            }
            
        }
    }
    
    func timer() {
        Timer.scheduledTimer(withTimeInterval: 3, repeats: false) { _ in
            loading = false
        }
    }
    
}

struct CustomLoading:View {
    var body: some View {
        VStack {
            LottieView()
                .scaleEffect(0.3)
        }.background(.gray.opacity(0.3))
    }
}

#Preview {
    LoadingExample()
}
