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
            .named("desktop")
            .addWatermark(image: UIImage.named("photos100"),at: .top, edgeInsets: UIEdgeInsets(top: 100, left: 0, bottom: 0, right: 0))
            .addWatermark(attributedString: NSAttributedString(string: "APPLE", attributes: [.font: UIFont.systemFont(ofSize: 100),.foregroundColor: UIColor.white]), at: .center, edgeInsets: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
            .asView()
        
        imageView.contentMode = .scaleAspectFit
        view.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        imageView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        
    }


}

