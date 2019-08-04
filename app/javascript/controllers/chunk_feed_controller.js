import { Controller } from 'stimulus'

export default class extends Controller {
  static targets = [ 'title', 'duration' ]

  connect() {
    console.log('Chunk Feed Controller: Connected')
  }

  create() {
    const activeChunk = document.getElementById('active-chunk')

    console.log('CREATE')


    this.data.set("title", value)
  }
}
