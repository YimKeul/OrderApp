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
                ForEach(Sandwich.sampleData , id : \.self) { item in
                    NavigationLink {
                        OrderView()
                    } label: {
                        VStack(alignment: .leading){
                            Text(item.name)
                                .font(.largeTitle)
                                .bold()
                            Image(item.imageName)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 300, height: 200, alignment: .center)
                                .cornerRadius(15)
                            HStack{
                                Label(item.price,systemImage: "wonsign")
                                    .labelStyle(.titleAndIcon)
                                Spacer()
                                Label(item.cookedTime, systemImage: "clock" )
                                    .labelStyle(.iconAndTitle)
                            }
                            .font(.caption)
                        }
                        .padding()
                    }
                    .listRowBackground(item.menuColor)
                }
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
