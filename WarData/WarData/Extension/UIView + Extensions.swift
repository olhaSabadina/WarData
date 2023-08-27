
import Foundation
import UIKit

//This extension UIView is intended for configuring the shift schedule.
//Used in the ScheduleConstructor

extension UIView {
   
    func addShadow(cornerRadius: CGFloat, offset: CGSize, color: UIColor, radius: CGFloat, opacity: Float) {
        layer.cornerRadius = cornerRadius
        layer.shadowColor = color.cgColor
        layer.shadowOffset = offset
        layer.shadowOpacity = opacity
        layer.shadowRadius = radius
        layer.masksToBounds = false
    }
    
    func setShadowWithCornerRadius(cornerRadius: CGFloat, shadowColor: UIColor, shadowOffset: CGSize, shadowOpacity: Float = 1, shadowRadius: CGFloat = 15) {
        layer.cornerRadius = cornerRadius
        layer.shadowColor = shadowColor.cgColor
        layer.shadowOffset = shadowOffset
        layer.shadowOpacity = shadowOpacity
        layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius).cgPath
        layer.shadowRadius = shadowRadius
    }
    
    func cornerRadius(radius: CGFloat, backColor: UIColor? = nil) {
        clipsToBounds = true
        layer.cornerRadius = radius
        guard backColor != nil else {return}
        backgroundColor = backColor
    }
    
    func borderRadius(radius: CGFloat, layerColor: UIColor? = nil, width: CGFloat) {
        clipsToBounds = true
        layer.cornerRadius = radius
        layer.borderWidth = width
        guard layerColor != nil else {return}
        layer.borderColor = layerColor?.cgColor
    }
    
    func setLabelColor(borderColor: UIColor?, backgroundColor: UIColor?) {
        layer.borderColor = borderColor?.cgColor
        layer.backgroundColor = backgroundColor?.cgColor
    }
    
    func layerBorderColor(layerColor: UIColor, width: CGFloat) {
        layer.borderWidth = width
        layer.borderColor = layerColor.cgColor
    }
}
