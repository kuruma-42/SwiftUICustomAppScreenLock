//
//  PasswordSettingView.swift
//  AppCustomScreenLockSwiftUI
//
//  Created by Yong Jun Cha on 2022/01/17.
//

import SwiftUI
import Combine

struct PasswordSettingView: View {
    @EnvironmentObject var stateManager : StateManager
    @StateObject var passwordSettingViewModel = PasswordSettingViewModel()
    var columns: [GridItem] = Array(repeating: .init(.flexible()), count: 3)
    var body: some View {
        VStack{
            ZStack{
                Rectangle()
                    .foregroundColor(Color.pink)
                    .frame(height: 80)
                    .padding(.bottom)
                
                Text("비밀번호 설정")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .font(.system(size: 18, weight: .bold, design: .serif))
            }
            .padding(.bottom, 78)
            
            Spacer()
            
            Group {
                Image(systemName: "lock.circle.fill")
                    .resizable()
                    .frame(width: 70, height: 70, alignment: .center)
                    .padding(.bottom, 18)
                    .foregroundColor(Color.black)
                
                Text("비밀번호 설정")
                    .font(.system(size: 24, weight: .bold, design: .serif))
                    .padding(.bottom, 78)
                    .foregroundColor(Color.black)
            }
            
            HStack(spacing: 40){
                Group {
                    Circle()
                        .foregroundColor(passwordSettingViewModel.passwordFieldArray.count >= 1 ? Color.pink : Color.black)
                    Circle()
                        .foregroundColor(passwordSettingViewModel.passwordFieldArray.count >= 2 ? Color.pink : Color.black)
                    Circle()
                        .foregroundColor(passwordSettingViewModel.passwordFieldArray.count >= 3 ? Color.pink : Color.black)
                    Circle()
                        .foregroundColor(passwordSettingViewModel.passwordFieldArray.count >= 4 ? Color.pink : Color.black)
                }
                .frame(width: 12, height: 12, alignment: .center)
                
            }
            .padding(.bottom, 25)
            
            Spacer()
            
            LazyVGrid(columns: columns) {
                ForEach((1...12), id: \.self) { numberpadNumber in
                    if numberpadNumber != 10 && numberpadNumber != 11 && numberpadNumber != 12 {
                        Button {
                            DispatchQueue.main.async {
                                passwordSettingViewModel.passwordFieldArray.append(numberpadNumber)
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
                                passwordSettingViewModel.resetPasswordArray()
                            }
                        } label: {
                            Image(systemName: "arrow.clockwise")
                                .foregroundColor(Color.gray)
                                .contentShape(Rectangle())
                        }
                        
                    } else if numberpadNumber == 11 {
                        Button{
                            passwordSettingViewModel.passwordFieldArray.append(0)
                        } label: {
                            Text("0")
                                .contentShape(Rectangle())
                                .foregroundColor(Color.gray)
                        }
                        
                        
                    } else if numberpadNumber == 12 {
                        Button {
                            DispatchQueue.main.async {
                                passwordSettingViewModel.deleteLastIndexPasswordArray()
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
        .onAppear {
            passwordSettingViewModel.setObserver()
        }
        .onChange(of: passwordSettingViewModel.isPasswordRegisterFinish) { newValue in
            if newValue {
                stateManager.isPasswordSettingView.toggle()
            }
        }
    }
}

struct PasswordSettingView_Previews: PreviewProvider {
    static var previews: some View {
        PasswordSettingView()
    }
}
