//
//  OrderView.swift
//  OrderApp
//
//  Created by yimkeul on 2023/02/23.
//

import SwiftUI

struct OrderView: View {
    
    let selectedSandwich : Sandwich
    
    @State var amount : Int = 0
    @State var showAlert : Bool = false
    
    
    
    var body: some View {
        VStack( alignment: .leading){
            Text(selectedSandwich.name)
                .font(.largeTitle)
            Image(selectedSandwich.imageName)
                .resizable()
                .scaledToFill()
                .frame(minWidth: 300)
                .frame(maxWidth: .infinity, maxHeight:  400)
                .cornerRadius(15)
            
            HStack{
                Text("소요시간 : ")
                Spacer()
                Text(selectedSandwich.cookedTime)
            }
            HStack{
                Text("가격 : ")
                Spacer()
                Text(selectedSandwich.price)
            }
            Stepper(value : $amount){
                Text("수량 : \(amount)개")
            }
            HStack{
                Text("총 금액 : ")
                Spacer()
                Text("\((Int(selectedSandwich.price) ?? 0)! * amount) 원")
            
            }
            Button{
                //
                showAlert.toggle()
                orderData.append(OrderContent(name: selectedSandwich.name, totalPrice: String((Int(selectedSandwich.price) ?? 0)! * amount)))
            } label: {
                Text("주문하기")
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(.green)
                    .cornerRadius(15)
            }.alert("주문이 완료되었습니다!", isPresented: $showAlert) {}
        }.padding()
        
        
        
        
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView(selectedSandwich : Sandwich.singleSampleData)
    }
}
