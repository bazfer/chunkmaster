import { Controller } from "stimulus"

export default class extends Controller {
  connect() {
    console.log('Active Chunk Stimulus Controller: Connected')
  }

  start() {
    const activeChunk = document.getElementById('active-chunk')
  }
}
