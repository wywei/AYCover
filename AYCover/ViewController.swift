//
//  ViewController.swift
//  AYCover
//
//  Created by andy on 2023/8/11.
//

import UIKit

class ViewController: UIViewController {
    lazy var btn: UIButton = {
        let v = UIButton()
        v.frame = CGRect(origin: self.view.center, size: CGSize(width: 40, height: 40))
        v.backgroundColor = UIColor.red
        v.addTarget(self, action: #selector(clickedBtn), for: .touchUpInside)
        return v
    }()
    
    @objc func clickedBtn() {
        let contentVC = ATContentVC()
        self.modalPresentationStyle = .formSheet
        self.present(contentVC, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

/*
class ViewController: UIViewController {
    var menuView: AYPopMenu!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let cover = AYCover.show()
        cover.addTarget(self, action: #selector(clickedCover), for: .touchUpInside)
        let btn = UIButton()
        btn.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        btn.backgroundColor = UIColor.red
        btn.addTarget(self, action: #selector(clickedBtn), for: .touchUpInside)
        let menuView = AYPopMenu.show(CGPoint(x: 100, y: 100), inView: btn)
        self.menuView = menuView
    }
    
    @objc func clickedCover() {
        menuView.hidden(CGPoint.zero) {
            AYCover.hidden()
        }
    }
    
    @objc func clickedBtn() {
        print("clickedBtn")
    }
}*/

/*
extension ViewController: AYDropMenuDelegate {
    func dropMenu(_ dropMenu: AYDropMenu, didSelectRowAt indexPath: IndexPath) {
        selectedIndexPath = indexPath
        
        // 消失遮照
        dropMenu.hidden(completion: {
            // 消失cover
            AYCover.hidden()
        })
    }
}

class ViewController: UIViewController {
    
    var dropMenu: AYDropMenu?
    // menum默认选中的item
    var selectedIndexPath = IndexPath(row: 2, section: 0)
    
    // menum菜单数据源
    var dataSource = [Model(content: "11111"),
                      Model(content: "22222"),
                      Model(content: "33333"),
                      Model(content: "44444")]

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // 显示遮照
        let cover = AYCover.show()
        cover.addTarget(self, action: #selector(clickedCover), for: .touchUpInside)
       
        // 显示菜单
        let rect = CGRect(x: 10, y: 100, width: 80, height: 0)
        let dropMenu = AYDropMenu.show(rect)
        dropMenu.dataArr = dataSource
        dropMenu.selectedIndexPath = selectedIndexPath
        dropMenu.delegate = self
        self.dropMenu = dropMenu
    }
    
    @objc func clickedCover() {
        // 消失遮照
        dropMenu?.hidden(completion: {
            // 消失cover
            AYCover.hidden()
        })
    }
}*/

