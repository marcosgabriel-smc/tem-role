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

  // StateEnter(event) {
  //   const stateElement = event.currentTarget;
  //   const stateNameElement = document.getElementById('state-name');
  //   stateNameElement.innerHTML = stateElement.getAttribute("title");
  // }

  // StateLeave(event) {
  //   const stateElement = event.currentTarget;
  //   const stateNameElement = document.getElementById('state-name');
  //   const previousStateElement = document.querySelector('.selected-state');
  //   stateNameElement.innerHTML = previousStateElement.getAttribute("title"); // Reset to clicked state name
  // }

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

    stateNameElement.innerHTML = stateElement.getAttribute("title");
    this.#creatingCards(uf)
  }

  #creatingCards(state) {
    document.getElementById("cards-by-city").innerHTML = ""
    fetch(`${window.location.href}/state/${state}`)
      .then(response => response.json())
      .then((data) => {
        const cities = Object.keys(data.content)

        cities.forEach((city) => {
          const h2 = `<h2>${city}</h2>`
          let eventCards = "<div class=\"d-flex justify-content-center my-3 mx-2 row row-cols-3\">"
          data.content[city].forEach((eventCard) => {
            eventCards += eventCard
          })
          eventCards += "</div>"
          document.getElementById("cards-by-city").insertAdjacentHTML('beforeend', h2 + eventCards)
          // this.eventsByCityTarget.insertAdjacentHTML('beforeend', h2)
          // console.log(this.eventsByCityTarget, h2, eventCards)
        })

      })

  }

  }
