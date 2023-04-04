## Description

Finish implementing CatImageCe1l - this is a UICollectionViewCell subclass that is supposed to fetch and show a cat's images.

To fetch the image, use CatImageCellModel. If the fetch fails due to a timeout, retry 2 times.
if we cannot fetch and show the proper model, show placeholderImage in imageView instead.
And finally, before prepare for reuse, please remove any existing image.

## Assumptions.
- Use Swift 5.1 (Xcode 11.1).
- Note that we use a lite version of UIKit so we can only guarantee the interfaces below. Nothing more should be needed for this task.
- You can use the Foundation's DispatchQueue for any work that you want to perform on specific queues.

