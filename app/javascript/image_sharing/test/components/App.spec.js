import { mount } from 'enzyme';
import { expect } from 'chai';
import { describe, it } from 'mocha';
import React from 'react';
import App from '../../components/App';
import assert from 'assert';

describe('App Test', () => {
  it('should display app header text', () => {
    const wrapper = mount(<App />);
    const headerText = 'Tell us what you think';
    const header = <h3 className='text-center'>{headerText}</h3>
    expect(wrapper.contains(header)).to.equal(true);
  });
});
