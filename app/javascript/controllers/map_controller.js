import { Controller } from "@hotwired/stimulus"
import mapboxgl from 'mapbox-gl'

// Connects to data-controller="map"
export default class extends Controller {
  static values = {
  apiKey: String,
  markers: Array
  }
  connect() {
    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/dark-v11"
    })
    this.#addMarkersToMap()
    this.#fitMapToMarkers()
    setTimeout(() => {
    this.map.resize()
    this.#fitMapToMarkers() // Re-center after resize
    }, 100)
  }
  #addMarkersToMap() {
  const marker = this.markersValue[0]
  const popup = new mapboxgl.Popup().setHTML(marker.info_window_html)
  const customMarker = document.createElement("div")
  customMarker.innerHTML = marker.marker_html
  new mapboxgl.Marker(customMarker)
    .setLngLat([marker.lng, marker.lat])
    .setPopup(popup)
    .addTo(this.map)
  }
  #fitMapToMarkers() {
    if (this.markersValue.length === 1) {
      const marker = this.markersValue[0]
      this.map.setCenter([marker.lng, marker.lat])
      this.map.setZoom(4)
    }
  }

}
