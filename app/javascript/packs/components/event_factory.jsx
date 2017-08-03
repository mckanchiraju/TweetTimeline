import React from 'react';
import TweetEvent from './tweet_event';
import HeadlineEvent from './headline_event';

export default class EventFactory {
  static build(event) {
    switch (event.type) {
      case 'tweet':
        return <TweetEvent key={event.id} {...event} />;
      case 'headline':
        return <HeadlineEvent key={event.id} {...event} />;
      default: 
        console.warn(`event type unknown: ${event.type}`);
    }
  } 
};
