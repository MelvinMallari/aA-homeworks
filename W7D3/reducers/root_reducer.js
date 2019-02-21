import { combineReducers } from 'redux';
import { giphysReducer } from './giphys_reducer';

// We assign different slices of state to their reducers and create the application state. 
export default combineReducers({
  giphys: giphysReducer
});