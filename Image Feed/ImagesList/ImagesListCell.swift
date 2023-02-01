import UIKit

final class ImagesListCell: UITableViewCell {
    @IBOutlet private weak var cellImage: UIImageView!
    @IBOutlet private weak var likeButton: UIButton!
    @IBOutlet private weak var dateLabel: UILabel!
}

extension ImagesListCell {
    func configure(image: UIImage?, date: String, isLiked: Bool) {
        cellImage.image = image
        dateLabel.text = date

        let likeImage = isLiked ? UIImage(named: "like_button_on") : UIImage(named: "like_button_off")
        likeButton.setImage(likeImage, for: .normal)
    }
}
