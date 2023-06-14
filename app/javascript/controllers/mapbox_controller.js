import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="mapbox"
export default class extends Controller {
  static values = {
    apiKey: String,
    marker: Object
  }
  connect() {
    mapboxgl.accessToken = this.apiKeyValue
    this.map = new mapboxgl.Map({
      container: this.element, // container ID
      style: 'mapbox://styles/mapbox/streets-v10', // style URL
    });
    this.#addMarkertoMap()
  }

  // Create a new marker, set the longitude and latitude, and add it to the map.
  #addMarkertoMap() {
    new mapboxgl.Marker()
    .setLngLat([-65.017, -16.457])
    .addTo(this.map);
  }
}
