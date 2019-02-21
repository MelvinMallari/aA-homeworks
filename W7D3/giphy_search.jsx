import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';
import Root from './components/root';
import {fetchSearchGiphys} from './util/api_util';
import  {receiveSearchGiphys} from './actions/giphy_actions'

document.addEventListener('DOMContentLoaded', () => {
  // window.fetchSearchGiphys =  fetchSearchGiphys;
  const store = configureStore();
  window.store = store;
  window.receiveSearchGiphys = receiveSearchGiphys;
  window.fetchSearchGiphys = fetchSearchGiphys;
});