import React, { useState, useEffect } from 'react';
import axios from 'axios';

const Airline = (props) => {
    const [airline, setAirline] = useState({})
    const [review, setReview] = useState({})

    useEffect(() => {
        // api/v1/airlines/:slug
        //airline/united-airlines
        // console.log(props)

        const slug = props.match.params.slug
        //console.log("this is slug:", slug)

        const url = `/api/v1/airlines/${slug}`
        //console.log("this is url:", url)

        axios.get(url)
            .then(resp => console.log(resp))
            .catch(resp => console.log(resp))


    }, [])
    return <div>This is the Airlines#show view for our app.</div>
}

export default Airline