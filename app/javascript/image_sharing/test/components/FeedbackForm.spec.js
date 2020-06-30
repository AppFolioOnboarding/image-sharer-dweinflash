import React from 'react';
import { mount } from 'enzyme';
import { expect } from 'chai';
import FeedbackForm from '../../components/FeedbackForm';
import { Form, Button, Input } from 'reactstrap';

describe('FeedbackForm Test', () => {
  it('form should render components and FeedbackStore should be able to store userName and comments', () => {
    const feedbackStore = { feedbackStore: {} };
    const wrapper = mount(<FeedbackForm store={feedbackStore} />);

    const form = wrapper.find(Form);
    expect(form).to.have.length(1);

    feedbackStore.userName = 'name';
    feedbackStore.comments = 'comment';

    expect(feedbackStore.userName).to.have.length(4);
    expect(feedbackStore.comments).to.have.length(7);

    const inputName = form.find(Input).at(0);
    const inputComments = form.find(Input).at(1);

    expect(inputName.props()).to.deep.equal({
      className: 'js-username',
      type: 'text'
    });

    expect(inputComments.props()).to.deep.equal({
      className: 'js-comments',
      type: 'textarea'
    });

    const button = form.find(Button);
    expect(button).to.have.length(1);
  })
});
