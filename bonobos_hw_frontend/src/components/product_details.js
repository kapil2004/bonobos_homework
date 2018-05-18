import React from 'react';

const ProductDetails = ({product}) => {
  if (!product) {
    return <div>Search Product...</div>;
  }

  const pieces = product['pieces'].map((piece) => {
    return (
      <li className="list-group-item">
        Waist: {piece.waist}, Length: {piece.length}, Style: {piece.style_name}, Count: {piece.count}
      </li>
    );
  });

  return (
    <div className="product-detail com-md-8">
      <img src={ product.image } />
      <div>
        <label>Name: </label> { product.name }
      </div>
      <div>
        <label>Description: </label> { product.description }
      </div>
      <div>
        <h4>Inventory</h4>
        <ul className="col-md-4 list-group">
          {pieces}
        </ul>
      </div>
    </div>
  );
};

export default ProductDetails;
