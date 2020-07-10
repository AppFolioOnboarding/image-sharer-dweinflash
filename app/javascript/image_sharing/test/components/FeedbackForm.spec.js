import React from 'react';
import { mount } from 'enzyme';
import { expect } from 'chai';
import FeedbackForm from '../../components/FeedbackForm';
import { Form, Button, Input, Alert } from 'reactstrap';
import sinon from 'sinon';
import * as api from '../../utils/helper';

describe('FeedbackForm Test', () => {
  it('FeedbackForm should render components', () => {
    const feedbackStore = { feedbackStore: {} };
    const wrapper = mount(<FeedbackForm store={feedbackStore} />);

    const form = wrapper.find(Form);
    expect(form).to.have.length(1);

    const inputName = form.find(Input).at(0);
    const inputComments = form.find(Input).at(1);

    expect(inputName.props()).to.deep.include({
      className: 'js-username',
      type: 'text'
    });

    expect(inputComments.props()).to.deep.include({
      className: 'js-comments',
      type: 'textarea'
    });

    const button = form.find(Button);
    expect(button).to.have.length(1);
  });

  it('FeedbackStore should store userName and comments', () => {
    const feedbackStore = { feedbackStore: {} };
    feedbackStore.userName = 'name';
    feedbackStore.comments = 'comment';

    expect(feedbackStore.userName).to.have.length(4);
    expect(feedbackStore.comments).to.have.length(7);

    const wrapper = mount(<FeedbackForm store={feedbackStore} />);
    const form = wrapper.find(Form);

    const inputName = form.find(Input).at(0);
    const inputComments = form.find(Input).at(1);

    expect(inputName.props()).to.deep.include({
      value: 'name'
    });

    expect(inputComments.props()).to.deep.include({
      value: 'comment'
    });
  });

  it('Should issue Post request with button submit', () => {
    const sandbox = sinon.createSandbox();
    const data = Promise.reject({});
    sandbox.stub(api, 'post').returns(data);

    const feedbackStore = { feedbackStore: {} };
    feedbackStore.userName = 'name';
    feedbackStore.comments = 'comment';

    const click = sinon.spy();
    const wrapper = mount(<FeedbackForm store={feedbackStore} onClick={click} />);
    const button = wrapper.find(Button);
    button.simulate('click');

    sinon.assert.calledOnce(api.post);

    const alert = wrapper.find(Alert);
    expect(alert).to.have.length(1);

    sandbox.restore();
  });
});
