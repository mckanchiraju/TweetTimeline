import React from 'react';
import ReactDOM from 'react-dom';

export default class Event extends React.Component {
	constructor() {
		super();
		
		this.state = {
			inView: false,
			scrollHandler: this.setVisibility.bind(this)
		};
	}

	componentDidMount() {
    this.setVisibility();
		window.addEventListener('scroll', this.state.scrollHandler);
	}

	setVisibility() {
		let rect = ReactDOM.findDOMNode(this).getBoundingClientRect();

		if ((window.innerHeight * 0.88) > rect.top) {
			this.setState({
				inView: true
			});
			window.removeEventListener('scroll', this.state.scrollHandler);
		} 
	}
};
