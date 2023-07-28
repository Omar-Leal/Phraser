//
//  HomeVC.swift
//  Posted
//
//  Created by Omar Leal on 15/7/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    @objc private func goToProfile() {
        let profileViewController = ProfileVC()
        navigationController?.pushViewController(profileViewController, animated: true)
        
        
    }
    
    private func configureNavigationBar() {
        let SIZE: CGFloat =         36
        let logoImageView =         UIImageView(frame: CGRect(x: 0, y: 0, width: SIZE, height: SIZE))
        logoImageView.image =       UIImage(named: "logo")
        logoImageView.contentMode = .scaleToFill
        
        
        //To navigation bar
        let middleView =   UIView(frame: CGRect(x: 0, y: 0, width: SIZE, height: SIZE))
        middleView.addSubview(logoImageView)
        let profileImage = UIImage(systemName: "person")

        navigationItem.leftBarButtonItem = UIBarButtonItem(image: profileImage, style: .plain, target: self, action:#selector(goToProfile))
        navigationItem.titleView =          middleView
    }
    
    private let timelineTableView: UITableView = {
        let table = UITableView()
       // table.translatesAutoresizingMaskIntoConstraints = false
        table.register(HomeTableCell.self, forCellReuseIdentifier: HomeTableCell.cellID)
        
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(timelineTableView)
        timelineTableView.delegate = self
        timelineTableView.dataSource = self
        
        configureNavigationBar()
        
    
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        timelineTableView.frame = view.frame
    }
    
    

}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 120
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let customCell = tableView.dequeueReusableCell(withIdentifier: HomeTableCell.cellID, for: indexPath) as? HomeTableCell else {
            return UITableViewCell()
        }
        
        customCell.delegate = self
        
        return customCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
}

extension HomeViewController: HomeTableViewCellDelegate {
    func handleReplyButton() {
        print("Method to reply")
    }
    
    func handleLikeButton() {
        print("Method to like")
    }
    
    func handleShareButton() {
        print("Method to share something")
    }
    
    
}
