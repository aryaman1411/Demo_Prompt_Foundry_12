Creating a detailed starter code for an e-commerce application in Node.js would be quite extensive and beyond the scope of this platform. However, I can provide a basic structure and some sample code snippets to get you started.

Project Structure:
```
/myapp
  /node_modules
  /src
    /controllers
      - productsController.js
      - usersController.js
      - transactionsController.js
    /models
      - product.js
      - user.js
      - transaction.js
    /routes
      - productRoutes.js
      - userRoutes.js
      - transactionRoutes.js
    - server.js
  package.json
  .env
```

Sample Code:

server.js
```javascript
// Import required modules
const express = require('express');
const bodyParser = require('body-parser');

// Import routes
const productRoutes = require('./routes/productRoutes');
const userRoutes = require('./routes/userRoutes');
const transactionRoutes = require('./routes/transactionRoutes');

// Initialize express app
const app = express();

// Use body-parser middleware to handle incoming JSON
app.use(bodyParser.json());

// Use routes
app.use('/products', productRoutes);
app.use('/users', userRoutes);
app.use('/transactions', transactionRoutes);

// Error handling middleware
app.use((err, req, res, next) => {
  console.error(err.stack);
  res.status(500).send('Something broke!');
});

// Start server
const port = process.env.PORT || 3000;
app.listen(port, () => console.log(`Server running on port ${port}`));
```

productRoutes.js
```javascript
const express = require('express');
const router = express.Router();
const productsController = require('../controllers/productsController');

// Define routes
router.get('/', productsController.getAllProducts);
router.post('/', productsController.createProduct);
router.get('/:id', productsController.getProductById);
router.put('/:id', productsController.updateProduct);
router.delete('/:id', productsController.deleteProduct);

module.exports = router;
```

productsController.js
```javascript
const Product = require('../models/product');

// Get all products
exports.getAllProducts = async (req, res, next) => {
  try {
    const products = await Product.find();
    res.status(200).json(products);
  } catch (err) {
    next(err);
  }
};

// Add more functions for createProduct, getProductById, updateProduct, deleteProduct

module.exports = router;
```

This is a very basic structure and you would need to add more details based on your specific requirements. You would also need to set up your Azure resources and connect your application to them. For example, you would need to connect to your Azure SQL Database using a library like `mssql` and use it in your models to interact with your database.