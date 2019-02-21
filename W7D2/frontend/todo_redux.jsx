import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';

import Root from './components/root';

// const addLoggingToDispatch = store => {
//   const originalDispatch = store.dispatch;
//   return (action) => {
//     console.log('Action received: ', action);
//     console.log('State pre-dispatch: ', store.getState());
//     originalDispatch(action);

//     console.log('State post dispatch', store.getState());
//   };
// };

// const addLoggingToDispatch = store => next => action => {
//   console.log(action);
//   console.log(store.getState());
//   let result = next(action);
//   console.log(store.getState());
//   return result;
// }

const applyMiddlewares = (store, ...middlewares) => {
  let dispatch = store.dispatch;
  middlewares.forEach(middleware => dispatch = middleware(store)(dispatch));
  return Object.assign({}, store, { dispatch });
};


document.addEventListener('DOMContentLoaded', () => {
  const preloadedState = localStorage.state ?
    JSON.parse(localStorage.state) : {};

  let store = configureStore(preloadedState);
  // store = applyMiddlewares(store, addLoggingToDispatch);
  // store.dispatch = addLoggingToDispatch(store);

  const root = document.getElementById('content');
  ReactDOM.render(<Root store={store} />, root);
});
