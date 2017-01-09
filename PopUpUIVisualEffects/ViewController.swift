//
//  ViewController.swift
//  PopUpUIVisualEffects
//
//  Created by Mihir on 2017-01-09.
//  Copyright © 2017 Mihir. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var visualView: UIVisualEffectView!

    @IBOutlet var addItemView: UIView!
    
    var effect = UIVisualEffect()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        effect = visualView.effect!
        visualView.effect = nil
        
        
        addItemView.layer.cornerRadius = 5
        
        
    }
    
    func animateIn()
    {
        self.view.addSubview(addItemView)
        
        addItemView.center = self.view.center
        
        addItemView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
        addItemView.alpha = 0
        
        UIView.animate(withDuration: 0.4)
        {
            self.visualView.effect = self.effect
            self.addItemView.alpha = 1
            self.addItemView.transform = CGAffineTransform.identity
        }
    }
    
    func animateOut()
    {
        UIView.animate(withDuration: 0.3, animations:
            {
                self.addItemView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
                self.addItemView.alpha = 0
                
                self.visualView.effect = nil
                
        }) { (success:Bool) in
            self.addItemView.removeFromSuperview()
        }
    }
    
    
    @IBAction func addItem(_ sender: Any)
    {
        animateIn()
    }
    @IBAction func dismissPopUp(_ sender: Any)
    {
        animateOut()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

