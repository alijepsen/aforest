import React from 'react';
import { connect } from 'react-redux';
import { clearFlash } from '../actions/flash.js';

const fadeFlash = (dispatch) => {
  setTimeout( () => {
    dispatch(clearFlash())
  }, 10000)
}

const mapStateToProps = (state) => {
  return { flash: state.flash }
}

const Flash = ({ flash, dispatch }) => {
  if (flash.message) {
    return (
      <div id="alert" className={`alert alert-${flash.msgType}`}>
        <a className="close" onClick={ (e) =>
          { e.preventDefault
            dispatch(clearFlash())
           }}> &times;</a>
        {flash.message}
        { fadeFlash(dispatch) }
      </div>
    )
  } else {
    return null
  }
}

export default connect(mapStateToProps)(Flash);
