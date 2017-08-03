import { FETCH_EVENTS, EVENTS_LOADED } from '../actions/types';

export default (state=[], action) => {
  switch (action.type) {
    case EVENTS_LOADED:
      return [...state, ...action.payload.data];
  }

  return state;
}
