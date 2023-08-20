//
//  ATContentVC.swift
//  AYCover
//
//  Created by andy on 2023/8/13.
//

import UIKit



extension ATContentVC: UIAdaptivePresentationControllerDelegate {
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .formSheet
    }
}

class ATContentVC: UIViewController {
    
    init(){
        super.init(nibName: nil, bundle: nil)
        self.modalPresentationStyle = .custom
//        self.transitioningDelegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var leftTableView: UITableView = {
        let v = UITableView.init(frame: CGRect(x: 0, y: 0, width: 150, height: self.view.bounds.height), style: .plain)
        v.delegate = self
        v.dataSource = self
        v.backgroundColor = UIColor.red
        return v
    }()
    
    lazy var rightTableView: UITableView = {
        let v = UITableView.init(frame: CGRect(x: 15, y: 0, width: 150, height: self.view.bounds.height), style: .plain)
        v.delegate = self
        v.dataSource = self
        v.backgroundColor = UIColor.red
        return v
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}

extension ATContentVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == leftTableView {
            return 5
        }
        
        if tableView == rightTableView {
            return 10
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == leftTableView{
            let cell = tableView.dequeueReusableCell(withIdentifier: "imageAndTitle", for: indexPath)
            return cell
        }
        
        if tableView == rightTableView {
            let cell = tableView.dequeueReusableCell(withIdentifier: "title", for: indexPath)
            return cell
        }
        return UITableViewCell()
    }
}
