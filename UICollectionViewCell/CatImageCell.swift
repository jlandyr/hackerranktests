
import UIKit

class CatImageCell: UICollectionViewCell {
    
    private var imageView : UIImageView!
    private var retry = 0
    
    convenience init(imageView: UIImageView) {
        self.init()
        self.imageView = imageView
    }
    
    func set(model: CatImageCellModel) {
        model.fetchCatImage {[weak self] result in
            guard let self = self else {return}
            switch result {
            case .failure(let error):
                if error == .timeout, self.retry < 2 {
                    self.retry += 1
                    self.set(model: model)
                } else {
                    self.setImage(model.placeholderImage)
                }
            case .success(let image):
                self.setImage(image)
            }
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
    }
    
    private func setImage(_ image: UIImage) {
        DispatchQueue.main.async {
            self.imageView.image = image
        }
    }
}

enum ImageFetchingError : Error {
    case timeout
    case unknown
}

protocol CatImageCellModel {
    var placeholderImage : UIImage {get}
    func fetchCatImage(completion: @escaping (Result <UIImage, ImageFetchingError>) -> Void)
}
