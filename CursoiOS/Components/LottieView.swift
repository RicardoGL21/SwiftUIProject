//
//  LottieView.swift
//  CursoiOS
//
//  Created by Ricardo Garcia on 12/06/24.
//

import SwiftUI
import Lottie

struct LottieView: UIViewRepresentable {
    let name:String
    let loopMode:LottieLoopMode
    let animationSpeed:CGFloat
    
    init(name: String = ConstantsJson.loading, loopMode: LottieLoopMode = .loop, animationSpeed: CGFloat = 1) {
        self.name = name
        self.loopMode = loopMode
        self.animationSpeed = animationSpeed
    }
    
    func makeUIView(context: Context) -> some UIView {
        let animationView = LottieAnimationView(name: name)
        animationView.loopMode = loopMode
        animationView.animationSpeed = animationSpeed
        animationView.play()
        return animationView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
    
}

#Preview {
    LottieView()
}

enum ConstantsJson {
    static var loading = "loading"
}
