//
//  DoggoViewController.swift
//  API project
//
//  Created by Dax Gerber on 12/1/23.
//

import UIKit

class DoggoViewController: UIViewController {

    
    @IBOutlet weak var doggoImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        Task {
            do {
                try await fetch()
            } catch {
                print(error.localizedDescription)
            }
        }

    }
    

    @IBAction func doggoButton(_ sender: UIButton) {
        //do the stuff
        Task {
            do {
                try await fetch()
            } catch {
                print(error.localizedDescription)
            }
        }
        
    }
    
    func fetch() async throws {
        let data = try await APIHandler.getMeTheGoods(urlString: "https://dog.ceo/api/breeds/image/random")
        let doggo = try APIHandler.doggo(dogoData: data)
        let imageData = try await APIHandler.getMeTheGoods(urlString: doggo.message)
        doggoImage.image = UIImage(data: imageData)
    }

}
