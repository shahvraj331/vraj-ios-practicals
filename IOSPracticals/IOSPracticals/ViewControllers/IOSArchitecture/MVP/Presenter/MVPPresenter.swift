//
//  MVPPresenter.swift
//  IOSPracticals
//
//  Created by Vraj Shah on 13/04/22.
//
import UIKit

protocol BackgroundDelegate {
    func changeBackground(color: UIColor)
}

class Presenter {
    
    //MARK: - Variables
    var presenter: BackgroundDelegate?
    
    //MARK: - functions
    func updateBackgroundColor(color: String) {
        guard let selectedColor = Color(rawValue: color) else { return }
        let backgroundColor = getColor(color: selectedColor)
        presenter?.changeBackground(color: backgroundColor)
    }
    
    func getColor(color: Color) -> UIColor {
        switch color {
        case .red:
            return UIColor.red
        case .yellow:
            return UIColor.yellow
        case .green:
            return UIColor.green
        case .pink:
            return UIColor.systemPink
        case .white:
            return UIColor.white
        }
    }
    
}//End of class
