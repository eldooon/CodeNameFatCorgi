//
//  AlertViewController.swift
//  Milo
//
//  Created by Eldon Chan on 4/13/18.
//  Copyright © 2018 ByEldon. All rights reserved.
//

import UIKit

class AlertViewController: UIViewController {

    @IBOutlet weak var alertImageView: UIImageView!
    @IBOutlet weak var alertLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        Timer.scheduledTimer(timeInterval: 1.2, target: self, selector: #selector(dismissAlert), userInfo: nil, repeats: false)
    }

    override func viewDidAppear(_ animated: Bool) {
        
    
    }
    
    @objc func dismissAlert() {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
