import React, { useState, useEffect, Fragment } from 'react';
import axios from 'axios';
import Airline from './Airline';

const Airlines = () => {
    //set initialliny to an empty array, 
    //but airlines will be added to this array
    const [airlines, setAirlines] = useState([])

    useEffect(() => {
        //get all of the airlines from our api
        //update airlines in state
        axios.get('/api/v1/airlines.json') //url you wanna get data from
            .then(resp => {
                // console.log(resp)
                setAirlines(resp.data.data)
            })
            .catch(resp => console.log(resp))

        //this was passed in as a second argument because...??
        //the effect should only fire when the value changes
    }, [airlines.length])

    const grid = airlines.map(item => {
        return (
            <Airline
                key={item.attributes.name}
                attributes={item.attributes}
            />

        )
    })


    return (
        <div className="home">
            <div className="header">
                <h1>OpenFlights</h1>
                <div className="subheader"> Honest, unbiased airline reviews</div>
            </div>
            <div className="grid">
                <ul>{grid}</ul>
            </div>
        </div>
    )
}

export default Airlines