import UIKit

final class TabBarController: UITabBarController {
    override func awakeFromNib() {
        super.awakeFromNib()
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        
        let imagesListViewController = storyboard.instantiateViewController(
            withIdentifier: "ImagesListViewController"
        )
        imagesListViewController.tabBarItem = UITabBarItem(
            title: "",
            image: UIImage(named: "mainNoActive"),
            selectedImage: UIImage(named: "mainActive")
        )
        
        let profileViewController = storyboard.instantiateViewController(
            withIdentifier: "ProfileViewController"
        )
        profileViewController.tabBarItem = UITabBarItem(
            title: "",
            image: UIImage(named: "profileNoActive"),
            selectedImage: UIImage(named: "profileActive")
        )
        
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .ypBlackIOS
        tabBar.standardAppearance = appearance
        
        self.viewControllers = [imagesListViewController, profileViewController]
    }
}
