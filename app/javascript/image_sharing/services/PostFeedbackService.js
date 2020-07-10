import { post } from '../utils/helper';

export class PostFeedbackService {
  constructor(store) {
    this.stores = store;
    this.params = {
      user_name: store.userName,
      comments: store.comments
    };
  }

  postFeedback = () => {
    return post('/api/feedbacks', this.params).then((data) => {
      this.stores.response = data.message;
      this.stores.userName = '';
      this.stores.comments = '';
    }).catch((e) => {
      this.stores.response = 'Save Unsuccessful';
    });
  };
}

export default PostFeedbackService;
