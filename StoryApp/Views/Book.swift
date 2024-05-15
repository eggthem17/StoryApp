//
//  Book.swift
//  StoryApp
//
//  Created by MinKyu CHA on 5/15/24.
//

import SwiftUI

struct Book: View {
    var body: some View {
        Image(._01)
            .resizable()
            .scaledToFill()
            .frame(width: 176, height: 260)
            .clipShape(.rect(cornerRadius: 12))
            .overlay(alignment: .bottom) {
                UnevenRoundedRectangle(bottomLeadingRadius: 12, bottomTrailingRadius: 12)
                    .frame(height: 40)
                    .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.black, .clear]), startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/))
                Text("Book Name")
                    .bold()
                    .foregroundStyle(.white)
                    .frame(width: 150, alignment: .leading)
            }
            .overlay(alignment: .topTrailing) {
                HStack(spacing: 2) {
                    Image(systemName: "star.fill")
                        .foregroundStyle(.yellow)
                    Text("5.0")
                        .foregroundStyle(.black)
                }
                .font(.system(size: 11))
                .frame(width: 45, height: 22)
                .background(.white, in: .rect(cornerRadius: 20))
                .padding(12)
            }
    }
}

#Preview {
    Book()
}
