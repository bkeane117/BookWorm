//
//  RatingView.swift
//  BookWorm
//
//  Created by Brendan Keane on 2021-05-03.
//

import SwiftUI

struct RatingView: View {
    
    @Binding var rating: Int
    
    var label = ""
    
    var maximumRating = 5
    
    var offImage: Image?
    var onImage = Image(systemName: "star.fill")
    
    var offColor = Color.gray
    var onColor = Color.yellow
    
    var body: some View {
        HStack {
            if label.isEmpty == false {
                Text(label)
            }
            
            ForEach(1..<maximumRating + 1) { number in
                // creat a list of rating images equal to our max rating
                self.image(for: number)
                    // colors the number of stars equal to the users rating
                    .foregroundColor(number > self.rating ? self.offColor : self.onColor)
                    // sets the rating to the star number that the user has selected
                    .onTapGesture {
                        self.rating = number
                    }
            }
        }
    }
    // if number passed in is greater than the current rating, return the off image, else return the on image
    //if the number that was passed in is equal to or less than the current rating, return the on image
    func image(for number: Int) -> Image {
        if number > rating {
            return offImage ?? onImage
        } else {
            return onImage
        }
    }
}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView(rating: .constant(4))
    }
}
