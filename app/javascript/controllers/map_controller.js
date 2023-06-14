import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="map"
export default class extends Controller {
  static targets = [
    "state",
    "instructions",
    "collective"
  ]
  connect() {

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

    // JOGAR O ID NA QUERY

    // AJAX to apply the filtering
  }
  }
