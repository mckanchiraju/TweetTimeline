import axios from 'axios';
import { FETCH_EVENTS } from './types';

const ROOT_URL = 'http://localhost:3000';

const fetchEvents = () => {
  return {
    type: FETCH_EVENTS,
    payload: []
  };
};

export { fetchEvents };
