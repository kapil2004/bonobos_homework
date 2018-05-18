import React, { Component } from 'react';
import ReactDOM from 'react-dom';
import axios from 'axios';

import SearchBar from './components/search_bar';
import ProductDetails from './components/product_details';

class App extends Component {
  constructor(props) {
    super(props);
    this.state = { product: null };
    this.productSearch = this.productSearch.bind(this);
  }

  productSearch(term) {
    console.log('term ', term);
    axios.get(`http://localhost:3000/products/search?term=${term}`)
      .then((res) => {
        console.log('res ', res.data);
        this.setState({ product: res.data });
      });
  }

  render() {
    return (
      <div>
        <SearchBar searchProduct={ this.productSearch } />
        <ProductDetails product={ this.state.product } />
      </div>
    );
  }
}

ReactDOM.render(<App />, document.querySelector('.container'));
