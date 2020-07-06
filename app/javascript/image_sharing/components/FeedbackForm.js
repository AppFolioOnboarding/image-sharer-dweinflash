import React, { Component } from 'react';
import { Col, Button, Input, Form, Label, FormGroup } from 'reactstrap';

class FeedbackForm extends Component {
  render() {
    return (
      <Form>
        <Col lg={{ size: 4, offset: 4 }}>
          <FormGroup>
            <Label> Your name: </Label>
            <Input className='js-username' type="text" />
          </FormGroup>
          <FormGroup>
            <Label> Comments: </Label>
            <Input className='js-comments' type="textarea" />
          </FormGroup>
          <Button type="button" >Submit</Button>
        </Col>
      </Form>
    )
  }
}

export default FeedbackForm;
