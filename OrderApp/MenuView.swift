//
//  ContentView.swift
//  OrderApp
//
//  Created by yimkeul on 2023/02/21.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        NavigationStack{
            List{
                VStack(alignment: .leading){
                    Text("Salad Sandwich")
                        .font(.largeTitle)
                        .bold()
                    Image("saladsandwich")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 300, height: 200, alignment: .center)
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
                .listRowBackground(Color.mint)
            }
            .navigationTitle("MainWay")
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

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
