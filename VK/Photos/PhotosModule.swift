
//  VK
//
//  Created by Inna on 10.10.2024.
//

import UIKit

protocol PhotosModuleProtocol {
    func build(with viewController: PhotosViewController, idFriend: Int)
}

class PhotosModule {
    func build(with viewController: PhotosViewController, idFriend: String)  {
        let interactor = PhotosInteractor(idFriend: idFriend)
        let router = PhotosRouter()
        let presenter = PhotosPresenter(interactor: interactor, router: router)

        viewController.presenter = presenter
        presenter.view = viewController
        interactor.presenter = presenter
        router.viewController = viewController
    
    }
}
