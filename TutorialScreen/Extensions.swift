//
//  Extensions.swift
//  TutorialScreen
//
//  Created by 村上匡志 on 2023-06-11.
//

import UIKit

extension UIView {
  func applyOverlay(cutoutViewsAndCornerRadii: [(UIView, CGFloat)]) {
    self.layer.sublayers?.filter({ $0 is CAShapeLayer }).forEach({ $0.removeFromSuperlayer() })

    let overlay = CAShapeLayer()
    overlay.fillColor = UIColor.black.withAlphaComponent(0.5).cgColor

    let overlayPath = UIBezierPath(rect: self.bounds)

    for (cutoutView, cornerRadius) in cutoutViewsAndCornerRadii {
      let cutoutRect = self.convert(cutoutView.bounds, from: cutoutView)
      let cutoutPath = UIBezierPath(roundedRect: cutoutRect, cornerRadius: cornerRadius)
      overlayPath.append(cutoutPath)
    }

    overlay.path = overlayPath.cgPath
    overlay.fillRule = .evenOdd

    self.layer.addSublayer(overlay)
  }

  
  func applyTriangleMaskLeft() {
    let path = UIBezierPath()
    path.move(to: CGPoint(x: bounds.width, y: bounds.height))
    path.addLine(to: CGPoint(x: bounds.width, y: 0))
    path.addLine(to: CGPoint(x: 0, y: bounds.height/2))
    path.close()
    
    let shapeLayer = CAShapeLayer()
    shapeLayer.path = path.cgPath
    layer.mask = shapeLayer
  }
  
  func applyTriangleMaskRight() {
    let path = UIBezierPath()
    path.move(to: CGPoint(x: 0, y: bounds.height))
    path.addLine(to: CGPoint(x: 0, y: 0))
    path.addLine(to: CGPoint(x: bounds.width, y: bounds.height/2))
    path.close()
    
    let shapeLayer = CAShapeLayer()
    shapeLayer.path = path.cgPath
    layer.mask = shapeLayer
  }
  
  func flashAnimation(on view: UIView, duration: TimeInterval) {
    UIView.animate(withDuration: duration, delay: 0, options: [.repeat, .autoreverse, .allowUserInteraction], animations: {
      view.alpha = 0.5
      view.backgroundColor = .black.withAlphaComponent(0.5)
    }, completion: { _ in
      view.alpha = 1
      view.backgroundColor = .black.withAlphaComponent(0.5)
    })
  }

}

extension UILabel {
  func animateText(text: String, characterDelay: TimeInterval, completion: @escaping () -> Void) {
    let characters = Array(text)
    var index = 0
    Timer.scheduledTimer(withTimeInterval: characterDelay, repeats: true) { timer in
      if index < characters.count {
        let substring = String(characters[0...index])
        self.text = substring
        index += 1
      } else {
        timer.invalidate()
        completion()
      }
    }
  }

}
