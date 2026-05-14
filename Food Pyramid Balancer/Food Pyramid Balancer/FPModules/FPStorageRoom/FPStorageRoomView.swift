//
//  FPStorageRoomView.swift
//  Food Pyramid Balancer
//
//

import SwiftUI

enum RoomState: String, CaseIterable {
    case basic, own
    
    var title: String {
        switch self {
        case .basic:
            "BASIC"
        case .own:
            "MY PRODUCTS"
        }
    }
}
struct FPStorageRoomView: View {
    
    @State var viewState: RoomState = .basic
    var body: some View {
        VStack {
            HStack {
                Image(.addIconFP)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 36)
                    .opacity(0)
                
                Text("Storage room")
                    .font(.system(size: 22, weight: .regular))
                    .textCase(.uppercase)
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity, alignment: .center)
                
                Button {
                    
                } label: {
                    Image(.addIconFP)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 36)
                }
                
            }
            
            HStack {
                ForEach(RoomState.allCases, id: \.rawValue) { state in
                    Text(state.title)
                        .font(.system(size: 14, weight: .regular))
                        .textCase(.uppercase)
                        .foregroundStyle(viewState == state ? .appYellow : .white.opacity(0.5))
                        .padding(10)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .background(.tabBarBg)
                        .clipShape(RoundedRectangle(cornerRadius: 5))
                        .overlay {
                            if viewState == state {
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(lineWidth: 1)
                                    .foregroundStyle(.appYellow)
                            }
                        }
                        .onTapGesture {
                            viewState = state
                        }
                }
            }
            
            ScrollView {
                VStack {
                    
                }
                .padding(.bottom, 150)
            }
        }
        .padding(.horizontal, 25)
        .background(
            Image(.appBgFP)
                .resizable()
                .ignoresSafeArea()
        )
    }
}

#Preview {
    FPStorageRoomView()
}
