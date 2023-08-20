//
//  AYCover.swift
//  AYCover
//
//  Created by andy on 2023/8/11.
//

import UIKit

class AYCover: UIControl {
    
    @discardableResult
    static func show() -> AYCover {
        let cover = AYCover()
        cover.frame = UIScreen.main.bounds
        cover.backgroundColor = UIColor.black.withAlphaComponent(0.2)
        kWindow.addSubview(cover)
        return cover
    }
    
    static func hidden() {
        kWindow.subviews
            .filter({type(of: $0) == AYCover.self})
            .forEach({$0.removeFromSuperview()})
    }

}
