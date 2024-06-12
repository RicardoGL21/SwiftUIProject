//
//  ViewPagerNative.swift
//  CursoiOS
//
//  Created by Ricardo Garcia on 12/06/24.
//

import SwiftUI

struct ViewPagerNative: View {
    
    var items = Array(0...10)
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack(spacing:10){
                ForEach(items, id: \.self){ item in
                    Rectangle()
                        .frame(width: 340)
                }
            }
        }
        .contentMargins(.horizontal,28)
        .scrollTargetBehavior(.paging)
    }
}

#Preview {
    ViewPagerNative()
}
