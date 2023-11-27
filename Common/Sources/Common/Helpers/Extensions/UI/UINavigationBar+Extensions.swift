//
//  UINavigationBar+Extensions.swift
//  
//
//  Created by Daniel Gomes Xavier on 04/11/23.
//

import UIKit

public extension UINavigationBar {

    func asHealthTrackrNavigationBar() {
        // TODO: set attributes
//        self.tintColor = ColorName.marineBlue
        self.backgroundColor = .white
        self.isTranslucent = false
        self.setBackgroundImage(UIImage(), for: .default)
        self.shadowImage = UIImage()
//        let font = FontFamily.RubikMedium.regular.font(size: ScreenSize.returnOnSmall(16, or: 18))
//        self.titleTextAttributes = [.foregroundColor: ColorName.marineBlue, .font: font]
    }
}
