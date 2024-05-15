//
//  Segment.swift
//  StoryApp
//
//  Created by MinKyu CHA on 5/15/24.
//

import SwiftUI

struct Segment: View {
    @State var selectedTab: Tab = .all
    @State var textWidth: CGFloat = 0
    @State var textWidths: [CGFloat] = Array(repeating: 0, count: Tab.allCases.count)
    @State var indexInt: CGFloat = 0
    @State var hstackWidth: CGFloat = 0
    
    var body: some View {
        ScrollViewReader(content: { proxy in
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 30) {
                    ForEach(Tab.allCases.indices, id: \.self) { index in
                        let tab = Tab.allCases[index]
                        Text(tab.rawValue)
                            .font(.callout)
                            .background(
                                GeometryReader(content: { geometry -> Color in
                                    DispatchQueue.main.async {
                                        textWidths[index] = geometry.size.width
                                    }
                                    
                                    return Color.clear
                                })
                            )
                            .id(index)
                            .frame(width: 70, alignment: .leading)
                            .padding(.vertical, 10)
                            .foregroundStyle(selectedTab == tab ? .primary : .secondary)
                            .onTapGesture {
                                withAnimation {
                                    indexInt = CGFloat(index)
                                    textWidth = textWidths[index]
                                    selectedTab = tab
                                    proxy.scrollTo(index, anchor: .center)
                                }
                            }
                    }
                }
                .background(
                    GeometryReader(content: { geometry in
                        Capsule()
                            .foregroundStyle(.gray.opacity(0.3))
                            .frame(width: textWidth + 30)
                            .offset(x: indexInt * 100)
                            .offset(x: -15)
                    })
                )
                .padding(.horizontal, 16)
            }
            .onAppear() {
                if textWidth == 0 {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
                        textWidth = textWidths[0]
                    }
                }
            }
        })
    }
}

#Preview {
    Segment()
}
