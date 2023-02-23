//
//  OrderView.swift
//  OrderApp
//
//  Created by yimkeul on 2023/02/23.
//

import SwiftUI

struct OrderView: View {
    
    @State var amount : Int = 0
    
    var body: some View {
        VStack{
            Text("Salad Sandwich")
                .font(.largeTitle)
            Image("saladsandwich")
                .resizable()
                .scaledToFill()
                .frame(maxWidth: .infinity, maxHeight: 400)
                .cornerRadius(15)
            HStack{
                Text("소요시간 : ")
                Spacer()
                Text("10분")
            }
            HStack{
                Text("가격 : ")
                Spacer()
                Text("3000원")
            }
            Stepper(value : $amount){
                Text("수량 : \(amount)개")
            }
            HStack{
                Text("총 금액 : ")
                Spacer()
                Text("12,000원")
            }
            Button{
                
            } label: {
                Text("주문하기")
            }
        }
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
    }
}
