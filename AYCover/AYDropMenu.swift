//
//  AYDropMenu.swift
//  AYCover
//
//  Created by andy on 2023/8/12.
//

import UIKit

class Model: NSObject {
    var content: String = ""
    var isSelected: Bool = false
    init(content: String, isSelected: Bool = false) {
        self.content = content
        self.isSelected = isSelected
    }
}

protocol AYDropMenuDelegate: NSObjectProtocol {
    func dropMenu(_ dropMenu: AYDropMenu, didSelectRowAt indexPath: IndexPath)
}

class AYDropMenu: UIView {
    var selectedIndexPath: IndexPath? {
        didSet {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
                guard let indePath = self.selectedIndexPath else { return }
                if let menu = kWindow.subviews.filter({type(of: $0) == AYDropMenu.self}).first,
                   let tableView = menu.subviews.filter({type(of: $0) == UITableView.self}).first as? UITableView {
                    if let cell = tableView.cellForRow(at: indePath) as? AYTableViewCell {
                        cell.titleLabel.textColor = .red
                    }
                }
            }
        }
    }
    
    weak var delegate: AYDropMenuDelegate?
    var dataArr = [Model]()
    
    static func show(_ frame: CGRect, showItemCount: Int = 4) -> AYDropMenu {
        let view = AYDropMenu()
        kWindow.addSubview(view)
     
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.delegate = view
        tableView.dataSource = view
        tableView.isScrollEnabled = false
        tableView.backgroundColor = .white
        tableView.register(AYTableViewCell.self, forCellReuseIdentifier: "ID")
        tableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(tableView)
        
        view.frame = CGRect(x: frame.minX, y: frame.maxY, width: frame.width, height: 0)
        UIView.animate(withDuration: 0.25) {
            view.frame = CGRect(x: frame.minX, y: frame.maxY, width: frame.width, height: CGFloat(44*showItemCount))
        }
        return view
    }
    
    func hidden(completion: (() -> (Void))? = nil) {
        UIView.animate(withDuration: 0.25) {
            self.frame.size.height = 0
        } completion: { _ in
            self.removeFromSuperview()
            completion?()
        }
    }
}

extension AYDropMenu: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ID", for: indexPath) as! AYTableViewCell
        cell.titleLabel.text = dataArr[indexPath.row].content
        cell.titleLabel.textColor = dataArr[indexPath.row].isSelected ? .red : .black
        
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = dataArr[indexPath.row]
        model.isSelected = true
        dataArr.filter({ $0 != model}).forEach({$0.isSelected = false})
        tableView.reloadData()
        delegate?.dropMenu(self, didSelectRowAt: indexPath)
    }
}

class AYTableViewCell: UITableViewCell {
    lazy var titleLabel: UILabel = {
        let v = UILabel()
        v.textAlignment = .center
        return v
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(titleLabel)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        titleLabel.frame = self.bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


