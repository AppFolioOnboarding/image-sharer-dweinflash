import React, { Component } from 'react';
import { observer } from 'mobx-react';
import { Col, Button, Input, Form, Label, FormGroup, Alert } from 'reactstrap';
import PostFeedbackService from '../services/PostFeedbackService';
import PropTypes from 'prop-types';

@observer
class FeedbackForm extends Component {
  static propTypes = {
    store: PropTypes.object.isRequired
  };

  onClickHandler = () => {
    const service = new PostFeedbackService(this.props.store);
    service.postFeedback();
  };

  render() {
    return (
      <div>
        {this.props.store.response !== '' && <Alert>{this.props.store.response}</Alert>}
        <Form>
          <Col lg={{size: 4, offset: 4}}>
            <FormGroup>
              <Label> Your name: </Label>
              <Input
                className='js-username'
                type="text"
                onChange={e => this.props.store.setUserName(e.target.value)}
                value={this.props.store.userName}
              />
            </FormGroup>
            <FormGroup>
              <Label> Comments: </Label>
              <Input
                className='js-comments'
                type="textarea"
                onChange={e => this.props.store.setComments(e.target.value)}
                value={this.props.store.comments}
              />
            </FormGroup>
            <Button type="button" color='primary' onClick={this.onClickHandler}>Submit</Button>
          </Col>
        </Form>
      </div>
    );
  }
}

export default FeedbackForm;
