import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="mapbox"
export default class extends Controller {
  static values = {
    apiKey: String,
    marker: Object
  }
  connect() {
    mapboxgl.accessToken = this.apiKeyValue
    let marker = this.markerValue
    this.map = new mapboxgl.Map({
      container: this.element, // container ID
      style: 'mapbox://styles/marcosgabriel-smc/cliv3wc1n026k01p7ccahb4iv',// custom-dark version
      center: [marker.lng, marker.lat], // starting position [lng, lat]
      zoom: 13 // starting zoom
    });
    this.#addMarkertoMap()
  }

  // Create a new marker, set the longitude and latitude, and add it to the map.
  #addMarkertoMap() {
    let marker = this.markerValue
    new mapboxgl.Marker()
    .setLngLat([marker.lng, marker.lat])
    .addTo(this.map);
  }
}
