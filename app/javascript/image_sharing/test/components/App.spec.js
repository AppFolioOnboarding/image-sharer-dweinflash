import { mount } from 'enzyme';
import { expect } from 'chai';
import { describe, it } from 'mocha';
import React from 'react';
import App from '../../components/App';
import FeedbackForm from '../../components/FeedbackForm';
import Header from '../../components/Header';
import Footer from '../../components/Footer';

describe('App Test', () => {
  it('app should render components', () => {
    const feedbackStore = { feedbackStore: {} };
    const wrapper = mount(<App stores={feedbackStore} />);

    const header = wrapper.find(Header);
    const footer = wrapper.find(Footer);
    const form = wrapper.find(FeedbackForm);

    expect(header).to.have.length(1);
    expect(footer).to.have.length(1);
    expect(form).to.have.length(1);
  });
});
