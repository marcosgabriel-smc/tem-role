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
  }

  StateEnter(event) {
  }
  // StateEnter(event) {
  //   const stateElement = event.currentTarget;
  //   const stateNameElement = document.getElementById('state-name');
  //   stateNameElement.innerHTML = stateElement.getAttribute("title");
  // }

  StateLeave(event) {
  }
  // StateLeave(event) {
  //   const stateElement = event.currentTarget;
  //   const stateNameElement = document.getElementById('state-name');
  //   const previousStateElement = document.querySelector('.selected-state');
  //   stateNameElement.innerHTML = previousStateElement.getAttribute("title"); // Reset to clicked state name
  // }

  StateClick(event) {
    const stateElement = event.currentTarget;
    const uf = stateElement.getAttribute('id');
    const stateName = stateElement.getAttribute('title');

    // Reset previously selected state
    const previousStateElement = document.querySelector('.selected-state');
    if (previousStateElement) {
      previousStateElement.style.fill = ""; // Revert to original color
      previousStateElement.classList.remove('selected-state');
    }
    // Set current state as selected
    // stateElement.style.fill = "red";

    stateElement.classList.add('selected-state');

    this.instructionsTarget.innerHTML = `<h3>${stateName}</h3>`;
    this.#createEventsByCityCards(uf)
  }

  #createEventsByCityCards(state) {
    this.eventsByCityTarget.innerHTML = ""

    fetch(`${window.location.origin}/events/state/${state}`)
      .then(response => response.json())
      .then((data) => {
        const content = data.content
        const cities = Object.keys(content)

        if (cities.length == 0) {
          this.#noEventsMessage()
          return
        }

        this.instructionsTarget.insertAdjacentHTML(
          'beforeend',
          `Confira abaixo os eventos em:`
        )

        cities.forEach((city) => {
          this.#generateEventsInCityHTML(city, content)
        })
      })
  }

  #generateEventsInCityHTML(city, content) {
    const cityId = city.toLowerCase().replace(/[^a-z0-9]+/g, '');
    const h2 = `<h2 id="${cityId}">${city}</h2>`
    let eventCards = "<div class=\"d-flex justify-content-center my-3 mx-2 row row-cols-3\">"
    content[city].forEach((eventCard) => {
      eventCards += eventCard
    })
    eventCards += "</div>"

    this.eventsByCityTarget.insertAdjacentHTML(
      'beforeend',
      h2 + eventCards
    )
    this.instructionsTarget.insertAdjacentHTML(
      'beforeend',
      `<br>- ${city}`
    )
  }

  #noEventsMessage() {
    this.instructionsTarget.insertAdjacentHTML(
      'beforeend',
      'Por enquanto não temos conteúdo nesse estado'
    )
  }

}
