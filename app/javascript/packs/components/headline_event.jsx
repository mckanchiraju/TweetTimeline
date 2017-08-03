import React from 'react';
import Event from './event';

export default class HeadlineEvent extends Event {
  render() {
    const props = this.props;

    return (
      <div className="cd-timeline-block">
        <div className={`cd-timeline-icon cd-${props.type}`}>
          <i className="fa fa-newspaper-o"></i>
        </div>

        <div className={`cd-timeline-content ${this.state.inView ? 'bounce-in' : 'is-hidden'}`}>
          <h2>{props.title}</h2>
          <p>{props.content}</p>
          <span className="cd-date">{props.date}</span>
        </div>
      </div>
    );
  }
};
