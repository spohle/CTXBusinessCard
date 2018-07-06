//
//  HomeViewController_UI.swift
//  CTXBusinessCard
//
//  Created by Sven Pohle on 7/2/18.
//  Copyright © 2018 Sven Pohle. All rights reserved.
//

import Foundation
import ARKit

class AddButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: CGRect.zero)
        
        self.setImage(UIImage(named: "add.png"), for: .normal)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

let uiARView: ARSCNView = {
   let view = ARSCNView()
    
    view.debugOptions = ARSCNDebugOptions.showFeaturePoints
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
}()

let uiAddButton = AddButton()

extension HomeViewController {
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    func setupUserInterface() {
        view.addSubview(uiARView)
        uiARView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        uiARView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        uiARView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        uiARView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        view.addSubview(uiAddButton)
        uiAddButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50).isActive = true
        uiAddButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        uiAddButton.widthAnchor.constraint(equalToConstant: 75).isActive = true
        uiAddButton.heightAnchor.constraint(equalToConstant: 75).isActive = true
        uiAddButton.isHidden = true
    }
    
}
