import React, { Component } from 'react';
import { inject } from 'mobx-react';
import Header from './Header';
import Footer from './Footer';
import FeedbackForm from './FeedbackForm';
import PropTypes from 'prop-types';

class App extends Component {
  static propTypes = {
    stores: PropTypes.object.isRequired
  };

  render() {
    const FeedbackStore = this.props.stores.FeedbackStore;
    return (
      <div>
        <Header title={'Tell us what you think'} />
        <FeedbackForm store={FeedbackStore} />
        <Footer />
      </div>
    )
  }
}

export default inject(
  'stores'
)(App);
