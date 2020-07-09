import React from 'react';
import sinon from 'sinon';
import { expect } from 'chai';
import PostFeedbackService from '../../services/PostFeedbackService';
import FeedbackStore from '../../stores/FeedbackStore';
import * as api from '../../utils/helper';


describe('PostFeedbackService', () => {
  let sandbox;

  beforeEach(() => {
    sandbox = sinon.createSandbox();
  });

  afterEach(() => {
    sandbox.restore();
  });

  it('should set Save Unsuccessful response with empty store', () => {
    const data = Promise.reject({});
    sandbox.stub(api, 'post').returns(data);

    const dummyStore = { FeedbackStore: {} };

    const service = new PostFeedbackService(dummyStore);
    var spy = sinon.spy(service, 'postFeedback');

    return service.postFeedback().then(() => {
      sinon.assert.calledOnce(spy);
      expect(service.stores.response).to.equal('Save Unsuccessful');
    });
  });

  it('should set Save Unsuccessful response when store excludes user name', () => {
    const data = Promise.reject({});
    sandbox.stub(api, 'post').returns(data);

    const dummyStore = new FeedbackStore();
    dummyStore.setUserName('');
    dummyStore.setComments('comment');

    const service = new PostFeedbackService(dummyStore);
    var spy = sinon.spy(service, 'postFeedback');

    return service.postFeedback().then(() => {
      sinon.assert.calledOnce(spy);
      expect(service.stores.response).to.equal('Save Unsuccessful');
    });
  });

  it('should set Save Unsuccessful response when store excludes comments', () => {
    const data = Promise.reject({});
    sandbox.stub(api, 'post').returns(data);

    const dummyStore = new FeedbackStore();
    dummyStore.setUserName('user');
    dummyStore.setComments('');

    const service = new PostFeedbackService(dummyStore);
    var spy = sinon.spy(service, 'postFeedback');

    return service.postFeedback().then(() => {
      sinon.assert.calledOnce(spy);
      expect(service.stores.response).to.equal('Save Unsuccessful');
    });
  });

  it('should set Save Successful response with correct store', () => {
    const data = Promise.resolve({ message: 'Save Successful' });
    sandbox.stub(api, 'post').returns(data);

    const dummyStore = new FeedbackStore();
    dummyStore.setUserName('name');
    dummyStore.setComments('comment');

    const service = new PostFeedbackService(dummyStore);
    var spy = sinon.spy(service, 'postFeedback');

    return service.postFeedback().then(() => {
      sinon.assert.calledOnce(spy);
      expect(service.stores.response).to.equal('Save Successful');
    });
  });
});
