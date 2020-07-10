import React from 'react';
import { expect } from 'chai';
import FeedbackStore from '../../stores/FeedbackStore';

describe('FeedbackStore Test', () => {
  it('store should save user name', () => {
    const store = new FeedbackStore();
    store.setUserName('David');
    expect(store.userName).to.equal('David');
  });

  it('store should save comments', () => {
    const store = new FeedbackStore();
    store.setComments('test');
    expect(store.comments).to.equal('test');
  });

  it('store should store response', () => {
    const store = new FeedbackStore();
    store.setResponse('test');
    expect(store.response).to.equal('test');
  });
});
