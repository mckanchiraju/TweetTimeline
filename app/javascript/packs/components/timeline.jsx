import React from 'react';
import { connect } from 'react-redux';
import * as actions from '../actions';

class Timeline extends React.Component {
  componentWillMount() {
    this.props.fetchEvents();   
  }

  renderEvent(event) {
    
  }

  render() {
    return (
      <section id="cd-timeline" className="cd-container">
       { this.props.events.map(this.renderEvent) }  
      </section>
    );
  }
}

const mapStateToProps = (state) => {
  return { events: state.events };
};

export default connect(mapStateToProps, actions)(Timeline);
