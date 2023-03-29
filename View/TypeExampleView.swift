//
//  SwiftUIView.swift
//  
//
//  Created by Song Jihyuk on 2023/03/26.
//

import SwiftUI

struct TypeExampleView: View {
    @EnvironmentObject var boolean: Boolean
    
    var body: some View {
        ZStack {
            Color.backgroundBlack
                .ignoresSafeArea()
            
            VStack {
                GeometryReader {
                    let size = $0.size
                    
                    HStack {

                        Text("당신의\nChallenge\nBased\nLearning\n유형은?")
                            .font(.system(size: 36, weight: .regular, design: .default))
                            .multilineTextAlignment(.leading)
                            .foregroundColor(.white)
                            .offset(x: boolean.firstClicked ? -size.width : 0)
                            .padding(.leading, 40)
                            .opacity(boolean.firstClicked ? 0 : 1)
                        
                        Spacer()
                    }
                    .frame(width: size.width / 1.2)
                }
                .frame(height: 250)
                .padding(.vertical, 20)
                
                VStack(spacing: -30) {
                    ForEach(types.indices, id: \.self) { index in
                        GeometryReader {
                            let size = $0.size
                            VStack {
                                HStack(spacing: 0) {
                                    Image(types[index].memoji)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: size.height / 1.5)
                                        .padding(.leading)
                                    
                                    Text(types[index].title)
                                        .font(.system(size: 20, weight: .black))
                                        .padding(.horizontal, 20)
                                        .padding(.vertical, 8)
                                        .frame(height: 40)
                                        .background {
                                            Capsule()
                                                .fill(types[index].pointColor)
                                        }
                                    
                                    Spacer()
                                }
                            }
                            .offset(x: boolean.firstClicked ? -size.width : 0)
                            .opacity(boolean.firstClicked ? 0 : 1)
                        }
                    }
                }
                .frame(height: 350)
                .padding(.bottom)
            }
        }
    }
}
