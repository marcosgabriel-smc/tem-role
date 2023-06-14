import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="map"
export default class extends Controller {
  static targets = [
    "state",
    "instructions",
    "collective",
    "eventsByCity",
    "teste"
  ]

  connect() {
    console.log(this)
  }

  StateEnter(event) {
    const stateElement = event.currentTarget;
    const stateNameElement = document.getElementById('state-name');
    stateNameElement.innerHTML = stateElement.getAttribute("title");
  }

  StateLeave(event) {
    const stateElement = event.currentTarget;
    const stateNameElement = document.getElementById('state-name');
    const previousStateElement = document.querySelector('.selected-state');
    stateNameElement.innerHTML = previousStateElement.getAttribute("title"); // Reset to clicked state name
  }

  StateClick(event) {
    const stateElement = event.currentTarget;
    const uf = stateElement.getAttribute('id');
    const stateNameElement = document.getElementById('state-name');
    // Reset previously selected state
    const previousStateElement = document.querySelector('.selected-state');
    if (previousStateElement) {
      previousStateElement.style.fill = ""; // Revert to original color
      previousStateElement.classList.remove('selected-state');
    }
    // Set current state as selected
    stateElement.style.fill = "red";
    stateElement.classList.add('selected-state');

    this.instructionsTarget.remove();
    stateNameElement.innerHTML = stateElement.getAttribute("title");
  }

  #creatingCards() {
    fetch(`${window.location.href}/state/${uf}`)
      .then(response => response.json())
      .then((data) => {
        const cities = Object.keys(data.content)

        cities.forEach((city) => {
          const h2 = `<h2>${city}</h2>`
          let eventCards;

          data.content[city].forEach((eventCard) => {
            eventCards += eventCard
          })

          console.log(this)
          // this.eventsByCityTarget.insertAdjacentHTML('beforeend', h2)
          // console.log(this.eventsByCityTarget, h2, eventCards)
        })

      })

  }

  }
