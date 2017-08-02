// Run this example by adding <%= javascript_pack_tag 'hello_react' %> to the head of your layout file,
// like app/views/layouts/application.html.erb. All it does is render <div>Hello React</div> at the bottom
// of the page.
import React from 'react';
import ReactDOM from 'react-dom';
import PropTypes from 'prop-types';
import { createStore, applyMiddleware } from 'redux';
import { Provider } from 'react-redux';
import Timeline from './components/timeline';
import reducers from './reducers';


const store = createStore(reducers, {});

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(
    <Provider store={store}><Timeline /></Provider>,
    document.body.appendChild(document.createElement('div')),
  )
});


/*
const Hello = props => (
  <div>Hello {props.name}!</div>
)

Hello.defaultProps = {
  name: 'David'
}

Hello.propTypes = {
  name: PropTypes.string
}
*/
