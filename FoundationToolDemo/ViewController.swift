//
//  ViewController.swift
//  FoundationToolDemo
//
//  Created by yzhu82 on 2019/3/4.
//  Copyright © 2019年 ld. All rights reserved.
//

import UIKit
import FoundationTool

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let imageView = UIImage
            .named("launch")
//            .addWatermark(string: "username&password", attribute: [.font: UIFont.systemFont(ofSize: 200),.foregroundColor: UIColor.white], at: .center)
            .addWatermark(attributedString: NSAttributedString(string: "username&password", attributes: [.font: UIFont.systemFont(ofSize: 100),.foregroundColor: UIColor.white]), at: .center, edgeInsets: UIEdgeInsets(top: 0, left: 100, bottom: 0, right: 0))
            .asView()
        
        imageView.contentMode = .scaleAspectFit
        view.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        imageView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        
        
        
        if #available(iOS 11.0, *) {
            print(view.safeAreaInsets.bottom)
        } else {
            // Fallback on earlier versions
        }
        
        
        let label = UILabel(frame: .zero)
        label.numberOfLines = 0
        label.backgroundColor = .white
        label.text = "asdasdasdasdasdasdasdasdasdasdasdasdasd"
        view.addSubview(label)
        label.drawText(in: CGRect(x: 1000, y: 1000, width: 100, height: 100))
        print(label.textRect(forBounds: CGRect(x: 0, y: 0, width: 100, height: 100), limitedToNumberOfLines: 0))
    }


}

