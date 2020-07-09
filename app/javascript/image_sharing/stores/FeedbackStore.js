import { observable, action } from 'mobx';

export class FeedbackStore {
  @observable userName = '';
  @observable comments = '';
  @observable response = '';

  @action
  setUserName(userName) {
    this.userName = userName;
  }

  @action
  setComments(comment) {
    this.comments = comment;
  }

  @action
  setResponse(resp) {
    this.response = resp;
  }
}

export default FeedbackStore;
