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
    const feedbackStore = this.props.stores.feedbackStore;
    return (
      <div>
        <Header title={'Tell us what you think'} />
        <FeedbackForm store={feedbackStore} />
        <Footer />
      </div>
    )
  }
}

export default inject(
  'stores'
)(App);
