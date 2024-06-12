//
//  ViewPager.swift
//  CursoiOS
//
//  Created by Ricardo Garcia on 11/06/24.
//

import SwiftUI
import SwiftUIPager

struct ViewPager: View {
    @StateObject var page: Page = .withIndex(0)
    @State var showSheet:Bool = false
    // @ObservedObject var page: Page = .first()
    var items = Array(0...10)
    var details = Array(0...3)
    @State var planSelected:Int = 0

    var body: some View {
        VStack {
            Pager(page: page,
                  data: items,
                  id: \.self,
                  content: { index in
                VStack {
                    VStack {
                        Text("Congelalo por \(index) dias")
                            .frame(maxWidth: .infinity)
                            .padding(.top,10)
                            .padding(.bottom,10)
                            .background(.gray)
                        Text("Rifate \(index)")
                            .font(.largeTitle)
                        Text("\(index)GB/mes")
                            .frame(maxWidth: .infinity)
                            .font(.largeTitle)
                            .padding(.top,10)
                            .padding(.bottom,10)
                            .background(.gray)
                        ForEach(details,id: \.self) { place in
                            HStack {
                                Image(systemName: "xmark.circle")
                                Text("Redes sociales ilimitadas")
                            }
                        }
                        Rectangle().foregroundColor(.blue).frame(maxWidth: .infinity,maxHeight: 40)
                        Text("$\(index)0000")
                            .font(.title)
                            .padding(.bottom,15)
                        
                    }
                    .frame(width: 300,height: 380)
                    .background(.green)
                    .cornerRadius(25)
                    
                    Button(action: {
                        planSelected = index
                        showSheet = true
                    }) {
                        Text("Comprar")
                        .frame(minWidth: 100, maxWidth: 300, minHeight: 44, maxHeight: 44, alignment: .center)
                        .foregroundColor(Color.white)
                        .background(Color.orange)
                        .cornerRadius(26)
                    }.padding(.top,5)
                    
                }
            }).itemSpacing(10)
                .itemAspectRatio(0.8)
                .sensitivity(.high)
                .interactive(scale: 0.8)
            Spacer()
        }.onAppear{
            withAnimation{
                page.update(Page.Update.new(index: 4))
            }
        }
        .sheet(isPresented:$showSheet){
            OpenPlan(planSelected: $planSelected)
        }
     }
}

struct OpenPlan:View {
    @Binding var planSelected:Int
    var body: some View {
        NavigationStack{
            VStack {
                NavigationLink(destination:IMCView()) {
                    Text("Comprar plan \(planSelected)")
                }
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.white.edgesIgnoringSafeArea(.all))
                .toolbar{
                    ToolbarItem(placement: .principal) {
                        Text("Comprar Plan").bold().foregroundColor(.black)
                    }
                }
        }
    }
}

#Preview {
    ViewPager()
}
