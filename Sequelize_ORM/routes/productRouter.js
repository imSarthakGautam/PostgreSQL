import productController from 


router.get('/allProducts', productController.getAllProducts)

router.get('/published', productController.getPublishedProduct)



// Review Url and Controller

router.get('/allReviews', reviewController.getAllReviews)
router.post('/addReview/:id', reviewController.addReview)

// get product Reviews
router.get('/getProductReviews/:id', productController.getProductReviews)




// Products router
router.get('/:id', productController.getOneProduct)

router.put('/:id', productController.updateProduct)

router.delete('/:id', productController.deleteProduct)

module.exports = router