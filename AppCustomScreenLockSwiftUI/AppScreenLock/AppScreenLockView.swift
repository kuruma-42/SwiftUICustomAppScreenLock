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
            
            Group {
                Image(systemName: "lock.fill")
                    .resizable()
                    .frame(width: 55, height: 70, alignment: .center)
                    .padding(.bottom, 18)
                
                Text("잠금 해제")
                    .font(.system(size: 24, weight: .bold, design: .serif))
                    .padding(.bottom, 78)
            }
            
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
                }
                .frame(width: 12, height: 12, alignment: .center)
            }
            .padding(.bottom, 25)
            .offset(x: appScreenLockModel.isWrongPassword ? -10 : 0)
            .animation(appScreenLockModel.isWrongPassword ?  Animation.default.repeatCount(3).speed(6) : .none)
            
            Text("비밀번호를 잊어버렸어요")
                .font(.system(size: 14, weight: .regular, design: .serif))
                .underline()
                .padding(.bottom, 79)
                .foregroundColor(Color.gray)
                .contentShape(Rectangle())
                .
                .actionSheet(isPresented: , content: <#T##() -> SwiftUI.ActionSheet#>)
            
            
            
            Spacer()
            
            LazyVGrid(columns: columns) {
                ForEach((1...12), id: \.self) { numberpadNumber in
                    if numberpadNumber != 10 && numberpadNumber != 11 && numberpadNumber != 12 {
                        Button {
                            DispatchQueue.main.async {
                                appScreenLockModel.passwordFieldArray.append(numberpadNumber)
                                print("\(appScreenLockModel.passwordFieldArray)")
                            }
                        } label: {
                            Text("\(numberpadNumber)")
                                .padding(.bottom, 32)
                                .contentShape(Rectangle())
                                .foregroundColor(Color.black)
                        }
                        
                        
                    } else if numberpadNumber == 10 {
                        
                        Button {
                            DispatchQueue.main.async {
                                appScreenLockModel.resetPasswordArray()
                            }
                        } label: {
                            Image(systemName: "arrow.clockwise")
                                .foregroundColor(Color.gray)
                                .contentShape(Rectangle())
                        }
                        
                    } else if numberpadNumber == 11 {
                        Button{
                            appScreenLockModel.passwordFieldArray.append(0)
                        } label: {
                            Text("0")
                                .contentShape(Rectangle())
                                .foregroundColor(Color.gray)
                        }
                        
                        
                    } else if numberpadNumber == 12 {
                        Button {
                            DispatchQueue.main.async {
                                appScreenLockModel.deleteLastIndexPasswordArray()
                            }
                        } label: {
                            Image(systemName: "delete.left.fill")
                                .contentShape(Rectangle())
                                .foregroundColor(Color.gray)
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
        AppScreenLockView().environmentObject(AppScreenLockViewModel())
    }
}
