import { Controller } from 'stimulus'
import consumer from '../channels/consumer'
import chunkFactory from '../shared/chunk_factory'

const cable = consumer
const chunk_feed = document.getElementById("chunk-feed-id")

export default class extends Controller {
  static targets = [ "container", "title", "duration" ]

  connect() {
    console.log('Chunk Feed Controller: Connected')
    let self = this
    cable.subscriptions.create(
      {
        channel: 'ChunkFeedChannel',
        chunk_feed_id: chunk_feed
      },
      {
        connected() {
          console.log('Chunk Feed: Established')
        },
        disconnected() {
          this.perform('unsubscribed')
          console.log('Chunk Feed: Terminated')
        },
        received(data) {
          console.log('Chunk Feed: Incoming Chunk')
          // if (data.completed_at) {
          //   self.statusTarget.innerText = "Chunk Completed!"
          //   self.element.classList.remove("active-chunk", "active-chunk--visible")
          //   location.reload();
          // } else {
          //   self.element.classList.add(["active-chunk", "active-chunk--visible"])
          // }
        }
      }
    )
  }

  create() {
    // add code to create active chunk but don't use 'active chunk' for identification
    // instead use indexes -- other wise a lot of CSS maneuvering needs to be done
    // after every chunk without reload

    const list = this.containerTarget
    const chunk = document.createElement('li')
    const content = chunkFactory({ title: this.titleTarget.value, duration: this.durationTarget.value })

    chunk.innerHTML = content
    chunk.classList.add('chunk')
    list.insertBefore(chunk, list.firstChild)

    console.log('Chunk Created and Rendered')
  }
}
