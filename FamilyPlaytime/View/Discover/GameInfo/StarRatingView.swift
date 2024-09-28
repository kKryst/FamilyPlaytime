//
//  Rating.swift
//  Kids Playtime
//
//  Created by Krystian Konieczko on 27/01/2024.
//

import SwiftUI

struct StarRatingView: View {
    @Binding var rating: Int
    
    var label = ""
    var maximumRating = 5
    
    var offImage: Image?
    var onImage = Image(systemName: "star.fill")
    
    var offColor = Color.gray
    var onColor = AppColors.lightBlue
    
    var body: some View {
        HStack {
            if label.isEmpty == false {
                Text(label)
            }
            
            ForEach (1..<maximumRating + 1, id: \.self) {number in
                Button {
                    rating = number
                } label: {
                    image(for: number)
                        .resizable()
                        .foregroundStyle(number > rating ? offColor : onColor)
                        .frame(width: 64, height: 64)
                        
                }
            }
        }
    }
    
    func image(for number: Int) -> Image {
        if number > rating {
            offImage ?? onImage
        } else {
            onImage
        }
    }
}

#Preview {
    StarRatingView(rating: .constant(3))
}
