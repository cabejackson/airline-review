import React from 'react'

const ReviewForm = (props) => {
    const { name } = props.attributes
    const { title, description } = props.review
    return (
        <div className="wrapper">
            <form action="" onSubmit={props.handleSubmit}>
                <div>Have an experience with {name}? share your review!</div>
                <div className="field">
                    <input
                        onChange={props.handleChange}
                        value={title}
                        type="text"
                        name="title"
                        placeholder="Review Title" />
                </div>
                <div className="field">
                    <input
                        onChange={props.handleChange}
                        value={description}
                        type="text"
                        name="description"
                        placeholder="Review Description"
                    />
                </div>
                <div className="field">
                    <div className="rating-container">
                        <div className="rating-title-text">Rate this Airline</div>
                        [Star Rating Goes Here]
                    </div>
                </div>
                <button type="submit">Submit Your Review</button>
            </form>

        </div>
    )
}

export default ReviewForm
