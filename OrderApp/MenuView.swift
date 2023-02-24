//
//  ContentView.swift
//  OrderApp
//
//  Created by yimkeul on 2023/02/21.
//

import SwiftUI


var orderData : [OrderContent] = []


struct MenuView: View {
    @State var showOrdered : Bool = false
    @State var deleteList : Bool = false
    
    var body: some View {
        NavigationStack{
            List{
                ForEach(Sandwich.sampleData , id : \.self) { item in
                    NavigationLink {
                        OrderView(selectedSandwich: item)
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
            .toolbar {
                ToolbarItem{
                    Button{
                        showOrdered.toggle()
                    } label: {
                        Text("주문 확인")
                    }
                }
            }.sheet(isPresented: $showOrdered){
                List{
                    if orderData.isEmpty {
                        Text("주문한 내역이 없습니다.")
                    }
                    
                    ForEach(orderData, id : \.self) { item in
                        HStack{
                            Text(item.name)
                            Spacer()
                            Label(item.totalPrice , systemImage: "wonsign")
                        }
                    }
                    
                    Button{
                        deleteList.toggle()
                        orderData = []
                    }label : {
                        HStack{
                            Spacer()
                            Text("지우기")
                            Spacer()
                        }
                        
                    }.alert("내용이 삭제되었습니다." , isPresented: $deleteList ){}
                    
                }
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

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
