//
//  ContentView.swift
//  OrderApp
//
//  Created by yimkeul on 2023/02/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack{
            List{
                VStack(alignment: .leading){
                    Text("Salad Sandwich")
                        .font(.largeTitle)
                        .bold()
                    Image(systemName: "wonsign")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 300, height: 200, alignment: .center)
                        .background(.yellow)
                        .cornerRadius(15)
                    HStack{
                        Label("4000",systemImage: "wonsign")
                            .labelStyle(.titleAndIcon)
                        Spacer()
                        Label("10", systemImage: "clock" )
                            .labelStyle(.iconAndTitle)
                    }
                    .font(.caption)
                }
                .padding()
                .background(.blue)
                .cornerRadius(14)
                .navigationTitle("MainWay")

            }
        }
    }
}

struct IconAndTitleLabelStyle : LabelStyle{
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.title
            configuration.icon
        }
    }
}

extension LabelStyle where Self == IconAndTitleLabelStyle {
    static var iconAndTitle: Self { Self() }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
