import { mount } from 'enzyme';
import { expect } from 'chai';
import { describe, it } from 'mocha';
import React from 'react';
import Footer from '../../components/Footer';

describe('Footer Test', () => {
  it('should display footer text', () => {
    const wrapper = mount(<Footer />);
    const footerObj = wrapper.find('p');
    expect(footerObj.text()).to.equal('Copyright: AppFolio Inc. Onboarding');
  });
});
