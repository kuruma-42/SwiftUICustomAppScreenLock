//
//  AppScreenLockView.swift
//  AppCustomScreenLockSwiftUI
//
//  Created by Yong Jun Cha on 2022/01/14.
//

import SwiftUI

struct AppScreenLockView: View {
    @EnvironmentObject var appScreenLockModel : AppScreenLockViewModel
    private var placeHolder : String = "비밀번호를 입력해주세요"
    @State var textfiledText : String = ""
    
    
    var columns: [GridItem] =
            Array(repeating: .init(.flexible()), count: 3)
    
    
    var body: some View {
        VStack{
            ZStack{
                Rectangle()
                    .foregroundColor(Color.pink)
                    .frame(height: 80)
                    .padding(.bottom)
                
                Text("화면잠금")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .font(.system(size: 18, weight: .bold, design: .serif))
            }
            .padding(.bottom, 78)
            
            Spacer()
            
            Image(systemName: "lock.fill")
                .resizable()
                .frame(width: 55, height: 70, alignment: .center)
                .padding(.bottom, 18)
            
            Text("잠금 해제")
                .font(.system(size: 24, weight: .bold, design: .serif))
            .padding(.bottom, 78)
            
            HStack(spacing: 40){
                Group {
                    Circle()
                        .foregroundColor(appScreenLockModel.passwordFieldArray.count >= 1 ? Color.pink : Color.black)
                    Circle()
                        .foregroundColor(appScreenLockModel.passwordFieldArray.count >= 2 ? Color.pink : Color.black)
                    Circle()
                        .foregroundColor(appScreenLockModel.passwordFieldArray.count >= 3 ? Color.pink : Color.black)
                    Circle()
                        .foregroundColor(appScreenLockModel.passwordFieldArray.count >= 4 ? Color.pink : Color.black)
                }.frame(width: 12, height: 12, alignment: .center)
            }
            .padding(.bottom, 25)
            
            Text("비밀번호를 잊어버렸어요")
                .font(.system(size: 14, weight: .regular, design: .serif))
                .underline()
                .padding(.bottom, 79)
                .foregroundColor(Color.gray)

            
            Spacer()
            
                LazyVGrid(columns: columns) {
                    ForEach((1...12), id: \.self) { numberpadNumber in
                        if numberpadNumber != 10 && numberpadNumber != 11 && numberpadNumber != 12 {
                            Text("\(numberpadNumber)")
                                .padding(.bottom, 32)
                                .onTapGesture {
                                    appScreenLockModel.passwordFieldArray.append(String(numberpadNumber))
                                }
                        } else if numberpadNumber == 10 {
                            Text("재배열")
                                .foregroundColor(Color.gray)
                                .onTapGesture {
                                    appScreenLockModel.resetPasswordArray()
                                }
                        } else if numberpadNumber == 11 {
                            Text("0")
                        } else if numberpadNumber == 12 {
                            Text("지움")
                                .foregroundColor(Color.gray)
                                .onTapGesture {
                                    appScreenLockModel.deleteLastIndexPasswordArray()
                                }
                        }
                    }
                }
                .font(.largeTitle)
            
            
            Spacer()
         
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea()
    }
}

struct AppScreenLockView_Previews: PreviewProvider {
    static var previews: some View {
        AppScreenLockView()
    }
}
