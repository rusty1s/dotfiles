import React, { Component } from 'react';
import Autosuggest from 'react-autosuggest';

const options = {
  method: 'GET',
  mode: 'cors',
  headers: {
    Aaccept: 'application/json',
    'Access-Control-Allow-Origin': '*',
  },
};

console.log(options);

const getSuggestionsURL = value =>
  `http://suggestqueries.google.com/complete/search?output=firefox&hl=en&q=${value}`;

// https://duckduckgo.com/ac/?callback=autocompleteCallback&q=w&_=1501822218031
// https://scholar.google.de/scholar_complete?q=w&lr=&btnG=&hl=de

const getSuggestions = value => {
  console.log(getSuggestionsURL(value));
  return fetch(getSuggestionsURL(value), options)
    .then(response => console.log(response))
    .then(response => response.json())
    .then(json => json[1]);
};

const renderSuggestion = suggestion => <div>{suggestion}</div>;

export default class Search extends Component {
  state = {
    value: '',
    suggestions: [],
  };

  onChange = e =>
    this.setState({
      value: e.target.value,
    });

  onSuggestionsFetchRequested = ({ value }) =>
    getSuggestions(value).then(json => {
      console.log(json);
      this.setState({
        suggestions: [],
      });
    });

  onSuggestionsClearRequested = () =>
    this.setState({
      suggestions: [],
    });

  render() {
    const { value, suggestions } = this.state;

    const inputProps = {
      placeholder: 'Search term ...',
      value,
      onChange: this.onChange,
    };

    return (
      <div>
        {suggestions}
        <Autosuggest
          suggestions={suggestions}
          onSuggestionsFetchRequested={this.onSuggestionsFetchRequested}
          onSuggestionsClearRequested={this.onSuggestionsClearRequested}
          getSuggestionValue={x => x}
          renderSuggestion={renderSuggestion}
          inputProps={inputProps}
        />
      </div>
    );
  }
}
