//
//  AYPopMenu.swift
//  AYCover
//
//  Created by andy on 2023/8/11.
//

import UIKit

let kWindow = UIApplication.shared.windows.filter {$0.isKeyWindow}.first!

class AYPopMenu: UIView {
    
    @discardableResult
    static func show(_ point: CGPoint, inView: UIView?) -> AYPopMenu {
        let menu = AYPopMenu()
        menu.backgroundColor = UIColor.black
        menu.center = point
        menu.layer.masksToBounds = true
        kWindow.addSubview(menu)
      
        // 外部自定义view
        if let customView = inView {
            menu.frame.size = customView.frame.size
            customView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            menu.addSubview(customView)
        }
 
        return menu
    }
    
    func hidden(_ point: CGPoint, completion: (() -> (Void))? = nil) {
        UIView.animate(withDuration: 0.25) {
            self.center = point
            self.transform = CGAffineTransform(scaleX: 1, y: 0.001)
        } completion: { _ in
            completion?()
        }
    }
}
