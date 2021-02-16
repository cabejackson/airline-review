import React, { useState, useEffect, Fragment } from 'react';
import axios from 'axios';
import Header from './Header'
import styled from 'styled-components';
import ReviewForm from './ReviewForm';

const Wrapper = styled.div`
margin-left: auto;
margin-right: auto;
display: grid;
grid-template-columns: repeat(2, 1fr);

`
const Column = styled.div`
background: #fff;
height: 100vh;
overflow:scroll;

&:last-child {
    background: #000;
};
`
const Main = styled.div`
padding-left: 50px;
`

const Airline = (props) => {

    const [airline, setAirline] = useState({})
    const [review, setReview] = useState({
        title: "",
        description: "",
        score: 0,

    })
    const [loaded, setLoaded] = useState(false)

    useEffect(() => {
        // api/v1/airlines/:slug
        //airline/united-airlines
        // console.log(props)

        const slug = props.match.params.slug
        //console.log("this is slug:", slug)

        const url = `/api/v1/airlines/${slug}`
        //console.log("this is url:", url)

        axios.get(url)
            //updates the airline with the response data
            .then(resp => {
                setAirline(resp.data)
                //updates to true to let us know when we have our data
                setLoaded(true)
            })
            .catch(resp => console.log(resp))


    }, [])

    const handleChange = (e) => {

        // console.log('name:', e.target.name, 'value:', e.target.value)
        //how would you do this with a spread operator?
        setReview(Object.assign({}, review, { [e.target.name]: e.target.value }))
        // setReview(Object.assign({}, ...review, {[e.target.name]: e.target.value}))

        console.log('review', review)
    }
    //submit review to api & save to db
    const handleSubmit = (e) => {
        e.preventDefault()
        //take the review that's built in the review object from state
        //combine w/ an airline id, which is also in state
        //submit the data to api

        //take the data from the resp & update the state

        //update header w/ axios and pull in csrfToken
        //csrfToken?
        const csrfToken = document.querySelector('[name=csrf-token').content
        axios.defaults.headers.common['X-CSRF-TOKEN'] = csrfToken

        const airline_id = airline.data.id

        axios.post('/api/v1/reviews', { review, airline_id })
            .then(resp => {
                // debugger
                const included = [...airline.included, resp.data.data]
                setAirline({ ...airline, included })
                setReview({ title: "", description: "", score: 0 })
            })
            .catch(resp => { })
    }

    const setRating = (score, e) => {
        e.preventDefault()
        // debugger

        //update state to add the score into the review object
        setReview({ ...review, score })

    }



    return (
        <Wrapper>
            {
                loaded &&
                <Fragment>
                    <Column>
                        <Main>
                            <Header
                                attributes={airline.data.attributes}
                                reviews={airline.included}
                            />
                            <div className="reviews"></div>
                        </Main>
                    </Column>
                    <Column>
                        <ReviewForm
                            handleChange={handleChange}
                            handleSubmit={handleSubmit}
                            setRating={setRating}
                            attributes={airline.data.attributes}
                            review={review}
                        />
                    </Column>
                </Fragment>
            }
        </Wrapper>

    )
}

export default Airline