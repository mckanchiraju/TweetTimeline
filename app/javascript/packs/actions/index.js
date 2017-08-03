import axios from 'axios';
import { FETCH_EVENTS, EVENTS_LOADED } from './types';

const ROOT_URL = 'http://localhost:3000';

const fetchEvents = (data) => {
  return (dispatch) => {
    const request = axios.get(`${ROOT_URL}/events.json`);

    request.then(response => {
      dispatch({type: EVENTS_LOADED, payload: response.data});
    });
  };
};

export { fetchEvents };
