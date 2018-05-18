import React, { Component } from 'react';

class SearchBar extends Component {
  constructor(props) {
    super(props);
    this.state = { term: '' };
    this.onFormSubmit = this.onFormSubmit.bind(this);
    this.onInputChange = this.onInputChange.bind(this);
  }

  onInputChange(event) {
    this.setState({ term: event.target.value });
  }

  onFormSubmit(event) {
    event.preventDefault();
    this.props.searchProduct(this.state.term);
    // this.setState({ term: '' });
  }

  render() {
    return (
      <div className="search-bar">
        <form onSubmit={ this.onFormSubmit } className="input-group">
          <input
            onChange={ this.onInputChange }
            value={ this.state.term } />
          <span className="input-group-btn">
            <button type="submit" className="btn btn-secondary">
              Submit
            </button>
          </span>
        </form>
      </div>
    );
  }
}

export default SearchBar;
