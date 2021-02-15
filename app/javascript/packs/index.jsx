import React from 'react';
import ReactDOM from 'react-dom';
import App from '../components/App/App';
import { BrowserRouter as Router, Route } from 'react-router-dom';

// // import PropTypes from 'prop-types'

// const Hello = props => {
//     console.log("here", props)
//     return (<div>Hello {props.name}!</div>)

// }

// Hello.defaultProps = {
//     name: 'Caleb'
// }

// // Hello.propTypes = {
// //     name: PropTypes.string
// // }


document.addEventListener('DOMContentLoaded', () => {
    ReactDOM.render(
        <App />,
        // < Hello name="React222333" />,
        document.body.appendChild(document.createElement('div')),
    );
})