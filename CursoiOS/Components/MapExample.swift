//
//  MapExample.swift
//  CursoiOS
//
//  Created by Ricardo Garcia on 11/06/24.
//

import SwiftUI
import MapKit

struct MapExample: View {
    
    @State var position = MapCameraPosition.region(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 19.5106024, longitude: -99.2221953), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)))
    
    var body: some View {
        ZStack {
            MapReader { proxy in
                
                Map(position: $position){
                    /*Marker("Pollito frito", coordinate: CLLocationCoordinate2D(latitude: 19.5106024, longitude: -99.2221953))*/
                    Annotation("Pollito frito", coordinate: CLLocationCoordinate2D(latitude: 19.5106024, longitude: -99.2221953)){
                        Circle().frame(height: 30)
                    }.annotationTitles(.visible)
                }
                    .mapStyle(.hybrid(elevation: .realistic,showsTraffic: true))
                /*.onMapCameraChange { context in
                 print("Estamos en: \(context.region)")
                 }*/
                    .onMapCameraChange(frequency: .continuous) { context in
                        print("Estamos en: \(context.region)")
                    }
                    .onTapGesture { coord in
                        if let coordinates = proxy.convert(coord, from: .local) {
                            withAnimation {
                                position = MapCameraPosition.region(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: coordinates.latitude, longitude: coordinates.longitude), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)))
                            }
                        }
                    }
            }
            VStack {
                Spacer()
                HStack {
                    Button("Ir al sur"){
                        withAnimation {
                            position = MapCameraPosition.region(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 19.3611154, longitude: -99.2744373), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)))
                        }
                    }.padding(32).background(.white).padding()
                    Button("Ir al norte"){
                        withAnimation{
                            position = MapCameraPosition.region(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 19.5106024, longitude: -99.2221953), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)))
                        }
                    }.padding(32).background(.white).padding()
                }
            }
        }
    }
}

#Preview {
    MapExample()
}
